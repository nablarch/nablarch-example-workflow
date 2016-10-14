cd %~dp0

mkdir tools\\tmp\\test-data
mkdir tools\\tmp\\web\\format

start tools\\index.html

java -cp "tools\\tmp;tools\\bin\\;tools\\lib\\*;WEB-INF\\lib\\*" ui_test.AppServer "./" 7777

pause


