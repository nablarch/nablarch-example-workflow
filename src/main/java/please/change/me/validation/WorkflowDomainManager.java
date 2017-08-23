package please.change.me.validation;

import nablarch.core.validation.ee.DomainManager;

/**
 * {@link DomainManager} の実装クラス。
 * <p>
 * ドメインを定義したBeanクラスを返却する。
 *
 * @author nabchan
 */
public final class WorkflowDomainManager implements DomainManager<WorkflowDomainManager.WorkflowDomainBean> {

    @Override
    public Class<WorkflowDomainBean> getDomainBean() {
        return WorkflowDomainBean.class;
    }

    /**
     * ドメイン定義。
     */
    public static class WorkflowDomainBean {
    }
}
