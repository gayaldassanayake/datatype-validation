import ballerina/sql;

// ---------------NUMERIC -----------------------
sql:DoubleValue NUMBER_IN = new(98765431.234324);
sql:InOutParameter NUMBER_INOUT= new(-343943.2334);
sql:DoubleOutParameter NUMBER_OUT = new();

sql:DoubleValue FLOAT_IN = new(98765431.234324);
sql:InOutParameter FLOAT_INOUT = new(-343943.2334);
sql:DoubleOutParameter FLOAT_OUT = new();

sql:DoubleValue BINARY_FLOAT_IN = new(98765431.234324);
sql:InOutParameter BINARY_FLOAT_INOUT = new(-343943.2334);
sql:DoubleOutParameter BINARY_FLOAT_OUT = new();

sql:DoubleValue BINARY_DOUBLE_IN = new(98765431.234324);
sql:InOutParameter BINARY_DOUBLE_INOUT = new(-343943.2334);
sql:DoubleOutParameter BINARY_DOUBLE_OUT = new();

// ---------------CHARACTER -----------------------
sql:VarcharValue VARCHAR2_IN = new("Hello there text");
sql:InOutParameter VARCHAR2_INOUT= new("In out text");
sql:VarcharOutParameter VARCHAR2_OUT = new();

sql:VarcharValue VARCHAR_IN = new("Hello there text");
sql:InOutParameter VARCHAR_INOUT= new("In out text");
sql:VarcharOutParameter VARCHAR_OUT = new();

sql:NVarcharValue NVARCHAR2_IN = new("Hello there text");
sql:InOutParameter NVARCHAR2_INOUT= new("In out text");
sql:NVarcharOutParameter NVARCHAR2_OUT = new();

sql:CharValue CHAR_IN = new("Hello there text");
sql:InOutParameter CHAR_INOUT= new("In out text");
sql:CharOutParameter CHAR_OUT = new();

sql:NCharValue NCHAR_IN = new("Hello there text");
sql:InOutParameter NCHAR_INOUT= new("In out text");
sql:NCharOutParameter NCHAR_OUT = new();

// -------------DATETIME----------------------------
sql:DateTimeValue DATETIME_TEMP = new("1000-01-01 09:33:45.00");
sql:TimestampValue TIMESTAMP_TEMP = new("1000-01-01 09:33:45.00");
sql:TimestampValue TIMESTAMP_TEMPTZ = new("1000-01-01 09:33:45.00");
sql:TimestampValue TIMESTAMP_TEMPTZL = new("1000-01-16 09:33:45.00");

sql:DateTimeValue DATETIME_IN = new("2002-01-16 09:33:45.00");
sql:InOutParameter DATETIME_INOUT= new(DATETIME_TEMP);
sql:DateTimeOutParameter DATETIME_OUT = new();

sql:TimestampValue TIMESTAMP_IN = new("2002-01-16 09:33:45.00");
sql:InOutParameter TIMESTAMP_INOUT= new(TIMESTAMP_TEMP);
sql:TimestampOutParameter TIMESTAMP_OUT = new();

sql:TimestampValue TIMESTAMPTZ_IN = new("2002-01-16T09:33:45+05:30");
sql:InOutParameter TIMESTAMPTZ_INOUT= new(TIMESTAMP_TEMPTZ);
sql:TimestampOutParameter TIMESTAMPTZ_OUT = new();

sql:TimestampValue TIMESTAMPTZL_IN = new("2002-01-16 09:33:45.00");
sql:InOutParameter TIMESTAMPTZL_INOUT= new(TIMESTAMP_TEMPTZL);
sql:TimestampOutParameter TIMESTAMPTZL_OUT = new();

sql:VarcharValue INTERVALY2M_IN = new("24-05");
sql:InOutParameter INTERVALY2M_INOUT = new("01-00");
sql:VarcharOutParameter INTERVALY2M_OUT = new();

sql:VarcharValue INTERVALD2S_IN = new("4 5:12:10.22");
sql:InOutParameter INTERVALD2S_INOUT = new("4 5:12:10.22");
sql:VarcharOutParameter INTERVALD2S_OUT = new();

// -------------BLOB----------------------------
byte[] blob=check readFileAsByte();
byte[] mediumBlob = stripArray(blob, 15000);
byte[] smallBlob = stripArray(blob, 500);

// sql:BlobValue BLOB_IN = new(mediumBlob);
// sql:InOutParameter BLOB_INOUT = new(smallBlob);
// sql:BlobOutParameter BLOB_OUT = new();

// // -------------CLOB----------------------------
// string clob =check readFileAsCharacter();
// string mediumClob = check 'string:fromBytes(stripArray(clob.toBytes(), 2000));

// sql:ClobValue CLOB_IN = new(mediumClob);  
// sql:InOutParameter CLOB_INOUT = new(mediumClob);
// sql:ClobOutParameter CLOB_OUT = new();

// // -------------NCLOB----------------------------

// sql:NClobValue NCLOB_IN = CLOB_IN; 
// sql:InOutParameter NCLOB_INOUT = CLOB_INOUT;
// sql:NClobOutParameter NCLOB_OUT = new();

// // -------------LONG----------------------------
sql:BlobValue LONG_IN = new(mediumBlob); 
sql:InOutParameter LONG_INOUT = new(smallBlob);
sql:BlobOutParameter LONG_OUT = new();

// // -------------RAW----------------------------

// sql:BlobValue RAW_IN = new(mediumBlob); 
// sql:InOutParameter RAW_INOUT = new(smallBlob);
// sql:BlobOutParameter RAW_OUT = new();

// sql:BlobValue LONGRAW_IN = new(mediumBlob); 
// sql:InOutParameter LONGRAW_INOUT = new(smallBlob);
// sql:BlobOutParameter LONGRAW_OUT = new();


// -------------ANSI----------------------------

sql:CharValue CHARACTER_ANSI_IN = new("Hello, Worold");
sql:InOutParameter CHARACTER_ANSI_INOUT = new("Hello, Worold");
sql:CharOutParameter CHARACTER_ANSI_OUT = new();

sql:CharValue CHAR_ANSI_IN = new("Hello, Worold");
sql:InOutParameter CHAR_ANSI_INOUT = new("Hello, Worold");
sql:CharOutParameter CHAR_ANSI_OUT = new();

sql:VarcharValue CHARACTER_VAR_ANSI_IN = new("Hello, Worold");
sql:InOutParameter CHARACTER_VAR_ANSI_INOUT = new("Hello, Worold");
sql:VarcharOutParameter CHARACTER_VAR_ANSI_OUT = new();

sql:NCharValue NATIONAL_CHARACTER_ANSI_IN = new("Hello, Worold");
sql:InOutParameter NATIONAL_CHARACTER_ANSI_INOUT = new("Hello, Worold");
sql:NCharOutParameter NATIONAL_CHARACTER_ANSI_OUT = new();

sql:NCharValue NATIONAL_CHAR_ANSI_IN = new("Hello, Worold");
sql:InOutParameter NATIONAL_CHAR_ANSI_INOUT = new("Hello, Worold");
sql:NCharOutParameter NATIONAL_CHAR_ANSI_OUT = new();

sql:NVarcharValue NATIONAL_CHARACTER_VAR_ANSI_IN = new("Hello, Worold");
sql:InOutParameter NATIONAL_CHARACTER_VAR_ANSI_INOUT = new("Hello, Worold");
sql:NVarcharOutParameter NATIONAL_CHARACTER_VAR_ANSI_OUT = new();

sql:NVarcharValue NATIONAL_CHAR_VAR_ANSI_IN = new("Hello, Worold");
sql:InOutParameter NATIONAL_CHAR_VAR_ANSI_INOUT = new("Hello, Worold");
sql:NVarcharOutParameter NATIONAL_CHAR_VAR_ANSI_OUT = new();

sql:NCharValue NCHAR_VAR_ANSI_IN = new("Hello, Worold");
sql:InOutParameter NCHAR_VAR_ANSI_INOUT = new("Hello, Worold");
sql:NCharOutParameter NCHAR_VAR_ANSI_OUT = new();

sql:FloatValue NUMERIC_ANSI_IN = new(12343.456);
sql:InOutParameter NUMERIC_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter NUMERIC_ANSI_OUT = new();

sql:FloatValue INTEGER_ANSI_IN = new(12343.456);
sql:InOutParameter INTEGER_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter INTEGER_ANSI_OUT = new();

sql:FloatValue INT_ANSI_IN = new(12343.456);
sql:InOutParameter INT_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter INT_ANSI_OUT = new();
    
sql:FloatValue SMALLINT_ANSI_IN = new(12343.456);
sql:InOutParameter SMALLINT_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter SMALLINT_ANSI_OUT = new();
    
sql:FloatValue FLOAT_ANSI_IN = new(12343.456);
sql:InOutParameter FLOAT_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter FLOAT_ANSI_OUT = new();
    
sql:FloatValue DOUBLE_PRECISION_ANSI_IN = new(12343.456);
sql:InOutParameter DOUBLE_PRECISION_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter DOUBLE_PRECISION_ANSI_OUT = new();

sql:FloatValue REAL_ANSI_IN = new(12343.456);
sql:InOutParameter REAL_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter REAL_ANSI_OUT = new();
    
sql:FloatValue DECIMAL_ANSI_IN = new(12343.456);
sql:InOutParameter DECIMAL_ANSI_INOUT = new(12343.456);
sql:FloatOutParameter DECIMAL_ANSI_OUT = new();

// --------------SQLDS---------------------------

sql:CharValue CHARACTER_SQLDS_IN = new("Hello, World!");
sql:InOutParameter CHARACTER_SQLDS_INOUT = new("Hello, World!");
sql:CharOutParameter CHARACTER_SQLDS_OUT  = new();

sql:VarcharValue VARCHAR_SQLDS_IN= new("Hello, World!");
sql:InOutParameter VARCHAR_SQLDS_INOUT= new("Hello, World!");
sql:VarcharOutParameter VARCHAR_SQLDS_OUT = new();

sql:VarcharValue LONG_VARCHAR_SQLDS_IN= new("Hello, World!");
sql:InOutParameter LONG_VARCHAR_SQLDS_INOUT= new("Hello, World!");
sql:VarcharOutParameter LONG_VARCHAR_SQLDS_OUT = new();

sql:NumericValue DECIMAL_SQLDS_IN = new(12343.456);
sql:InOutParameter DECIMAL_SQLDS_INOUT = new(12343.456);
sql:NumericOutParameter DECIMAL_SQLDS_OUT  = new();

sql:NumericValue INTEGER_SQLDS_IN = new(12343);
sql:InOutParameter INTEGER_SQLDS_INOUT = new(12343);
sql:NumericOutParameter INTEGER_SQLDS_OUT  = new();

sql:NumericValue SMALLINT_SQLDS_IN = new(12343);
sql:InOutParameter SMALLINT_SQLDS_INOUT = new(12343);
sql:NumericOutParameter SMALLINT_SQLDS_OUT  = new();

sql:NumericValue FLOAT_SQLDS_IN = new(12343.456);
sql:InOutParameter FLOAT_SQLDS_INOUT = new(12343.456);
sql:NumericOutParameter FLOAT_SQLDS_OUT  = new();


// ---------USER DEFINED------------------------
const string OID2 = "19A57209ECB73F91E03400400B40BB24";

type Entry record {|
    string attr1;
    string attr2;
    string attr3;
|};

Entry entry_in = {
    attr1 : "Hello, World",
    attr2 : "Hello, World",
    attr3 : "Hello, World"
};

Entry entry_inout = {
    attr1 : "in out",
    attr2 : "in out",
    attr3 : "in out"
};

sql:StructValue USERDEF_IN = new({
    "attr1" :"Hello, World",
    "attr2" : "Hello, World",
    "attr3" : "Hello, World"
});

sql:StructValue USERDEF_INOUT= new({
    "attr1" : "in out",
    "attr2" : "in out",
    "attr3" : "in out"
});

sql:StructOutParameter USERDEF_OUT= new();

// ------------- REF -------------------
sql:VarcharValue VARCHAR_REF_IN = new("Hello, World!");
// sql:InOutParameter REF_INOUT = new("Hello, World!");
sql:RefOutParameter REF_OUT = new();

// -------------- VARRAY-----------------
string[] strarr = ["Hello", "World", "Cat"];
string[] strarr2 = ["Nick", "Kit", "Cat"];

sql:ArrayValue ARRAY_IN = new(strarr);
sql:ArrayValue ARRAY_INOUT = new(strarr);
sql:ArrayOutParameter ARRAY_OUT = new();


// ------------- XML --------------------

string XML_IN = "<book>The Lost World</book>";
sql:InOutParameter XML_INOUT = new(xml `<book>The Found World</book>`);
sql:XMLOutParameter XML_OUT = new();

sql:VarcharValue URITYPE_IN = new("https://ballerina.io/swan-lake/learn/by-example/xml-access.html");
sql:VarcharValue URITYPE_INOUT = new("https://ballerina.io/swan-lake/learn/by-example/xml-access.html");
sql:CharValue URITYPE_OUT = new();

string DBURI_IN = "/oradb/ORACLE/XMLTYPES/ROW[PK=2]/COL_XMLTYPE";


// ---------------- ANY -------------------------
sql:VarcharValue ANYVARCHAR_IN = new("Hello, World!");
sql:InOutParameter ANYVARCHAR_INOUT = new("Hello, World!");
sql:VarcharOutParameter ANYVARCHAR_OUT = new();
