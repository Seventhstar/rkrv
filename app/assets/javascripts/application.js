// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require vue
//= vuejs-datepicker.ru
//= require_tree .

function toInt(d){
  if (isNaN(d)) return 0;
  if (v_nil(d)) return 0;
  return parseInt(d);
}

function to_sum(d){ 
  if (isNaN(d)) return 0;
  s = d.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1 ");
  return s;
}

var v_nil = function(v, zeroIsNil = false){ 
  if (typeof(v) == "object") 
    return v === null || v === undefined || v.value === undefined || v.value === 0;

  if (zeroIsNil && v === 0) return true
  
  return v === null || v === undefined || v === '';
}

var e_nil = function(id) {
  return e_val(id) === "";
}

var e_val = function(id) {
  let v = document.getElementById(id);
  if (v === null) return "";
  return v.value;
}

var format_date = function(date) {
  if (v_nil(date)) date = new Date().toJSON().slice(0,10).replace(/-/g,'-');
  if (date.includes('-')) return date.split('-').reverse().join('.');
  return date;
}

