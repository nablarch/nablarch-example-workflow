package please.change.me.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;

/**
 * ユーザ
 *
 * @author nabchan
 */
@Getter
@AllArgsConstructor
@EqualsAndHashCode(of = "userId")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /** ユーザID */
    private String userId;

    /** 漢字指名 */
    private String kanjiName;

    /** ユーザグループID */
    private String ugourpId;
}
