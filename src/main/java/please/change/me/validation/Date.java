package please.change.me.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import javax.validation.Constraint;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.Payload;

import nablarch.core.util.StringUtil;
import nablarch.core.util.annotation.Published;

/**
 * 日付形式であることをチェックする。
 * <p>
 * 許容する形式は、yyyyMMdd及びyyyy/MM/dd形式。
 *
 * @author nabchan
 */
@SuppressWarnings("JavaDoc")
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR,
        ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = Date.DateValidator.class)
@Published
public @interface Date {

    Class<?>[] groups() default {};

    String message() default "{please.change.me.validation.Date.message}";

    Class<? extends Payload>[] payload() default {};

    /**
     * 日付形式が妥当であることをチェックする。
     */
    class DateValidator implements ConstraintValidator<Date, String> {

        @Override
        public void initialize(final Date date) {
            // nop
        }

        @Override
        public boolean isValid(final String value, final ConstraintValidatorContext context) {
            if (StringUtil.isNullOrEmpty(value)) {
                return true;
            }
            try {
                LocalDate.parse(value, DateTimeFormatter.BASIC_ISO_DATE);
                return true;
            } catch (DateTimeParseException ignored) {
            }
            try {
                LocalDate.parse(value, DateTimeFormatter.ofPattern("yyyy/MM/dd"));
                return true;
            } catch (DateTimeParseException ignored) {
                return false;
            }
        }
    }
}
