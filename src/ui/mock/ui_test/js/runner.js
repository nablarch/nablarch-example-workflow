function runTest(/*testcasees...*/) {
  var testcases = [].slice.call(arguments);
  
  setTimeout(function() {
    testcases.each(function(testcase) {
      QUnit.test(nameOf(testcase), testcase);
    });
  }, 3000);
  
  function nameOf(func) {
    var name = func.name;
    return name ? name
                : eval('"' + /^function ([^\()]+)/.exec(func.toString())[1] + '"');      
  }
}
