package please.change.me.sample.util;

import static org.junit.Assert.assertEquals;
import nablarch.test.core.db.DbAccessTestSupport;

import org.junit.Test;

import please.change.me.sample.util.IdGeneratorUtil;

public class IdGeneratorUtilTest extends DbAccessTestSupport {
    
    @Test
    public void testIdGenerate() {
        String sheetName = "idGenerate";
        
        setUpDb(sheetName);
        
        // 採番対象IDの指定が間違ってないよね？ということの検証
        assertEquals("0000000002", IdGeneratorUtil.generateTransExpeAppliId());
        assertEquals("0000000011", IdGeneratorUtil.generateLoanAppliId());
        assertEquals("000000000101", IdGeneratorUtil.generateTransExpeAppliHistoryId());
        assertEquals("000000001001", IdGeneratorUtil.generateLoanAppliHistoryId());
    }

}
