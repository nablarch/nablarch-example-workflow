package please.change.me.view;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.jsp.PageContext;

import nablarch.common.web.tag.ValueFormatter;

/**
 * {@link LocalDateTime}及び{@link LocalDate}をフォーマットする。
 * @author nabchan
 */
public class DateTimeFormatter implements ValueFormatter {

    @Override
    public String format(final PageContext pageContext, final String name, final Object value, final String pattern) {
        if (value == null) {
            return "";
        }
        if (value instanceof LocalDateTime) {
            return ((LocalDateTime) value).format(java.time.format.DateTimeFormatter.ofPattern(pattern));
        } else if (value instanceof LocalDate) {
            return ((LocalDate) value).format(java.time.format.DateTimeFormatter.ofPattern(pattern));
        }
        return value.toString();
    }
}
