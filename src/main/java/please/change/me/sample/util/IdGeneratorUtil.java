package please.change.me.sample.util;

import nablarch.common.idgenerator.IdGenerator;
import nablarch.common.idgenerator.formatter.LpadFormatter;
import nablarch.core.repository.SystemRepository;

/**
 * 採番ユーティリティクラス。
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public final class IdGeneratorUtil {
    
    /**
     * 隠蔽コンストラクタ。
     */
    private IdGeneratorUtil() {
    }

    /**
     * 交通費申請IDを採番する。
     * oracleシーケンス使用。
     * 
     * @return 交通費申請ID(10桁左0パディング)
     */
    public static String generateTransExpeAppliId() {
        IdGenerator generator = (IdGenerator) SystemRepository.getObject("idGenerator");
        return generator.generateId("1100", new LpadFormatter(10, '0'));
    }
    

    /**
     * ローン申請IDを採番する。
     * oracleシーケンス使用。
     * 
     * @return ローン申請ID(10桁左0パディング)
     */
    public static String generateLoanAppliId() {
        IdGenerator generator = (IdGenerator) SystemRepository.getObject("idGenerator");
        return generator.generateId("1101", new LpadFormatter(10, '0'));
    }

    /**
     * 交通費申請処理履歴IDを採番する。
     * oracleシーケンス使用。
     * 
     * @return 交通費申請処理履歴ID(12桁左0パディング)
     */
    public static String generateTransExpeAppliHistoryId() {
        IdGenerator generator = (IdGenerator) SystemRepository.getObject("idGenerator");
        return generator.generateId("1102", new LpadFormatter(12, '0'));
    }
    

    /**
     * ローン申請処理履歴IDを採番する。
     * oracleシーケンス使用。
     * 
     * @return ローン申請処理履歴ID(12桁左0パディング)
     */
    public static String generateLoanAppliHistoryId() {
        IdGenerator generator = (IdGenerator) SystemRepository.getObject("idGenerator");
        return generator.generateId("1103", new LpadFormatter(12, '0'));
    }
}
