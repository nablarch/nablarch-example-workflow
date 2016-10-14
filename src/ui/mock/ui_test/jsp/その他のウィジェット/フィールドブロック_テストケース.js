runTest(
  title属性のテスト, id属性のテスト, collapsibleのテスト, showTitle属性のテスト);

/**
 * 必須属性（以下項目）のテストを実施する。
 *
 * <ul>
 *   <li>title属性</li>
 * </ul>
 */
function title属性のテスト() {
  var find_title = function(test_case) {
    $test_block = find_block(test_case)
      , $title = $test_block.find('h2');
    return $.trim($title.html());
  }
  equal(find_title('not-title'), '', 'title未指定:titleは空であること');
  equal(find_title('title-blank'), '', 'titleブランク:titleは空であること');
  equal(find_title('title'), 'タイトル指定', 'title指定:指定した値が設定されること');
}

/**
 * id属性のテストを実施する。
 */
function id属性のテスト() {
  var find_id = function(test_case) {
    var $test_block = find_block(test_case)
    return $test_block.attr('id');
  }

  equal(find_id('not-id'), '', 'id未指定:id属性は存在しないこと');
  equal(find_id('id-blank'), '', 'idブランク:id属性は存在しないこと');
  equal(find_id('id'), 'test-id', 'id指定:指定した値がid属性に設定されること');

}

/**
 * collapsible属性のテスト
 */
function collapsibleのテスト() {
  var find_title = function (test_case) {
      var $test_block = find_block(test_case)
      $title = $test_block.find('h2');
      return $title;
    },
    assert_not_collapsible = function (test_case, expectedTitle) {
      var $title = find_title(test_case);

      equal($title.html().trim(), expectedTitle, test_case + ':titleが想定通り出力されること');
      ok(!$title.hasClass('nablarch_Collapsible'), test_case + ':開閉可能を示すマーカCSSが設定されないこと');
    },
    assert_collapsible = function(test_case, expectedTitle, closed) {
      var $title = find_title(test_case);

      equal($title.text().trim(), expectedTitle, test_case + ':titleが想定通り出力されること');
      ok($title.hasClass('nablarch_Collapsible'), test_case + ':開閉可能を示すマーカCSSが設定されること');
      equal($title.hasClass('-closed'), closed, test_case + ':開閉状態が想定通り出力されること');
    }


  // 開閉可能とならない場合のケース
  assert_not_collapsible('not-collapsible', 'collapsible未指定');
  assert_not_collapsible('collapsible-blank', 'collapsibleブランク');
  assert_not_collapsible('collapsible-false', 'collapsible:false');

  // 開閉可能となる場合のケース
  assert_collapsible('collapsible-true', 'collapsible:true', false);
  assert_collapsible('collapsible-true-closed', 'collapsible:true(closed)', true);
}

function showTitle属性のテスト() {

  var find_title = function(test_case) {
    $test_block = find_block(test_case)
      , $title = $test_block.find('h2');
    return $.trim($title.html());
  }

  equal(find_title('not-showtitle'), 'showTitle未指定', 'showTitle未指定:タイトルが表示されること');
  equal(find_title('showtitle-blank'), 'showTitleブランク', 'showTitleブランク:タイトルが表示されること');
  equal(find_title('showtitle-true'), 'showTitle:true', 'showTitle:true:タイトルが表示されること');
  ok(find_block('showtitle-false').is(':not(:has(h2))'), 'showTitle:false:タイトルが表示されないこと');

}


function find_block(test_case) {
  var test = $('span.test-case.' + test_case);
  return test.next('div.title');
}

