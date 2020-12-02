package com.company;

import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;
import oracle.sql.CHAR;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.sql.*;

public class InsertData {
    private Connection conn;
    private OracleConnection oraConn;

    public InsertData(Connection conn,OracleConnection oraConn){
        this.conn = conn;
        this.oraConn = oraConn;
    }

    private void insertTime() throws SQLException {

        String insertQuery = "insert into datetime(" +
                "COL_DATE, COL_TIMESTAMP_1, COL_TIMESTAMP_2, COL_TIMESTAMP_3, " +
                "COL_INTERVAL_YEAR_TO_MONTH, COL_INTERVAL_DAY_TO_SECOND)"+
                "values(?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = conn.prepareStatement(insertQuery);

        java.util.Date date = new java.util.Date();
        long t = date.getTime();
        java.sql.Date sqlDate = new java.sql.Date(t);

        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);

        String ytom = "11-10";
        String dtos = "200 5:12:10.222";


        pstmt.setDate(1,sqlDate);
        pstmt.setTimestamp(2,sqlTimestamp);
        pstmt.setTimestamp(3,sqlTimestamp);
        pstmt.setTimestamp(4,sqlTimestamp);
        pstmt.setString(5, ytom);
        pstmt.setString(6, dtos);

        pstmt.executeUpdate();
    }

    public void insertBFile() throws SQLException {

        Statement stmt = conn.createStatement();

//        String cmd;
//        cmd = "CREATE DIRECTORY test_dir AS 'src/com/resources'";
//        stmt.execute (cmd);

        String filepath = "bigfile.txt";

        String insertQuery = "INSERT INTO BFILE(COL_BFILE) VALUES (bfilename('test_dir', 'filepath'))";

        stmt.executeUpdate(insertQuery);

        ResultSet rs = stmt.executeQuery("SELECT COL_BFILE FROM BFILE");
        rs.next();
        oracle.sql.BFILE bfile = ((OracleResultSet)rs).getBFILE(1);

        OraclePreparedStatement ops = (OraclePreparedStatement)conn.prepareStatement
                ("INSERT INTO BFILE(COL_BFILE) VALUES (?)");

        ops.setBFILE(1, bfile);
        ops.execute();

    }

    public void insertRowId() throws SQLException{

        String selectQuery = "SELECT ROWID FROM CHARACTER";

        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(selectQuery);

        rs.next();
        java.sql.RowId rowId_1 = rs.getRowId(1);

        System.out.println(rowId_1.toString());

        PreparedStatement pstmt = conn.prepareStatement(
                "INSERT INTO CHARACTER (COL_VARCHAR2) VALUES (?)");

        pstmt.setRowId(1, rowId_1);

        pstmt.executeUpdate();
    }

    public void insertObject() throws SQLException {
        StructDescriptor structdesc = StructDescriptor.createDescriptor("OBJECT_TYPE", conn);

        String attr1 = "attr1";
        String attr2 = "attr2";
        String attr3 = "attr3234";

        Object[] attributes = {attr1, attr2, attr3};

        STRUCT struct = new STRUCT(structdesc, conn, attributes);

        PreparedStatement pstmt= conn.prepareStatement("INSERT INTO USERDEFINED(COL_OBJECT) VALUES (?)");
//        STRUCT mySTRUCT = new STRUCT ();
        ((OraclePreparedStatement)pstmt).setOracleObject(1, struct);

        pstmt.executeUpdate();

    }

    public void insertVarray() throws SQLException {

        String insertQuery = "INSERT INTO VARRAYTABLE(COL_NUMARR, COL_VVCARR) VALUES (?, ?)";

        PreparedStatement pstmt = oraConn.prepareStatement(insertQuery);

        Integer[] integers = {1,5,43,23};
        String[] strings = {"Helo", "little", "star"};

        Array integersSql = oraConn.createARRAY("NUMARRTYPE", integers);
        Array charactersSql = oraConn.createARRAY("VCARRTYPE", strings);

        pstmt.setArray(1, integersSql);
        pstmt.setArray(2, charactersSql);

        pstmt.executeUpdate();

    }

    public void insertGeometry() throws SQLException {
//        PreparedStatement ps = conn.prepareStatement("UPDATE states set geometry=? where name='Florida'");
//        //convert JGeometry instance to DB STRUCT
//        STRUCT obj = JGeometry.store(j_geom, connection);
//        ps.setObject(1, obj);
//        ps.execute();
    }

    public void insertAnydata() throws SQLException {
        String insertQuery = "INSERT INTO ANYDATA2(COL_ANYDATA) VALUES SYS.ANYDATA.convertVarchar2(?)";

        String param = "Hello world";
        CHAR ch = new CHAR( param , null);
//        VARCHAR2 varcharparam = new VARCHAR2();
//        Datum embeddedDatum = new ;
//        ANYDATA anydataparam = ANYDATA.convertDatum()

        PreparedStatement pstmt = conn.prepareStatement(insertQuery);

        ((OraclePreparedStatement)pstmt).setObject(1, ch);

        pstmt.executeUpdate();
    }

    public void InsertXML() throws SQLException, MalformedURLException {
        String insertQuery = "insert into XMLTYPES(COL_XMLTYPE, COL_HTTPURITYPE) values (?, ?)";
        String xmlparam = "<PO><PONO>200</PONO><PNAME>PO_2</PNAME></PO>";
        String dburi = "<HR><DBTAB><ROW><A>...data_in_column_A...</A></ROW></DBTAB></HR>";
        String httpuri = "https://www.geeksforgeeks.org/url-class-java-examples/";

        URL httpuriparam = URI.create(httpuri).toURL();

        OraclePreparedStatement pstmt = (OraclePreparedStatement) conn.prepareStatement(insertQuery);

        pstmt.setString(1, xmlparam);
        pstmt.setURL(2, httpuriparam);

        pstmt.execute();
    }

    public void insert() throws SQLException, MalformedURLException {
//        insertTime();
//        insertBFile();
//        insertRowId();
//        insertObject();
//        insertVarray();
//        insertAnydata();
        InsertXML();
    }
}
