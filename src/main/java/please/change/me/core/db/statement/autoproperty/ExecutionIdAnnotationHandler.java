package please.change.me.core.db.statement.autoproperty;

import java.lang.reflect.Field;
import java.util.List;

import nablarch.core.ThreadContext;
import nablarch.core.db.statement.autoproperty.FieldAnnotationHandlerSupport;

/**
 * {@link ExecutionId}アノテーションが設定されているフィールドに実行時IDを設定するクラス。<br>
 * 実行時IDは、{@link nablarch.core.ThreadContext}から取得した値を設定する。
 * @author Kiyohito Itoh
 * @see nablarch.core.ThreadContext#getExecutionId()
 * @since 1.1
 */
public class ExecutionIdAnnotationHandler extends FieldAnnotationHandlerSupport {

    /**
     * 指定されたオブジェクトに実行時IDを設定する。
     * @param obj オブジェクト
     */
    public void handle(Object obj) {
        List<FieldHolder<ExecutionId>> fields = super.getFieldList(obj, ExecutionId.class);

        if (fields.isEmpty()) {
            return;
        }

        try {
            String executionId = ThreadContext.getExecutionId();
            for (FieldHolder<ExecutionId> field : fields) {
                ((Field) field.getField()).set(obj, executionId);
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException("field access error.", e);
        }
    }
}
