var http = require('http');
var fs = require('fs');
var url = require("url");

var WEB_ROOT   = __dirname + '/../'
    // ポート番号
  , PORT = 8888
    // インデックスページにリストアップしないディレクトリ名
  , ignoreDirs = ['tools', 'include']
  , pageList   = []
  , pageMap    = {};

crawl(WEB_ROOT);

function crawl(path) {
  var stat = fs.statSync(path);

  return stat.isDirectory() ? crawlDir(path)
       : stat.isFile()      ? addToList(path)
       : null;

  //----- subroutines -----//
  function crawlDir(path) {
    fs.readdirSync(path).forEach(function(fileName) {
      if (ignoreDirs.indexOf(fileName) !== -1) {
        return;
      }
      crawl(path + '/' + fileName);
    });
  }

  function addToList(path) {
    var jspPage = /.*\/([^\/]+)\.jsp$/.exec(path);
    if (jspPage) {
      pageList.push(path);
      pageMap[jspPage[1]] = path;
    }
  }
}

function tool_path(path) {
  path = path.substr(1);
  var index = path.indexOf("/tools");
  if (index != -1) {
    return path.substr(index);
  }
  index = path.indexOf('/specsheet_template')
  if (index != -1) {
    return path.substr(index);
  } else {
    return path.replace(/.+\/(js|css|fonts|img)\//, "/$1/");
  }
}

var server = http.createServer(function(request, response) {
  var pathname = url.parse(request.url).pathname;
  var filename  = pathname.replace(/^.*\/([^\/]+)\.[a-z]+$/, "$1");
  var extension = pathname.replace(/.+\./, "");
  var file_path = "";

  if (pathname === '/') {
    return indexPage(response);
  }

  if (extension === "jsp") {
    try {
      file_path = WEB_ROOT + decodeURI(pathname);
    } catch (e) {
      console.log(pathname)
    }
    response.setHeader('Content-Type', 'text/html; charset=utf-8');
  } else if (extension === 'css') {
    file_path = WEB_ROOT + tool_path(decodeURI(pathname));
    response.setHeader('Content-Type', 'text/css; charset=utf-8');
  } else if (extension === 'htm') {
    file_path = WEB_ROOT + tool_path(decodeURI(pathname));
    response.setHeader('Content-Type', 'text/html; charset=utf-8');
  } else {
    file_path = WEB_ROOT + tool_path(decodeURI(pathname));
  }

  try {
    if (!fs.existsSync(file_path) && pageMap[filename]) {
      file_path = pageMap[filename];
    }
    var file = fs.readFileSync(file_path, 'binary');
    response.writeHead(200);
    response.write(file, 'binary');
  } catch (e) {
    response.writeHead(404);
    response.write('<h1>404 Not Found!!!</h1>')
  }
  response.end();

  //----- subroutines ------//
  function indexPage(response) {
    response.setHeader('Content-Type', 'text/html; charset=utf-8');
    response.write(pageList.map(renderLink).join('<br/>'));
    response.end();
    return;

    function renderLink(path) {
      var path = ('./' + path.replace(WEB_ROOT, '')).replace(/\/+/g, '/');
      return '<a href="' + path + '">' + path + '</a>';
    }
  }
});

server.listen(PORT);
