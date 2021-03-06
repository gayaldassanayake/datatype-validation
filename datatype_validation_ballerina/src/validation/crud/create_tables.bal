import ballerina/sql;
import ballerina/io;
import ballerina/java.jdbc;

const string OID = "19A57209ECB73F91E03400400B40BB23";
const string OID3 = "19A57209ECB73F91E03400400B40BB25";


function initializeTableNumeric(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('NUMERIC'); END;");
    result = check jdbcClient->execute("CREATE TABLE NUMERIC(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_NUMBER  NUMBER, " +
        "COL_FLOAT  FLOAT, " +
        "COL_BINARY_FLOAT BINARY_FLOAT, "+
        "COL_BINARY_DOUBLE BINARY_DOUBLE, "+
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableCharacter(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('CHARACTER'); END;");
    result = check jdbcClient->execute("CREATE TABLE CHARACTER(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_VARCHAR2  VARCHAR2(4000), " +
        "COL_VARCHAR  VARCHAR2(4000), " +
        "COL_NVARCHAR2 NVARCHAR2(2000), "+
        "COL_CHAR CHAR(2000), "+
        "COL_NCHAR NCHAR(1000), "+
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableDateTime(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('DATETIME'); END;");
    result = check jdbcClient->execute("ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-RR HH:MI:SS AM'");
    result = check jdbcClient->execute("alter session set NLS_TIMESTAMP_TZ_FORMAT = 'DD-MON-RR HH:MI:SS AM TZR'");
    result = check jdbcClient->execute("CREATE TABLE DATETIME(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_DATE  DATE, " +
        "COL_TIMESTAMP_1  TIMESTAMP (9), " +
        "COL_TIMESTAMP_2  TIMESTAMP (9) WITH TIME ZONE, " +
        "COL_TIMESTAMP_3  TIMESTAMP (9) WITH LOCAL TIME ZONE, " +
        "COL_INTERVAL_YEAR_TO_MONTH INTERVAL YEAR TO MONTH, "+
        "COL_INTERVAL_DAY_TO_SECOND INTERVAL DAY(9) TO SECOND(9), "+
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableBLOB(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('BLOB'); END;");
    result = check jdbcClient->execute("CREATE TABLE BLOB(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_BLOB BLOB, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableRAW(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('RAWT'); END;");
    result = check jdbcClient->execute("CREATE TABLE RAWT(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_RAW  RAW(2000), " +
        "COL_LONG_RAW  LONG RAW, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableCLOB(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('CLOB'); END;");
    result = check jdbcClient->execute("CREATE TABLE CLOB(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_CLOB  CLOB, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableNCLOB(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('NCLOB'); END;");
    result = check jdbcClient->execute("CREATE TABLE NCLOB(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_NCLOB  NCLOB, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableBFILE(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('BFILE'); END;");
    result = check jdbcClient->execute("CREATE TABLE BFILE(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_BFILE  BFILE, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableLong(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('LONGTYPE'); END;");
    result = check jdbcClient->execute("CREATE TABLE LONGTYPE(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_LONG LONG, "+
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableANSITypes(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('ANSITYPES'); END;");
    result = check jdbcClient->execute("CREATE TABLE ANSITYPES(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_CHARACTER  CHARACTER(256), " +
        "COL_CHARACTER_VAR  CHARACTER VARYING(256), " +

        "COL_NATIONAL_CHARACTER  NATIONAL CHARACTER(256), " +
        "COL_NATIONAL_CHAR  NATIONAL CHAR(256), " +

        "COL_NATIONAL_CHARACTER_VAR  NATIONAL CHARACTER VARYING(256), " +
        "COL_NATIONAL_CHAR_VAR  NATIONAL CHAR VARYING(256), " +
        "COL_NCHAR_VAR  NCHAR VARYING(256), " +

        "COL_NUMERIC  NUMERIC, " +
        "COL_DECIMAL  DECIMAL, " +

        "COL_INTEGER  INTEGER, " +
        "COL_INT  INT, " +
        "COL_SMALLINT  SMALLINT, " +

        "COL_FLOAT  FLOAT, " +
        "COL_DOUBLE_PRECISION  DOUBLE PRECISION, " +
        "COL_REAL  REAL, " +
        
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableSQLDSTypes(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('SQLDS'); END;");
    result = check jdbcClient->execute("CREATE TABLE SQLDS(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_CHARACTER  CHARACTER(255), " +
        "COL_LONG_VARCHAR  LONG VARCHAR, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}


function initializeTableVarray(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("DROP TYPE VCARRTYPE FORCE");
    result = check jdbcClient->execute("DROP TYPE NUMARRTYPE FORCE");

    result = check jdbcClient->execute(
        " CREATE OR REPLACE TYPE VCARRTYPE AS VARRAY(6) OF VARCHAR(100);"
        );

    result = check jdbcClient->execute(
        " CREATE OR REPLACE TYPE NUMARRTYPE AS VARRAY(6) OF NUMBER;"
        );

    result = check jdbcClient->execute("CREATE TABLE VARRAYTABLE(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_VVCARR VCARRTYPE, " +
        "COL_NUMARR NUMARRTYPE, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableUserDefined(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('USERDEFINED'); END;");
    result = check jdbcClient->execute("DROP TYPE OBJECT_TYPE FORCE");


    result = check jdbcClient->execute(
        "CREATE OR REPLACE TYPE OBJECT_TYPE OID '"+ OID3 +"' AS OBJECT(" +
        "ATTR1 VARCHAR(20), "+
        "ATTR2 VARCHAR(20), "+
        "ATTR3 VARCHAR(20), "+
        "MAP MEMBER FUNCTION GET_ATTR1 RETURN NUMBER "+
        ") "
    );
    
    result = check jdbcClient->execute(
        "CREATE OR REPLACE TYPE BODY OBJECT_TYPE AS "+
            "MAP MEMBER FUNCTION GET_ATTR1 RETURN NUMBER IS "+
            "BEGIN "+
                "RETURN ATTR1; "+
            "END; "+
        "END; "
        );

    result = check jdbcClient->execute(
        " CREATE OR REPLACE TYPE VARRAY_TYPE AS VARRAY(6) OF OBJECT_TYPE;"
        );

    result = check jdbcClient->execute("CREATE TABLE USERDEFINED(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_OBJECT OBJECT_TYPE, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableAnyTypes(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('ANYTYPES'); END;");
    result = check jdbcClient->execute("CREATE TABLE ANYTYPES(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_ANYTYPE1 SYS.ANYTYPE, " +
        "COL_ANYTYPE2 SYS.ANYTYPE, " +
        "COL_ANYTYPE3 SYS.ANYTYPE, " +
        "COL_ANYDATA1 SYS.ANYDATA, " +
        "COL_ANYDATA2 SYS.ANYDATA, " +
        "COL_ANYDATA3 SYS.ANYDATA, " +
        "COL_ANYDATASET1 SYS.ANYDATASET, " +
        "COL_ANYDATASET2 SYS.ANYDATASET, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableXMLTypes(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('XMLTYPES'); END;");
    result = check jdbcClient->execute("CREATE TABLE XMLTYPES(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_XMLTYPE XMLTYPE, " +
        "COL_HTTPURITYPE HTTPURITYPE, " +
        "COL_DBURITYPE DBURITYPE, " +
        "COL_XDBURITYPE XDBURITYPE, " +
        "COL_URI_TYPE URITYPE, "+
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeTableGeometryTypes(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('GEOMETRYTYPES'); END;");
    result = check jdbcClient->execute("CREATE TABLE GEOMETRYTYPES(" +
        "PK NUMBER GENERATED ALWAYS AS IDENTITY, "+
        "COL_SDO_GEOMETRY SDO_GEOMETRY, " +
        "COL_SDO_TOPO_GEOMETRY SDO_TOPO_GEOMETRY, " +
        "COL_SDO_GEORASTER SDO_GEORASTER, " +
        "PRIMARY KEY(PK) "+
        ")"
        );
}

function initializeREFTable(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('REFTABLE'); END;");

    result = check jdbcClient->execute("DROP TYPE REF_TYPE FORCE");

    result = check jdbcClient->execute(
        "CREATE OR REPLACE TYPE REF_TYPE OID '"+ OID +"' AS OBJECT(" +
        "ATTR1 VARCHAR(20), "+
        "ATTR2 VARCHAR(20)   "+
        ") "
    );
    result = check jdbcClient->execute("CREATE TABLE REFTABLE OF REF_TYPE");
}


function initializeNestedTable(jdbc:Client jdbcClient)returns sql:Error?{
    sql:ExecutionResult result = check jdbcClient->execute("BEGIN DROPTABLE('NESTEDTABLE'); END;");

    result = check jdbcClient->execute(
        "CREATE TABLE NESTEDTABLE ("+
            "region_id     NUMBER,"+
            "region_name   VARCHAR2(25),"+
            "countries     nt_country_typ) "+
            "NESTED TABLE countries STORE AS nt_countries_tab"+
            " (NESTED TABLE locations STORE AS nt_locations_tab)"
        );
}

# The `printTableCreationResult` function that prints out the result of the table creation
# + tablename - type string - name of the table
# + err - type error? - error during execution
function printTableCreationResult(string tablename, sql:Error? err){
    if (err is sql:Error) {
            io:println(tablename, " table initialization failed! ", err);
        } else {
            io:println(tablename, " table initialization success! ", err);
        }
}

# The `initializeAllTables` function that calls all the table creation functions
# + jdbcClient - type jdbc:Client - jdbc client instance
function initializeAllTables(jdbc:Client jdbcClient){
    sql:Error? err;

    // err = initializeTableCharacter(jdbcClient);
    // printTableCreationResult("Character", err);

    // err = initializeTableNumeric(jdbcClient);
    // printTableCreationResult("Numeric", err);

    // err = initializeTableDateTime(jdbcClient);
    // printTableCreationResult("DateTime", err);
        
    // err = initializeTableLong(jdbcClient);
    // printTableCreationResult("LONGTYPE", err);

    // err = initializeTableCLOB(jdbcClient);
    // printTableCreationResult("CLOB", err);

    // err = initializeTableNCLOB(jdbcClient);
    // printTableCreationResult("NCLOB", err);

    // err = initializeTableRAW(jdbcClient);
    // printTableCreationResult("RAW", err);

    // err = initializeTableBFILE(jdbcClient);
    // printTableCreationResult("BFILE", err);

    // err = initializeTableBLOB(jdbcClient);
    // printTableCreationResult("BLOB", err);

    // err = initializeTableANSITypes(jdbcClient);
    // printTableCreationResult("ANSITYPES", err);

    // err = initializeTableSQLDSTypes(jdbcClient);
    // printTableCreationResult("SQLDSTYPES", err);

    err = initializeTableUserDefined(jdbcClient);
    printTableCreationResult("USERDEFINED", err);

    // err = initializeTableAnyTypes(jdbcClient);
    // printTableCreationResult("ANYTYPES", err);

    // err = initializeTableXMLTypes(jdbcClient);
    // printTableCreationResult("XMLTYPES", err);

    // err = initializeTableGeometryTypes(jdbcClient);
    // printTableCreationResult("GEOMATRYTYPES",err);

    // err = initializeREFTable(jdbcClient);
    // printTableCreationResult("REF",err);

    // err = initializeNestedTable(jdbcClient);
    // printTableCreationResult("NESTEDTABLE",err);
}
