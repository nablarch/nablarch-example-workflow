package please.change.me.validation;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.validation.ConstraintValidatorContext;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

/**
 * {@link please.change.me.validation.Date.DateValidator}のテスト。
 */
public class DateValidatorTest {
    
    private final Date.DateValidator sut = new Date.DateValidator();
    
    private static final ConstraintValidatorContext dummyContext = null;

    @DisplayName("バリデーションOKとなる日付形式")
    @ParameterizedTest
    @ValueSource(strings = {"20170102", "2000/02/29"})
    void valid(final String value) {
        assertTrue(sut.isValid(value, dummyContext));
    }


    @DisplayName("バリデーションNGとなる日付形式")
    @ParameterizedTest
    @ValueSource(strings = {"20170229", "2017", "201701011", "2000-02-29"})
    void invalid(final String value) {
        assertFalse(sut.isValid(value, dummyContext));
    }

    @Test
    @DisplayName("nullはOKとなる")
    void testNull() {
        assertTrue(sut.isValid(null, dummyContext));
    }
    
    @Test
    @DisplayName("空文字列はOKとなる")
    void testEmptyString() {
        assertTrue(sut.isValid("", dummyContext));
    }
}
