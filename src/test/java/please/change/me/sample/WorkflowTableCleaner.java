package please.change.me.sample;

import java.util.Arrays;
import java.util.List;

import nablarch.core.db.connection.TransactionManagerConnection;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.test.core.db.DbAccessTestSupport;
import nablarch.test.core.db.TransactionTemplateInternal;
import nablarch.test.event.TestEventListener;

/**
 *
 */
public class WorkflowTableCleaner extends TestEventListener.Template {

    private static final List<String> cleaningTables = Arrays.asList(
            "TRANS_EXPE_APPLI_HISTORY",
            "TRANS_EXPE_APPLICATION",
            "LOAN_APPLICATION_HISTORY",
            "LOAN_APPLICATION",
            "WF_ACTIVE_GROUP_TASK",
            "WF_ACTIVE_USER_TASK",
            "WF_TASK_ASSIGNED_GROUP",
            "WF_TASK_ASSIGNED_USER",
            "WF_ACTIVE_FLOW_NODE",
            "WF_INSTANCE_FLOW_NODE",
            "WF_INSTANCE"
    );

    @Override
    public void beforeTestMethod() {
        this.afterTestMethod();
    }

    @Override
    public void afterTestMethod() {
        new TransactionTemplateInternal(DbAccessTestSupport.DB_TRANSACTION_FOR_TEST) {
            @Override
            protected void doInTransaction(TransactionManagerConnection conn) {
                cleaningTables.forEach(table -> {
                    final SqlPStatement statement = conn.prepareStatement("/* cleaner */ delete from " + table);
                    statement.execute();
                    statement.close();
                });
            }
        }.execute();
    }
}
