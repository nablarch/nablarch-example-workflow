package please.change.me.validation;

import please.change.me.validation.WorkflowDomainManager.WorkflowDomainBean;

import nablarch.core.validation.ee.DomainManager;
import nablarch.core.validation.ee.Length;
import nablarch.core.validation.ee.NumberRange;

/**
 * {@link DomainManager} の実装クラス。
 * <p>
 * ドメインを定義したBeanクラスを返却する。
 *
 * @author nabchan
 */
public final class WorkflowDomainManager implements DomainManager<WorkflowDomainBean> {

    @Override
    public Class<WorkflowDomainBean> getDomainBean() {
        return WorkflowDomainBean.class;
    }

    /**
     * ドメイン定義。
     */
    @SuppressWarnings("all")
    public static class WorkflowDomainBean {

        @Length(max = 100)
        public String 会社名;

        @NumberRange(min = 1, max = 9999999, message = "{万円.message}")
        public String 万円;

        @Date
        public String 日付;

        @Length(max = 124)
        public String 名前;

        @Length(max = 100)
        public String コメント;
    }
}
