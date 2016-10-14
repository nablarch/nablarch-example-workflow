<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
        request.setAttribute("allPermissionUnit", new Map[] {
            new HashMap() {
                {
                    put("permissionUnitName", "ユーザ一覧照会");
                    put("permissionUnitId",   "0000000001");
                }
            },
            new HashMap() {
                {
                    put("permissionUnitName", "テスト用");
                    put("permissionUnitId",   "0000000002");
                }
            },
            new HashMap() {
                {
                    put("permissionUnitName", "ユーザ情報登録");
                    put("permissionUnitId",   "0000000003");
                }
            },
        });
        request.setAttribute("allGroup", new Map[] {
            new HashMap() {
                {
                    put("ugroupName", "総務部" );
                    put("ugroupId",   "0000000001");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "人事部" );
                    put("ugroupId",   "0000000002");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用1" );
                    put("ugroupId",   "0000000003");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用2" );
                    put("ugroupId",   "0000000004");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用3" );
                    put("ugroupId",   "0000000005");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用4" );
                    put("ugroupId",   "0000000006");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用5" );
                    put("ugroupId",   "0000000007");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用6" );
                    put("ugroupId",   "0000000008");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用7" );
                    put("ugroupId",   "0000000009");
                }
            },
            new HashMap() {
                {
                    put("ugroupName", "テスト用8" );
                    put("ugroupId",   "0000000010");
                }
            },
        });
%>