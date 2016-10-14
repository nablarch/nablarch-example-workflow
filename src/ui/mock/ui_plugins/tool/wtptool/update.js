// import statements
importClass(java.io.File);

// Access to Ant-Properties by their names
var projectName = project.getProperty("project-name");
var projectRootDir = project.getProperty("project-root.dir");
var nodeModulesDir = project.getProperty("node_modules.dir");
var settingFile = project.getProperty("setting.file");

// Create a <fileset dir="" includes=""/>
var fs = project.createDataType("dirset");
fs.setDir(new File(projectRootDir, nodeModulesDir));
fs.setIncludes("*/ui_public, */ui_test, */ui_local");


// Get the files (array) of that fileset
var ds = fs.getDirectoryScanner(project);
var srcFiles = ds.getIncludedDirectories();

var basedir  = fs.getDir(project);
var lines = [];
lines.push('<?xml version="1.0" encoding="UTF-8"?>');
lines.push('<project-modules id="moduleCoreId" project-version="1.5.0">');
lines.push('    <wb-module deploy-name="' + projectName + '">');
  
// iterate over that array
for (var i=0; i<srcFiles.length; i++) {
  // get the values via Java API
  var filename = "/" + nodeModulesDir + "/" + srcFiles[i];
  filename = filename.replace('\\', '/');
  lines.push('        <wb-resource deploy-path="/" source-path="' + filename + '"/>');
}
lines.push('        <wb-resource deploy-path="/WEB-INF/lib" source-path="/tool/wtptool/lib"/>');
lines.push('        <property name="java-output-path" value="/' + projectName + '/build/classes"/>');
lines.push('        <property name="context-root" value="/"/>');
lines.push('    </wb-module>');
lines.push('</project-modules>');

// create and use a Task via Ant API
echo = project.createTask("echo");
echo.setMessage(lines.join('\n'));
echo.setFile(new File(projectRootDir, settingFile));
echo.perform();

