package please.change.me.action;

import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;

/**
 * 承認に関するアクション。
 *
 * @author nabchan
 */
public class ApprovalAction {

    public HttpResponse index(HttpRequest request, ExecutionContext context) {
        return new HttpResponse("/WEB-INF/approval/index.jsp");
    }
}
