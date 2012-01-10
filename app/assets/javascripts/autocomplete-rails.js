/*
* Unobtrusive autocomplete
*
* To use it, you just have to include the HTML attribute autocomplete
* with the autocomplete URL as the value
*
*   Example:
*       <input type="text" data-autocomplete="/url/to/autocomplete">
*
* Optionally, you can use a jQuery selector to specify a field that can
* be updated with the element id whenever you find a matching value
*
*   Example:
*       <input type="text" data-autocomplete="/url/to/autocomplete" data-id-element="#id_field">
*/
$(document).ready(function(){$("input[data-autocomplete]").railsAutocomplete()}),function(a){var b=null;a.fn.railsAutocomplete=function(){this.railsAutoCompleter||(this.railsAutoCompleter=new a.railsAutocomplete(this))},a.railsAutocomplete=function(a){_e=a,this.init(_e)},a.railsAutocomplete.fn=a.railsAutocomplete.prototype={railsAutocomplete:"0.0.1"},a.railsAutocomplete.fn.extend=a.railsAutocomplete.extend=a.extend,a.railsAutocomplete.fn.extend({init:function(a){function b(b){return b.split(a.delimiter)}function c(a){return b(a).pop().replace(/^\s+/,"")}a.delimiter=$(a).attr("data-delimiter")||null;var d=$(a).attr("append_to");$(a).autocomplete({autoFocus:$(a).attr("auto_focus")||!1,disabled:$(a).attr("disabled")||!1,delay:$(a).attr("delay")||300,appendTo:d||"body",postion:$(a).attr("position")||{my:"left top",at:"left bottom",collision:"none"},source:function(b,d){$.getJSON($(a).attr("data-autocomplete"),{term:c(b.term)},function(){$(arguments[0]).each(function(b,c){var d={};d[c.id]=c,$(a).data(d)}),d.apply(null,arguments)})},open:function(){d&&$(d+" ul.ui-autocomplete").css("position","static")},search:function(){var b=$(a).attr("min_length")||2,d=c(this.value);if(d.length<b)return!1},focus:function(){return!1},select:function(c,d){var f=b(this.value);f.pop(),f.push(d.item.value);if(a.delimiter!=null)f.push(""),this.value=f.join(a.delimiter);else{this.value=f.join(""),$(this).attr("data-id-element")&&$($(this).attr("data-id-element")).val(d.item.id);if($(this).attr("data-update-elements")){var g=$(this).data(d.item.id.toString()),h=$.parseJSON($(this).attr("data-update-elements"));for(var i in h)$(h[i]).val(g[i])}}var j=this.value;return $(this).bind("keyup.clearId",function(){$(this).val().trim()!=j.trim()&&($($(this).attr("data-id-element")).val(""),$(this).unbind("keyup.clearId"))}),$(this).trigger("railsAutocomplete.select"),!1}})}})}(jQuery)