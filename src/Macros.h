#pragma once

#define DECLARE_MEMBER(TYPE, MEMBER) \
public: \
    TYPE Get##MEMBER(void) const \
    { \
        return m##MEMBER; \
    } \
    void Set##MEMBER(TYPE newValue); \
private: \
    TYPE m##MEMBER

#define DEFINE_SET_METHOD(CLASS, TYPE, MEMBER) \
    void CLASS::Set##MEMBER(TYPE NEW_VALUE) \
    { \
        if (std::isnan(NEW_VALUE) || qFuzzyCompare(m##MEMBER, NEW_VALUE)) \
        { \
            return; \
        } \
        m##MEMBER = NEW_VALUE; \
        emit MEMBER##Changed(); \
    }

#define DEFINE_SET_METHOD_BOOL(CLASS, TYPE, MEMBER) \
    void CLASS::Set##MEMBER(TYPE NEW_VALUE) \
    { \
        if (m##MEMBER == NEW_VALUE) \
        { \
            return; \
        } \
        m##MEMBER = NEW_VALUE; \
        emit MEMBER##Changed(); \
    }
