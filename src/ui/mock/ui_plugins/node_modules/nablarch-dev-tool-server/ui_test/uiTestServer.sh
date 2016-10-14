# UI部品デモ画面サーバ起動スクリプト
mkdir -p ./tools/tmp/test-data
mkdir -p ./tools/tmp/web/format
java -cp 'tools/tmp:tools/bin:tools/lib/*:WEB-INF/lib/*' ui_test.AppServer './' 7777
