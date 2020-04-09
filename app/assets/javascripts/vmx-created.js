var m_created = {
  created: function () {
    this.$root.$on('onInput', this.onInput);
    this.$root.$on('modalYes', this.modalYes);
  },

  methods: {
    checkValid() {
      let valid = true
      let tooltip = ""
      this.required.forEach( (c, i) => {
        if (v_nil(this[c], true)) {
          valid = false
          tooltip = tooltip + this.requiredTranslated[i] + ', '
        }
      })

      if (!valid) tooltip = "Не заполнены поля: " + tooltip.slice(0, -2)
      this.noteValid = tooltip
      this.formValid = valid
    },

    onSubmit(event) {
      // console.log('event', event)
      if (event && !this.formValid) {
        event.preventDefault();
        show_ajax_message(this.noteValid, 'error')
      }
    },

    modalYes(){
      if (this.currentIndex === '' || !this.confirmModal ) return
      let index = this.mainList.indexOf(this.currentIndex);

      if (index<0) return;
      this.mainList.splice(index, 1);
      delete_item("/" + this.controller + "/" + this.currentIndex.id)
      this.fGroup()
    },
  }
}