%module(directors="1") PyCTP

%include "typemaps.i"

%{
#define SWIG_FILE_WITH_INIT

#include "./api/ThostFtdcMdApi.h"
#include "./api/ThostFtdcTraderApi.h"
#include "./api/ThostFtdcUserApiStruct.h"
#include "./api/ThostFtdcUserApiDataType.h"
%}

%ignore TThostFtdcVirementTradeCodeType;
%ignore THOST_FTDC_VTC_BankBankToFuture;
%ignore THOST_FTDC_VTC_BankFutureToBank;
%ignore THOST_FTDC_VTC_FutureBankToFuture;
%ignore THOST_FTDC_VTC_FutureFutureToBank;

%ignore TThostFtdcFBTTradeCodeEnumType;
%ignore THOST_FTDC_FTC_BankLaunchBankToBroker;
%ignore THOST_FTDC_FTC_BrokerLaunchBankToBroker;
%ignore THOST_FTDC_FTC_BankLaunchBrokerToBank;
%ignore THOST_FTDC_FTC_BrokerLaunchBrokerToBank;


%typemap(in) (char **ARRAY, int SIZE) {
    if (PyList_Check($input)) {
        int i = 0;
        $2 = PyList_Size($input);
        $1 = (char **)malloc(($2+1)*sizeof(char *));
        for (; i < $2; i++) {
            PyObject *o = PyList_GetItem($input,i);
            if (PyString_Check(o)) {
                $1[i] = PyString_AsString(PyList_GetItem($input,i));
            }
            else {
                $1[i] = PyUnicode_AsUTF8(PyList_GetItem($input,i));
                if (!$1[i]) {
                    PyErr_SetString(PyExc_TypeError,"list must contain strings");
                    free($1);
                    return NULL;
                }
            }
        }
        $1[i] = 0;
    } else {
        PyErr_SetString(PyExc_TypeError, "not a list");
        return NULL;
    }
}

%typemap(freearg) (char **ARRAY, int SIZE) {
    free((char *)$1);
}

%apply (char **ARRAY, int SIZE) { (char *ppInstrumentID[], int nCount) };


%feature("director") CThostFtdcMdSpi;
%include "./api/ThostFtdcMdApi.h"

%feature("director") CThostFtdcTraderSpi;
%include "./api/ThostFtdcTraderApi.h"

%include "./api/ThostFtdcUserApiDataType.h"
%include "./api/ThostFtdcUserApiStruct.h"
