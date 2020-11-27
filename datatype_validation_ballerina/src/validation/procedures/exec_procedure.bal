import ballerina/sql;
import ballerina/io;
import ballerina/java.jdbc;

function executeNumericProcedure(jdbc:Client jdbcClient) returns error?{
    io:println("\n------------------------------------");
    io:println("Numeric Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL NUMERICPROC(   
        ${NUMBER_IN}, ${NUMBER_INOUT}, ${NUMBER_OUT},
        ${FLOAT_IN}, ${FLOAT_INOUT}, ${FLOAT_OUT},
        ${BINARY_FLOAT_IN}, ${BINARY_FLOAT_INOUT}, ${BINARY_FLOAT_OUT},
        ${BINARY_DOUBLE_IN}, ${BINARY_DOUBLE_INOUT}, ${BINARY_DOUBLE_OUT}      
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

    io:println(NUMBER_INOUT.get(float), " ", NUMBER_OUT.get(float));
    io:println(FLOAT_INOUT.get(float), " ", FLOAT_OUT.get(float));
    io:println(BINARY_FLOAT_INOUT.get(float), " ", BINARY_FLOAT_OUT.get(float));
    io:println(BINARY_DOUBLE_INOUT.get(float), " ", BINARY_DOUBLE_OUT.get(float));

}

function executeCharacterProcedure(jdbc:Client jdbcClient) returns error?{
    
    io:println("\n------------------------------------");
    io:println("Character Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL CHARACTERPROC(   
        ${VARCHAR2_IN}, ${VARCHAR2_INOUT}, ${VARCHAR2_OUT},
        ${VARCHAR_IN}, ${VARCHAR_INOUT}, ${VARCHAR_OUT},
        ${NVARCHAR2_IN}, ${NVARCHAR2_INOUT}, ${NVARCHAR2_OUT},
        ${CHAR_IN}, ${CHAR_INOUT}, ${CHAR_OUT},
        ${NCHAR_IN}, ${NCHAR_INOUT}, ${NCHAR_OUT}      
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

    io:println(VARCHAR2_INOUT.get(string), " ", VARCHAR2_OUT.get(string));
    io:println(VARCHAR_INOUT.get(string), " ", VARCHAR_OUT.get(string));
    io:println(NVARCHAR2_INOUT.get(string), " ", NVARCHAR2_OUT.get(string));
    io:println(CHAR_INOUT.get(string), " ", CHAR_OUT.get(string));
    io:println(NCHAR_INOUT.get(string), " ", NCHAR_OUT.get(string));
    
}

function executeDatetimeProcedure(jdbc:Client jdbcClient) returns error?{
    
    io:println("\n------------------------------------");
    io:println("Datetime Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL DATETIMEPROC(   
        ${DATETIME_IN}, ${DATETIME_INOUT}, ${DATETIME_OUT},
        ${TIMESTAMP_IN}, ${TIMESTAMP_INOUT}, ${TIMESTAMP_OUT},
        ${INTERVALY2M_IN}, ${INTERVALY2M_INOUT}, ${INTERVALY2M_OUT},
        ${INTERVALD2S_IN}, ${INTERVALD2S_INOUT}, ${INTERVALD2S_OUT}
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

    io:println(DATETIME_INOUT.get(string), " ", DATETIME_OUT.get(string));
    io:println(TIMESTAMP_INOUT.get(string), " ", TIMESTAMP_OUT.get(string));
    // io:println(TIMESTAMPTZ_INOUT.get(string), " ", TIMESTAMPTZ_OUT.get(string));
    // io:println(TIMESTAMPTZL_OUT.get(string), " ", TIMESTAMPTZL_OUT.get(string));
    io:println(INTERVALY2M_INOUT.get(string), " ", INTERVALY2M_OUT.get(string));
    io:println(INTERVALD2S_INOUT.get(string), " ", INTERVALD2S_OUT.get(string));
    
}

// function executeBLOBProcedure(jdbc:Client jdbcClient) returns error?{
    
//     io:println("\n------------------------------------");
//     io:println("BLOB Procedure Execution Started!\n");

//     sql:ParameterizedCallQuery query = `CALL BLOBPROC(   
//         ${BLOB_IN}, ${BLOB_INOUT}, ${BLOB_OUT}
//         )`;

//     sql:ProcedureCallResult result = check jdbcClient->call(query);

//     io:println(BLOB_INOUT.get(string), " ", BLOB_OUT.get(string));
    
// }

// function executeCLOBProcedure(jdbc:Client jdbcClient) returns error?{
    
//     io:println("\n------------------------------------");
//     io:println("CLOB Procedure Execution Started!\n");

//     sql:ParameterizedCallQuery query = `CALL CLOBPROC(   
//         ${CLOB_IN}, ${CLOB_INOUT}, ${CLOB_OUT}
//         )`;

//     sql:ProcedureCallResult result = check jdbcClient->call(query);

//     io:println(CLOB_INOUT.get(string), " ", CLOB_OUT.get(string));
    
// }

// function executeNCLOBProcedure(jdbc:Client jdbcClient) returns error?{
    
//     io:println("\n------------------------------------");
//     io:println("NCLOB Procedure Execution Started!\n");

//     sql:ParameterizedCallQuery query = `CALL CLOBPROC(   
//         ${NCLOB_IN}, ${NCLOB_INOUT}, ${NCLOB_OUT}
//         )`;

//     sql:ProcedureCallResult result = check jdbcClient->call(query);

//     io:println(NCLOB_INOUT.get(string), " ", NCLOB_OUT.get(string));
    
// }

function executeLongProcedure(jdbc:Client jdbcClient) returns error?{
    
    io:println("\n------------------------------------");
    io:println("LONG Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL LONGPROC(  
        ${LONG_IN}, ${LONG_INOUT}, ${LONG_OUT}
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

    io:println(LONG_INOUT.get(string), " ", LONG_OUT.get(string));
    
}


// function executeRawProcedure(jdbc:Client jdbcClient) returns error?{
    
//     io:println("\n------------------------------------");
//     io:println("RAW Procedure Execution Started!\n");

//     sql:ParameterizedCallQuery query = `CALL RAWPROC(  
//         ${RAW_IN}, ${RAW_INOUT}, ${RAW_OUT} ,
//         ${LONGRAW_IN}, ${LONGRAW_INOUT}, ${LONGRAW_OUT}
//         )`;

//     sql:ProcedureCallResult result = check jdbcClient->call(query);

//     io:println(RAW_INOUT.get(string), " ", RAW_OUT.get(string));
//     io:println(LONGRAW_INOUT.get(string), " ", LONGRAW_OUT.get(string));
    
// }

function executeAnsiProcedure(jdbc:Client jdbcClient) returns error?{
    
    io:println("\n------------------------------------");
    io:println("ANSI Procedure Execution Started!\n");


    sql:ParameterizedCallQuery query = `CALL ANSITYPESPROC(  
        ${CHARACTER_ANSI_IN}, ${CHARACTER_ANSI_INOUT}, ${CHARACTER_ANSI_OUT},
        ${CHAR_ANSI_IN}, ${CHAR_ANSI_INOUT}, ${CHAR_ANSI_OUT},
        ${CHARACTER_VAR_ANSI_IN}, ${CHARACTER_VAR_ANSI_INOUT}, ${CHARACTER_VAR_ANSI_OUT},
        ${NATIONAL_CHARACTER_ANSI_IN}, ${NATIONAL_CHARACTER_ANSI_INOUT}, ${NATIONAL_CHARACTER_ANSI_OUT},

        ${NATIONAL_CHAR_ANSI_IN}, ${NATIONAL_CHAR_ANSI_INOUT}, ${NATIONAL_CHAR_ANSI_OUT},
        ${NATIONAL_CHARACTER_VAR_ANSI_IN}, ${NATIONAL_CHARACTER_VAR_ANSI_INOUT}, ${NATIONAL_CHARACTER_VAR_ANSI_OUT},
        ${NATIONAL_CHAR_VAR_ANSI_IN}, ${NATIONAL_CHAR_VAR_ANSI_INOUT}, ${NATIONAL_CHAR_VAR_ANSI_OUT},
        ${NCHAR_VAR_ANSI_IN}, ${NCHAR_VAR_ANSI_INOUT}, ${NCHAR_VAR_ANSI_OUT},
        
        ${NUMERIC_ANSI_IN}, ${NUMERIC_ANSI_INOUT}, ${NUMERIC_ANSI_OUT},
        ${INTEGER_ANSI_IN}, ${INTEGER_ANSI_INOUT}, ${INTEGER_ANSI_OUT},
        ${INT_ANSI_IN}, ${INT_ANSI_INOUT}, ${INT_ANSI_OUT},
        ${SMALLINT_ANSI_IN}, ${SMALLINT_ANSI_INOUT}, ${SMALLINT_ANSI_OUT},

        ${FLOAT_ANSI_IN}, ${FLOAT_ANSI_INOUT}, ${FLOAT_ANSI_OUT},
        ${DOUBLE_PRECISION_ANSI_IN}, ${DOUBLE_PRECISION_ANSI_INOUT}, ${DOUBLE_PRECISION_ANSI_OUT},
        ${REAL_ANSI_IN}, ${REAL_ANSI_INOUT}, ${REAL_ANSI_OUT},
        ${DECIMAL_ANSI_IN}, ${DECIMAL_ANSI_INOUT}, ${DECIMAL_ANSI_OUT}
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

    io:println(CHARACTER_ANSI_INOUT.get(string), " ", CHARACTER_ANSI_OUT.get(string));
    io:println(CHAR_ANSI_INOUT.get(string), " ", CHAR_ANSI_OUT.get(string));
    io:println(CHARACTER_VAR_ANSI_INOUT.get(string), " ", CHARACTER_VAR_ANSI_OUT.get(string));
    io:println(NATIONAL_CHARACTER_ANSI_INOUT.get(string), " ", NATIONAL_CHARACTER_ANSI_OUT.get(string));

    io:println(NATIONAL_CHAR_ANSI_INOUT.get(string), " ", NATIONAL_CHAR_ANSI_OUT.get(string));
    io:println(NATIONAL_CHARACTER_VAR_ANSI_INOUT.get(string), " ", NATIONAL_CHARACTER_VAR_ANSI_OUT.get(string));
    io:println(NATIONAL_CHAR_VAR_ANSI_INOUT.get(string), " ", NATIONAL_CHAR_VAR_ANSI_OUT.get(string));
    io:println(NCHAR_VAR_ANSI_INOUT.get(string), " ", NCHAR_VAR_ANSI_OUT.get(string));

    io:println(NUMERIC_ANSI_INOUT.get(float), " ", NUMERIC_ANSI_OUT.get(float));
    io:println(INTEGER_ANSI_INOUT.get(float), " ", INTEGER_ANSI_OUT.get(float));
    io:println(INT_ANSI_INOUT.get(float), " ", INT_ANSI_OUT.get(float));
    io:println(SMALLINT_ANSI_INOUT.get(float), " ", SMALLINT_ANSI_OUT.get(float));

    io:println(FLOAT_ANSI_INOUT.get(float), " ", FLOAT_ANSI_OUT.get(float));
    io:println(DOUBLE_PRECISION_ANSI_INOUT.get(float), " ", DOUBLE_PRECISION_ANSI_OUT.get(float));
    io:println(REAL_ANSI_INOUT.get(float), " ", REAL_ANSI_OUT.get(float));
    io:println(DECIMAL_ANSI_INOUT.get(float), " ", DECIMAL_ANSI_OUT.get(float));

}

function executeSQLDSProcedure(jdbc:Client jdbcClient) returns error?{
    
    io:println("\n------------------------------------");
    io:println("SQLDS Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL SQLDSPROC(  
        ${CHARACTER_SQLDS_IN}, ${CHARACTER_SQLDS_INOUT}, ${CHARACTER_SQLDS_OUT} ,
        ${VARCHAR_SQLDS_IN}, ${VARCHAR_SQLDS_INOUT}, ${VARCHAR_SQLDS_OUT},
        ${DECIMAL_SQLDS_IN}, ${DECIMAL_SQLDS_INOUT}, ${DECIMAL_SQLDS_OUT},
        ${INTEGER_SQLDS_IN}, ${INTEGER_SQLDS_INOUT}, ${INTEGER_SQLDS_OUT},
        ${SMALLINT_SQLDS_IN}, ${SMALLINT_SQLDS_INOUT}, ${SMALLINT_SQLDS_OUT},
        ${FLOAT_SQLDS_IN}, ${FLOAT_SQLDS_INOUT}, ${FLOAT_SQLDS_OUT}
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

    io:println((check CHARACTER_SQLDS_INOUT.get(string)).trim(), " ", (check CHARACTER_SQLDS_OUT.get(string)).trim());
    io:println((check VARCHAR_SQLDS_INOUT.get(string)).trim(), " ", (check VARCHAR_SQLDS_OUT.get(string)).trim());
    io:println(DECIMAL_SQLDS_INOUT.get(float), " ", DECIMAL_SQLDS_OUT.get(decimal));
    io:println(INTEGER_SQLDS_INOUT.get(int), " ", INTEGER_SQLDS_OUT.get(decimal));
    io:println(SMALLINT_SQLDS_INOUT.get(int), " ", SMALLINT_SQLDS_OUT.get(decimal));
    io:println(FLOAT_SQLDS_INOUT.get(float), " ", FLOAT_SQLDS_OUT.get(decimal));
}

function executeUserDefinedProcedure(jdbc:Client jdbcClient) returns error?{
    io:println("\n------------------------------------");
    io:println("USERDEFINED Procedure Execution Started!\n");

    sql:VarcharValue  A1 = new("hello world!");
    sql:VarcharValue  A2 = new("hello world!");
    sql:VarcharValue  A3 = new("hello world!");

    sql:InOutParameter B1 = new("hello");
    sql:InOutParameter B2 = new("hello");
    sql:InOutParameter B3 = new("hello");

    sql:VarcharOutParameter C1 = new();
    sql:VarcharOutParameter C2 = new();
    sql:VarcharOutParameter C3 = new();

    sql:ParameterizedCallQuery query = `CALL OBJECTPROC(  
        OBJECT_TYPE(${A1}, ${A2}, ${A3}),
        OBJECT_TYPE(${B1}, ${B2}, ${B3}),
        OBJECT_TYPE(${C1}, ${C2}, ${C2})
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

}

function executeRefProcedure(jdbc:Client jdbcClient) returns error?{
    io:println("\n------------------------------------");
    io:println("REF Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL REFPROC(  
        ${VARCHAR_REF_IN}, ${REF_OUT}
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

}

function executeVarrayProcedure(jdbc:Client jdbcClient) returns error?{
    io:println("\n------------------------------------");
    io:println("VARRAY Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL VARRAYSPROC(  
        ${ARRAY_IN}, ${ARRAY_INOUT}
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

}

function executeXMLProcedure(jdbc:Client jdbcClient) returns error?{
    io:println("\n------------------------------------");
    io:println("XML Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL XMLPROC(  
        DBURITYPE(${DBURI_IN})
        )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

}

function executeAnyProcedure(jdbc:Client jdbcClient) returns error?{
    io:println("\n------------------------------------");
    io:println("ANY Procedure Execution Started!\n");

    sql:ParameterizedCallQuery query = `CALL ANYPROC(  
        SYS.ANYDATA.convertVarchar2(${ANYVARCHAR_IN})
    )`;

    sql:ProcedureCallResult result = check jdbcClient->call(query);

}


# The `printExecuteProcedureResult` function that prints out the result of the procedure execution
# + procedurename - type string - name of the procedure
# + err - type error? - error during execution
function printExecuteProcedureResult(string procedurename, error? err){
    if (err is error) {
            io:println("\n"+procedurename, " procedre execution failed! ", err);
    } else {
        io:println("\n"+procedurename, " procedure execution success! ", err);
    }
}

# The `executeAllProcedures` function that calls all the procedure execution functions
# + jdbcClient - type jdbc:Client - jdbc client instance
# + return - error?
function executeAllProcedures(jdbc:Client jdbcClient) returns error?{
    error? err;

    // err = executeNumericProcedure(jdbcClient);
    // printExecuteProcedureResult("NUMERIC", err);

    // err = executeCharacterProcedure(jdbcClient);
    // printExecuteProcedureResult("CHARACTER", err);

    // err = executeDatetimeProcedure(jdbcClient);
    // printExecuteProcedureResult("DATETIME", err);

    // err = executeBLOBProcedure(jdbcClient);
    // printExecuteProcedureResult("BLOB", err);

    // err = executeCLOBProcedure(jdbcClient);
    // printExecuteProcedureResult("CLOB", err);

    // err = executeNCLOBProcedure(jdbcClient);
    // printExecuteProcedureResult("NCLOB", err);

    err = executeLongProcedure(jdbcClient);
    printExecuteProcedureResult("LONG", err);

    // err = executeRawProcedure(jdbcClient);
    // printExecuteProcedureResult("RAW", err);

    // err = executeAnsiProcedure(jdbcClient);
    // printExecuteProcedureResult("ANSI", err);

    // err = executeSQLDSProcedure(jdbcClient);
    // printExecuteProcedureResult("SQLDS", err);

    // err = executeUserDefinedProcedure(jdbcClient);
    // printExecuteProcedureResult("USERDEF", err);

    // err = executeRefProcedure(jdbcClient);
    // printExecuteProcedureResult("REF", err); 

    // err = executeVarrayProcedure(jdbcClient);
    // printExecuteProcedureResult("VARRAY", err); 

    // err = executeXMLProcedure(jdbcClient);
    // printExecuteProcedureResult("XML", err); 

    // err = executeAnyProcedure(jdbcClient);
    // printExecuteProcedureResult("ANY", err); 
}