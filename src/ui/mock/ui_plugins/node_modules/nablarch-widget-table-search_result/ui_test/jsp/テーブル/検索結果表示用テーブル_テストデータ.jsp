<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.db.support.ListSearchInfo" %>
<!--
<%!
  class ListSearchInfoImpl extends ListSearchInfo {

    ListSearchInfoImpl() {
      setPageNumber(1);
      setResultCount(4);
      setMax(2);
    }

    @Override
    public String[] getSearchConditionProps() {
      return new String[]{
          "users.id",
          "users.name"
      };
    }
  }

  ListSearchInfo makeListSearchInfo(int pageNo, int resultCount) {
    return makeListSearchInfo(pageNo, resultCount, 2);
  }

  ListSearchInfo makeListSearchInfo(int pageNo, int resultCount, int max) {
    ListSearchInfoImpl listSearchInfo = new ListSearchInfoImpl();
    listSearchInfo.setPageNumber(pageNo);
    listSearchInfo.setResultCount(resultCount);
    listSearchInfo.setMax(max);
    return listSearchInfo;
  }

  List<Map<String, Object>> makePageData(final int pageNo, final int count) {
    return new ArrayList<Map<String, Object>>() {{
      for (int i = 1; i <= count; i++) {
        final int finalI = i;
        add(new HashMap<String, Object>() {{
          put("id", String.format("%d%03d", pageNo, finalI));
          put("name", String.format("%sページ目 なまえ%d", pageNo, finalI));
        }});
      }
    }};
  }
%>
<%

  // サーバーモードを表す
  request.setAttribute("serverMode", true);

  List<Map<String, Object>> searchResult;
  ListSearchInfoImpl listSearchInfo = new ListSearchInfoImpl();
  if (!request.getParameterMap().containsKey("searchInfo.pageNumber") || request.getParameter("searchInfo.pageNumber")
      .equals("1")) {
    // 1ページ目
    request.setAttribute("searchInfo", makeListSearchInfo(1, 4));
    request.setAttribute("searchResult", makePageData(1, 2));
  } else if (request.getParameter("searchInfo.pageNumber").equals("2")) {
    // 2ページ目
    request.setAttribute("searchInfo", makeListSearchInfo(2, 4));
    request.setAttribute("searchResult", makePageData(2, 2));
  }

  if (!request.getParameterMap().containsKey("searchInfo-usePaging-blank.pageNumber") || request.getParameter(
      "searchInfo-usePaging-blank.pageNumber").equals("1")) {
    // 1ページ目
    request.setAttribute("searchInfo-usePaging-blank", makeListSearchInfo(1, 3));
    request.setAttribute("searchResult-usePaging-blank", makePageData(1, 2));
  } else if (request.getParameter("searchInfo-usePaging-blank.pageNumber").equals("2")) {
    // 2ページ目
    request.setAttribute("searchInfo-usePaging-blank", makeListSearchInfo(2, 3));
    request.setAttribute("searchResult-usePaging-blank", makePageData(2, 1));
  }

  if (!request.getParameterMap().containsKey("searchInfo-usePaging-true.pageNumber") || request.getParameter(
      "searchInfo-usePaging-true.pageNumber").equals("1")) {
    // 1ページ目
    request.setAttribute("searchInfo-usePaging-true", makeListSearchInfo(1, 7, 3));
    request.setAttribute("searchResult-usePaging-true", makePageData(1, 3));
  } else if (request.getParameter("searchInfo-usePaging-true.pageNumber").equals("2")) {
    // 2ページ目
    request.setAttribute("searchInfo-usePaging-true", makeListSearchInfo(2, 7, 3));
    request.setAttribute("searchResult-usePaging-true", makePageData(2, 3));
  } else if (request.getParameter("searchInfo-usePaging-true.pageNumber").equals("3")) {
    // 2ページ目
    request.setAttribute("searchInfo-usePaging-true", makeListSearchInfo(3, 7, 3));
    request.setAttribute("searchResult-usePaging-true", makePageData(3, 1));
  }

  if (!request.getParameterMap().containsKey("searchInfo-usePaging-false.pageNumber")) {
    // 1ページ目
    request.setAttribute("searchInfo-usePaging-false", makeListSearchInfo(1, 15, 15));
    request.setAttribute("searchResult-usePaging-false", makePageData(1, 15));
  }
  if (!request.getParameterMap().containsKey("searchInfo-server-default.pageNumber")) {
    request.setAttribute("searchInfo-server-default", makeListSearchInfo(1, 4));
    request.setAttribute("searchResult-server-default", makePageData(1, 4));
  }
%>
-->