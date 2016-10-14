// 自動テストのサポートメソッドを提供する。
/**
 * nablarch_hiddenから値を取得する。
 *
 * @param $node nablarch_hiddenに値を格納したNodeのjqueryラッパー
 * @key nablarch_hiddenから取得するためのキー
 */
n_hidden_val = function($node, key) {
  var $form  = $node.closest('form')
    , n_text = $form.find('input[name="nablarch_hidden"]').val()
    , vals   = n_text.split('|')
    , filter = function(val) {return val.startsWith(key);}
    , data;
  data = vals.findAll(filter).first();
  return $.trim(data).endsWith('=') ? "" : data.split('=')[1];
};
