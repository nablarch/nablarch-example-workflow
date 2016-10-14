require(['jquery', 'nablarch/ui/event', 'sugar']
,function($, event){
  runTest(
    parseのテスト
  );

  function parseのテスト() {
    var actual;
    ok(Object.isFunction(event.parse), "parseメソッドが実装されている。");

    actual = event.parse("#forTestInput change", "form");
    equal(actual.context, "form", "target eventTypeパターン[渡したコンテキストがcontextに設定されていること]");
    equal(actual.target,    "#forTestInput", "target eventTypeパターン[パラメータから期待したtargetが取得できること]");
    equal(actual.eventType, "change",        "target eventTypeパターン[パラメータから期待したeventTypeが取得できること]");

    actual = event.parse("event", "form");
    equal(actual.context,  "form", "evnetTypeパターン[渡したコンテキストがcontextに設定されること]");
    equal(actual.target,    "form", "evnetTypeパターン[渡したコンテキストがtarget設定されること]");
    equal(actual.eventType, "event", "eventTypeパターン[パラメータから期待したeventTypeが取得できること]");

    actual = event.parse("form #forTestInput focus");
    equal(actual.context, "form", "context target eventTypeパターン[先頭が$contextに設定されること");
    equal(actual.target, "#forTestInput", "context target eventTypeパターン[2つめの文字列がtargetに設定されること");
    equal(actual.eventType, "focus", "context target eventTypeパターン[3つめの文字列がeventTypeに設定されること");
  }

  // 以下は未実装
  function beforeSubmitのテスト() {
    ok(false, 'テスト未実装');
  }

  function afterSubmitのテスト() {
    ok(false, 'テスト未実装');
  }
});

