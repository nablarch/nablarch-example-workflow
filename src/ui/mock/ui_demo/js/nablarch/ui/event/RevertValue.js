define(['jquery', 'sugar'],
function($) { 'use strict';
  var preValueKey = 'revertAction-preValue';

  RevertValue.prototype = {
      constructor : RevertValue
    , isActive : true
    , $target  : null
    , init     : RevertValue_init
    , store    : RevertValue_store
    , revert   : RevertValue_revert
  };

  function RevertValue(activate) {
    this.constructor = RevertValue;
    this.isActive = activate;
  }

  function RevertValue_init(listener) {
    if (!this.isActive) {return;}
    var $context = listener.$context
     ,  target   = listener.event.split(/\s+/).first()
     ,  $target  = $context.find(target);
    this.$target = $target;
    this.store();
  }

  function RevertValue_store() {
    if (!this.isActive) {return;}
    this.$target.each(function() {
      var $this = $(this)
        ,  val  = $this.is(':checkbox, :radio')
                ? !!$this.prop('checked') : $this.val();
      $this.data(preValueKey, val);
    });
  }

  function RevertValue_revert() {
    if (!this.isActive) {return;}
    this.$target.each(function() {
      var $this = $(this)
        , val   = $this.data(preValueKey);
      $this.is(':checkbox, :radio') ? $this.prop('checked', val)
                                    : $this.val(val);
    });
  }
  return RevertValue;
});