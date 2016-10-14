package ui_test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import nablarch.common.code.CodeManager;

public class StubCodeManager implements CodeManager {

    private Map<String, TreeMap<String, String>> codes;

    {
        codes = new HashMap<String, TreeMap<String, String>>();

        TreeMap<String, String> code1 = new TreeMap<String, String>();
        code1.put("value1-1", "name1-1");
        code1.put("value1-2", "name1-2");
        code1.put("value1-3", "name1-3");
        codes.put("code1", code1);

        TreeMap<String, String> code2 = new TreeMap<String, String>();
        code2.put("value2-1", "name2-1");
        code2.put("value2-2", "name2-2");
        code2.put("value2-3", "name2-3");
        codes.put("code2", code2);
    }

    @Override
    public String getName(String codeId, String value) throws IllegalArgumentException {
        return codes.get(codeId).get(value);
    }

    @Override
    public String getName(String codeId, String value, Locale locale) throws IllegalArgumentException {
        return codes.get(codeId).get(value);
    }

    @Override
    public String getShortName(String codeId, String value) throws IllegalArgumentException {
        return "short:" + codes.get(codeId).get(value);
    }

    @Override
    public String getShortName(String codeId, String value, Locale locale) throws IllegalArgumentException {
        return "short:" + codes.get(codeId).get(value) + " locale:" + locale;
    }

    @Override
    public String getOptionalName(String codeId, String value, String optionColumnName) throws IllegalArgumentException {
        return codes.get(codeId).get(value) + " column:" + optionColumnName;
    }

    @Override
    public String getOptionalName(String codeId, String value, String optionColumnName, Locale locale) throws IllegalArgumentException {
        return codes.get(codeId).get(value) + " column:" + optionColumnName + " locale:" + locale;
    }

    @Override
    public List<String> getValues(String codeId) throws IllegalArgumentException {
        return new ArrayList<String>(codes.get(codeId).keySet());
    }

    @Override
    public List<String> getValues(String codeId, String pattern) throws IllegalArgumentException {
        if ("code1".equals(codeId)) {
            if ("PATTERN01".equals(pattern)) {
                return Arrays.asList("value1-1", "value1-2", "value1-3");
            }
            return Arrays.asList("value1-2");
        }
        if ("code2".equals(codeId)) {
            if ("PATTERN01".equals(pattern)) {
                return Arrays.asList("value2-1", "value2-2", "value2-3");
            }
            return Arrays.asList("value2-2");
        }
        return Collections.emptyList();
    }

    @Override
    public List<String> getValues(String codeId, Locale locale) throws IllegalArgumentException {
        return new ArrayList<String>(codes.get(codeId).keySet());
    }

    @Override
    public List<String> getValues(String codeId, String pattern, Locale locale) throws IllegalArgumentException {
        return new ArrayList<String>(codes.get(codeId).keySet());
    }

    @Override
    public boolean contains(String codeId, String value) throws IllegalArgumentException {
        return codes.get(codeId).keySet().contains(value);
    }

    @Override
    public boolean contains(String codeId, String pattern, String value) throws IllegalArgumentException {
        return codes.get(codeId).keySet().contains(value);
    }
}
