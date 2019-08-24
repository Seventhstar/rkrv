Vue.component('v-chosen', {
    data() {
      return {
        model: "",
        idName: "",
        localName: "",
        localValue: 0,
        nameParts: '',
        options: [],
        h_input: false,
        clearable: false
      }
    }, 
    props: ['name', 'placeholder', 'label', 'src', 'selected', 
            'owner', 'k', 'index', 'from_array', 'clear', 'input'],
    template: `
        <div class="inp_w">
        <v-select 
          :value="$parent[name]"
          :options="options"
          :clearable=clearable 
          :placeholder="placeholder"
          @input="onUpdate($event)">
          <template slot="option" slot-scope="option">
            <span v-if="option.mark" class='info'>{{ option.label }}</span>
            <span v-else-if="option.non_actual" class='nonactual'>{{ option.label }}</span>
            <template v-else>
              {{ option.label }}
            </template>
        </template>
        </v-select>
        
        <input type="hidden" :name="localName" :value="localValue" 
               v-if="model!=undefined && h_input" :id="idName">
        
      </div>`,

    created() {
      // console.log('input', this.input) reason
      this.h_input = this.input == true
      // this.h_input = true

       // console.log('this.clear', this.clear, typeof(this.clear))
      if (this.clear != undefined) this.clearable = (!this.clear)
      else 
        this.clearable = false

      let model = '';
      if (this.owner !== undefined) { 
        model = this.owner; 
      } else {         
        model = this.$parent.model; 
      }

      if (model === undefined) {
        this.idName = this.name + "_id";
        this.localName = this.name + "_id";
      } else {
        this.idName = model + "_" + this.name + "_id";
        this.localName = model + "[" + this.name + "_id]";
      }

      if (this.src !== undefined) {
          src = this.$parent[this.src];
          this.options = (this.from_array === undefined || src[this.index] === undefined) ? src : src[this.index][this.from_array];
      } else {
        this.options = this.$parent[this.name + "s"];
      }
      console.log('this.options', this.options)
      // console.log('this.selected', this.selected)
      console.log('this.$parent[this.name]', this.$parent[this.name], 'this.name', this.name)
      // this.hostCell = this.$parent[this.name]

      if (this.options !== undefined){
        if (this.selected !== undefined) {
          // console.log('selected type', typeof(this.selected), )
          // if (typeof(this.selected) == 'string')
              // this.options.indexOf(this.selected)
          this.onUpdate(this.options[this.selected])
        } else if (this.options.length === 1) {
          this.onUpdate(this.options[0])
        } else {
          let ind = this.options.indexOf(this.$parent[this.name])

        // if (this.name.includes('.')){
          // this.nameParts = this.name.split('.')
          // let current = this.$parent[this.nameParts[0]]
          // this.hostCell = this.$parent[this.nameParts[0]][this.nameParts[1]+'_id']
          // selected = {value: current[this.nameParts[1]+'_id'], label: current[this.nameParts[1]+'_name']}
          console.log('selected', this.$parent[this.name], 'ind', ind)
          // if (ind != -1) this.onUpdate(this.$parent[this.name])
        }
        if (this.options.indexOf(this.$parent[this.name]) === -1 && this.from_array !== undefined) {

          this.onUpdate()
        }
      }
    },

    methods: {
      onUpdate(val) {
        console.log('onUpdate val', val)
        if (val === undefined) {this.$parent[this.name] = []; return;}
        let label = (v_nil(val)) ? undefined : val.label;
        this.localValue = (v_nil(val)) ? 0 : val.value;

        // if (this.nameParts != ''){
          // this.$parent[this.nameParts[0]][this.nameParts[1]] = val
          // this.$parent[this.nameParts[0]][this.nameParts[1]+'_name'] = val.label
        // }
        // else 
        // this.$parent[this.name] = val
        // this.hostCell = val
                                     
        this.$root.$emit('onInput', {value: this.localValue, key: this.k, index: this.index, name: this.name, label: label});
      },
    } 
  })