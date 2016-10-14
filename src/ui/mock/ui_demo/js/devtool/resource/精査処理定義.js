define(function(){ return {"":""

, "文字列長精査": ["@Length", "max", "min", "messageId", "", "", "nablarch.core.validation.validator.Length", ""]
, "文字種精査": ["@SystemChar", "charsetDef", "allowLineSeparator", "messageId", "", "", "nablarch.core.validation.validator.unicode.SystemChar", ""]
, "数値範囲精査": ["@NumberRange", "max", "min", "messageId", "", "", "nablarch.core.validation.validator.NumberRange", ""]
, "コード値有効精査": ["@CodeValue", "pattern", "", "", "", "", "nablarch.common.code.validator.CodeValue", "引数のcodeIdはドメイン名を元にコード設計書から自動生成ツールで設定するので指定不要。そのため、このシートには記載していない。"]
, "数値桁数精査": ["@Digits", "integer", "commaSeparated", "fraction", "messageId", "", "nablarch.core.validation.convertor.Digits", ""]
, "メールアドレス精査": ["@MailAddress", "messageId", "", "", "", "", "nablarch.common.validation.MailAddress", ""]
, "日本電話番号精査": ["@JapaneseTelNumber", "messageId", "", "", "", "", "nablarch.common.validation.JapaneseTelNumber", ""]
, "年月日精査": ["@YYYYMMDD", "allowFormat", "messageId", "", "", "", "nablarch.common.date.YYYYMMDD", ""]
, "年月精査": ["@YYYYMM", "allowFormat", "messageId", "", "", "", "nablarch.common.date.YYYYMM", ""]

};});