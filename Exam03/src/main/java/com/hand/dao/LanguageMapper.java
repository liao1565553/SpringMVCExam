package com.hand.dao;

import com.hand.domain.Language;

public interface LanguageMapper {
    int deleteByPrimaryKey(Byte languageId);

    int insert(Language record);

    int insertSelective(Language record);

    Language selectByPrimaryKey(Byte languageId);

    int updateByPrimaryKeySelective(Language record);

    int updateByPrimaryKey(Language record);
}