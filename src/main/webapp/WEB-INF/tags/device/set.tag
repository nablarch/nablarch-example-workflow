<%--
  デバイス情報設定タグ
  @author takanori tani
--%>

<%@tag pageEncoding="UTF-8" description="動作環境に関する情報を設定するウィジェット" %>
<%@tag import="java.util.regex.Pattern" %>
<%@tag import="java.util.regex.Matcher" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%-- suppress jsp check:user-agentを判定してリクエストスコープにブラウザ、OS情報を設定する処理。tagファイルで実行する必要が有るため、チェック対象外とする --%>
<%!
  static class UserAgent {
    // OS has name and version
    private final String OS_VERSION_EXP = "[\\D+]*([\\d\\._]*)";
    private final Pattern DEVICE = Pattern.compile(".*(iphone;|ipad;|android)" + OS_VERSION_EXP +".*");
    private final Pattern OS = Pattern.compile(".*(windows|mac os x)"        + OS_VERSION_EXP +".*");

    // trident is mean Internet Explorer.(msie is not supported in IE11)
    private final String BROWSER_VERSION_EXPRESSION = "[\\s/]*([\\d\\.]*)";
    private final Pattern IE = Pattern.compile(".*(msie\\s|trident.+rv:)([\\d\\.]*)" + ".*");
    private final Pattern FIREFOX_CHROME = Pattern.compile(".*(firefox|chrome)"+ BROWSER_VERSION_EXPRESSION + ".*");
    private final Pattern IOS_SAFARI = Pattern.compile(".*version/([\\d\\.]*).+(mobile.*safari).*");
    private final Pattern ANDROID_BROWSER = Pattern.compile(".*android.*version/([\\d\\.]*).+(mobile *safari).*");
    private final Pattern SAFARI  = Pattern.compile(".*version/([\\d\\.]*).+(safari).*");

    String os = "Unknown";
    String osVer = "";
    String browser = "Unknown";
    String browserVer = "";

    /**
     * コンストラクタ
     *
     * @param uaText UAの文字列
     */
    public UserAgent(String uaText) {
      if (uaText == null) {
        return;
      }
      uaText = uaText.toLowerCase();
      setOS(uaText);
      setBrowser(uaText);
    }

    // os の タイプ、バージョンを設定する。
    private void setOS(String uaText) {
       Matcher os = DEVICE.matcher(uaText);
      if (os.matches() && os.groupCount() >= 2) {
        this.os = os.group(1).toLowerCase().replace(";", "");
        this.osVer = verExpr(os.group(2), "-");
        return;
      }
      os = OS.matcher(uaText);
      if (os.matches() && os.groupCount() >= 2) {
        this.os = os.group(1).toLowerCase().replace(" ", "_");
        this.osVer = verExpr(os.group(2), "-");
        return;
      }
    }

    // browser のタイプ、バージョンを設定する。
    private void setBrowser(String uaText) {
      String separator = "_";
      Matcher ie = IE.matcher(uaText);
      if (ie.matches() && ie.groupCount() >= 2) {
        this.browserVer = verExpr(ie.group(2), separator);
        this.browser = "ie";
        return;
      }
      Matcher androidBrowser = ANDROID_BROWSER.matcher(uaText);
      if (androidBrowser.matches() && androidBrowser.groupCount() >= 2) {
        this.browserVer = verExpr(androidBrowser.group(1), separator);
        this.browser = "android_browser";
        return;
      }
      Matcher iosSafari = IOS_SAFARI.matcher(uaText);
      if (iosSafari.matches() && iosSafari.groupCount() >= 2) {
        this.browserVer = verExpr(iosSafari.group(1), separator);
        this.browser = "mobile_safari";
        return;
      }
      Matcher firefox = FIREFOX_CHROME.matcher(uaText);
      if (firefox.matches() && firefox.groupCount() >= 2) {
        this.browserVer = verExpr(firefox.group(2), separator);
        this.browser = firefox.group(1);
        return;
      }

      Matcher safari = SAFARI.matcher(uaText);
      if(safari.matches() && safari.groupCount() >= 2) {
        this.browserVer = verExpr(safari.group(1), separator);
        this.browser = "safari";
        return;
      }
    }

    private String verExpr(String ver, String type) {
      String[] exprList = {type, " "+type+type, " "+type+type+type};
      String[] vers = ver.split("\\D");
      for (int i = 0; i < vers.length && i < 3; i++) {
        exprList[i] = exprList[i] + vers[i];
      }
      StringBuilder exp = new StringBuilder();
      for (String v : exprList) {
        exp.append(v);
      }
      return exp.toString();
    }
  }
%>
<%-- suppress jsp check:user-agentを判定してリクエストスコープにブラウザ、OS情報を設定する処理。tagファイルで実行する必要が有るため、チェック対象外とする --%>
<%
  try {
    String text = request.getHeader("User-Agent");
    UserAgent ua = new UserAgent(text);
    request.setAttribute("nablarch_deviceType",    ua.os);
    request.setAttribute("nablarch_deviceVersion", ua.osVer);
    request.setAttribute("nablarch_browserType",     ua.browser);
    request.setAttribute("nablarch_browserVersion",  ua.browserVer);
  // 例外が出た場合でもページは表示する。
  } catch (Exception e) {
    request.setAttribute("nablarch_deviceType",    "UnKnown");
    request.setAttribute("nablarch_deviceVersion", "");
    request.setAttribute("nablarch_browserType",   "UnKnown");
    request.setAttribute("nablarch_browserVersion","");
  }
%>