package please.change.me.sample.ss11.entity;

import java.io.Serializable;
import java.util.Map;

/**
 * ユーザテーブルの情報を保持するクラス。
 *
 * UsersEntity クラスは USERS テーブルにマッピングされるテーブルフィールドを保持する。
 *
 * @author Entity Generator
 * @since 1.0
 */
public class UsersEntity implements Serializable {

    /**
     * serialVersionUID。
     */
    private static final long serialVersionUID = 1L;

    /**
     * ユーザID。
     */
    private String userId;

    /**
     * 漢字氏名。
     */
    private String kanjiName;



    /**
     * デフォルトコンストラクタ。
     */
    public UsersEntity() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     * @param params 項目名をキーとし、項目値を値とするMap。
     */
    public UsersEntity(Map<String, Object> params) {
        userId = (String) params.get("userId");
        kanjiName = (String) params.get("kanjiName");
    }


    /**
     * ユーザIDを取得する。
     * @return ユーザID。
     */
    public String getUserId() {
        return userId;
    }

    /**
     * ユーザIDを設定する。
     * @param userId 設定するユーザID。
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 漢字氏名を取得する。
     * @return 漢字氏名。
     */
    public String getKanjiName() {
        return kanjiName;
    }

    /**
     * 漢字氏名を設定する。
     * @param kanjiName 設定する漢字氏名。
     */
    public void setKanjiName(String kanjiName) {
        this.kanjiName = kanjiName;
    }

}
