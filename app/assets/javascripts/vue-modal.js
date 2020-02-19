    Vue.component("confirmation-modal", {
      data(){
        return {
          objName: "",
          question: ''
        }
      },
      template:`<div class="modal-dlg" @keyup.enter="onConfirm" @keyup.esc="$emit('close')" tabindex="0">
                  <div class="modal-message">
                    <div class="hl hl_a bd">{{question}}?</div>
                    <div class="actions">
                     <span class="btn sub btn_a btn_reset" @click="onCancel">Нет</span>
                     <span class="btn btn btn-default sub btn_a" @click="onConfirm">Да</span>
                     </div>
                  </div>
                </div>`,
      props: ["open", "user", "text"],

      mounted() {
        document.body.addEventListener('keyup', e => {
          console.log('keyup', e, e.code == "Escape")
          if (e.keyCode === 27 || e.code == "Escape") this.onCancel()
          else if (e.keyCode === 13) this.onConfirm();
        })  
      },

      created() {
        if (this.text != undefined && this.text.length > 0)
          this.question = this.text

        if (this.question.length == 0) {
          this.question = "Действительно хотите удалить" + this.objName
          // Действительно хотите удалить {{objName}}
        }

        if (typeof(this.$parent.currentTitle) == 'string')
          this.objName = '"' + this.$parent.currentTitle + '"'
        else if (typeof(this.$parent.currentIndex) == 'object')
          this.objName = '"' + this.$parent.currentIndex.name + '"'
      },

      methods: {
        onConfirm() {
          this.$root.$emit('modalYes');
          this.$parent.confirmModal = false
        },

        onCancel() {
          this.$root.$emit('modalCancel');
          this.$parent.confirmModal = false
        }
      }
    });