package please.change.me.sample.ss11AC;

import java.util.HashMap;
import java.util.Map;

import nablarch.core.validation.PropertyName;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;

/**
 * ローン申請タスク進行処理のフォームベースクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public abstract class W11AC02FormBase {

    /** ローン申請ID */
    private String loanAppliId;

    /** 調査結果 */
    private String surveyContent;

    /** コメント */
    private String historyComment;

     /**
     * ローン申請登録フォームを生成する。
     */
    public W11AC02FormBase() {
    }

    /**
     * パラメータを元にローン申請登録フォームを生成する。
     *
     * @param param パラメータ
     */
    public W11AC02FormBase(Map<String, ?> param) {
        loanAppliId = (String) param.get("loanAppliId");
        surveyContent = (String) param.get("surveyContent");
        historyComment = (String) param.get("historyComment");
    }

    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    protected Map<String, Object> toMap() {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("loanAppliId", loanAppliId);
        result.put("surveyContent", surveyContent);
        result.put("historyComment", historyComment);
        return result;
    }

    /**
     * ローン申請IDを取得する。
     * @return ローン申請ID
     */
    public String getLoanAppliId() {
        return loanAppliId;
    }

    /**
     * ローン申請IDを設定する。
     * @param loanAppliId ローン申請ID
     */
    @Length(max = 10, min = 10)
    @SystemChar(charsetDef = "NumberChar")
    @Required
    public void setLoanAppliId(String loanAppliId) {
        this.loanAppliId = loanAppliId;
    }

    /**
     * 照査結果を取得する。
     * @return 調査結果
     */
    public String getSurveyContent() {
        return surveyContent;
    }

    /**
     * 調査結果を設定する。
     * @param surveyContent 調査結果
     */
    @Length(max = 100)
    @Required
    @SystemChar(charsetDef = "AllChar", allowLineSeparator = true)
    @PropertyName("調査結果")
    public void setSurveyContent(String surveyContent) {
        this.surveyContent = surveyContent;
    }

    /**
     * コメントを取得する。
     * @return コメント
     */
    public String getHistoryComment() {
        return historyComment;
    }

    /**
     * コメントを設定する。
     * @param historyComment コメント
     */
    @Length(max = 100)
    @SystemChar(charsetDef = "AllChar", allowLineSeparator = true)
    @PropertyName("コメント")
    public void setHistoryComment(String historyComment) {
        this.historyComment = historyComment;
    }
}


