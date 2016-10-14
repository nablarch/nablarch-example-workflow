runTest(
  出力結果の確認
);

function 出力結果の確認() {"use strict";
  ok(nablarch_device.type, "nablarch_device.typeが出力されること[" + nablarch_device.type + "]");
  ok(nablarch_device.version, "nablarch_device.versionが出力されること[" + nablarch_device.version + "]");
  ok(nablarch_device.browser, "nablarch_device.browserが出力されること[" + nablarch_device.browser + "]");
  ok(nablarch_device.browserVersion, "nablarch_device.browserVerが出力されること[" + nablarch_device.browserVer + "]");
}