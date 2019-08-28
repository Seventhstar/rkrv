Vue.component('v-date', {
  data() {
    return {
      model: "",
      idName: "",
      localName: "",
      localValue: 0,
      options: [],
      h_input: false
    }
  }, 
  
  props: ['name', 'placeholder'],
  template: `
        <div class="inp_w vdate">
        <datepicker 
          :value="$parent[name]"
          :monday-first="true"
          :placeholder="placeholder"
          @input="onUpdate($event)">
        </datepicker>
        <input type="hidden" :name="localName" :value="localValue" :id="idName">
        <div class="clear"><span @click="onClear()">×</span></div>
        
      </div>`,

  created() {
    let model = '';
    if (this.owner !== undefined) { 
      model = this.owner; 
    } else {         
      model = this.$parent.model; 
    }

    if (model === undefined) {
      this.idName = this.name;
      this.localName = this.name;
    } else {
      this.idName = model + "_" + this.name;
      this.localName = model + "[" + this.name + "]";
    }
    console.log('this.$parent[this.name]', this.$parent[this.name])
    if (this.$parent[this.name] != undefined) this.onUpdate(this.$parent[this.name])
  },

  methods: {
    format_date(date) {
      if (date!=undefined) date = new Date().toJSON().slice(0,10).replace(/-/g,'-');
      if (date.includes('-')) return date.split('-').join('.');
      return date;
    },

    onClear(){
      // console.log('onClear', 112);
      this.onUpdate(''); 
    },

    onUpdate(val) {
      console.log('onUpdate val', val, 'this.name', this.name)
      if (val === undefined) {this.$parent[this.name] = []; return;}
      // let label = (v_nil(val)) ? undefined : val;
      // this.localValue = this.format_date(val)
      this.localValue = val
      console.log('this.localValue ', this.localValue )
      this.$parent[this.name] = val                      
      this.$root.$emit('onInput', {value: this.localValue, key: this.k, index: this.index, name: this.name});
    },
  } 
})
