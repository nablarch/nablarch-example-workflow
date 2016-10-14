package please.change.me.common.idgenerator;

import nablarch.common.idgenerator.SequenceIdGeneratorSupport;

/**
 * Oracleシーケンスを使用して採番を行うクラス。
 *
 * @author Hisaaki Sioiri
 * @since 1.0
 */
public class OracleSequenceIdGenerator extends SequenceIdGeneratorSupport {

    @Override
    protected String createSql(String sequenceName) {
        StringBuilder sb = new StringBuilder(70);
        sb.append("SELECT ");
        sb.append(sequenceName.trim()).append(".NEXTVAL GENERATE_ID");
        sb.append(" FROM DUAL");
        return sb.toString();
    }
}
