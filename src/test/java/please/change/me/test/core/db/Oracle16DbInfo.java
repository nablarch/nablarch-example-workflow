package please.change.me.test.core.db;

/**
 * JDK6でOracleを使用する場合の{@link nablarch.test.core.db.DbInfo}実装クラス。
 * NVARCHAR2、NCHAR、NCLOBが{@link java.sql.Types#OTHER}にマッピングする問題に対処する為に使用する。
 * <p>
 * 本クラスは実装上{@link Oracle15DbInfo}と差異は無い。
 * 今後、JDKとJDBCドライバの組み合わせが増えることを想定し、
 * JDK6専用クラスとして用意した。
 * </p>
 * @author T.Kawasaki
 * @since 1.2
 */
public class Oracle16DbInfo extends Oracle15DbInfo {
}
