package com.company;

import oracle.jdbc.*;
import oracle.sql.*;
import oracle.xdb.XMLType;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.*;

public class Procedure {
    private Connection conn;
    private OracleConnection oraConn;

    public Procedure(Connection conn, OracleConnection oraConn){
        this.conn = conn;
        this.oraConn = oraConn;
    }

    private void timeProc() throws SQLException {
        // ---------------------------------------
        java.util.Date date = new java.util.Date();
        long t = date.getTime();
        java.sql.Date dateIn = new java.sql.Date(t);

        INTERVALYM ytomIn = new INTERVALYM("09-10");
        INTERVALDS dtosIn = new INTERVALDS("20 5:12:10.222");

        oracle.sql.TIMESTAMP timestamp1In = new oracle.sql.TIMESTAMP(new byte[]{(byte) t});
        oracle.sql.TIMESTAMPTZ timestamp2In = new oracle.sql.TIMESTAMPTZ(new byte[]{(byte) t});
        oracle.sql.TIMESTAMPLTZ timestamp3In = new oracle.sql.TIMESTAMPLTZ(new byte[]{(byte) t});

        // --------------------------------------
        date = new java.util.Date();
        t = date.getTime();

        java.sql.Date dateInOut = new java.sql.Date(t);

        INTERVALYM ytomInOut = new INTERVALYM("11-10");
        INTERVALDS dtosInOut = new INTERVALDS("20 5:12:10.222");

        oracle.sql.TIMESTAMP timestamp1InOut = new oracle.sql.TIMESTAMP(new byte[]{(byte) t});
        oracle.sql.TIMESTAMPTZ timestamp2InOut = new oracle.sql.TIMESTAMPTZ(new byte[]{(byte) t});
        oracle.sql.TIMESTAMPLTZ timestamp3InOut = new oracle.sql.TIMESTAMPLTZ(new byte[]{(byte) t});
        // ----------------------------------------
        String query = "CALL DATETIMEPROC(?, ?, ?,  ?, ?, ?,  ?, ?, ?, ?, ?, ?,  ?, ?, ?,  ?, ?, ? )";

        CallableStatement call = conn.prepareCall(query);

        call.setDate(1, dateIn);
        call.registerOutParameter(2, Types.DATE);
        call.setDate(2, dateInOut);
        call.registerOutParameter(3, Types.DATE);

        ((OracleCallableStatement)call).setTIMESTAMP(4, timestamp1In);
        call.registerOutParameter(5, OracleTypes.TIMESTAMP);
        ((OracleCallableStatement)call).setTIMESTAMP(5, timestamp1InOut);
        call.registerOutParameter(6, OracleTypes.TIMESTAMP);

        ((OracleCallableStatement)call).setTIMESTAMPTZ(7, timestamp2In);
        call.registerOutParameter(8, OracleTypes.TIMESTAMPTZ);
        ((OracleCallableStatement)call).setTIMESTAMPTZ(8, timestamp2InOut);
        call.registerOutParameter(9, OracleTypes.TIMESTAMPTZ);

        ((OracleCallableStatement)call).setTIMESTAMPLTZ(10, timestamp3In);
        call.registerOutParameter(11, OracleTypes.TIMESTAMPLTZ);
        ((OracleCallableStatement)call).setTIMESTAMPLTZ(11, timestamp3InOut);
        call.registerOutParameter(12, OracleTypes.TIMESTAMPLTZ);

        ((OracleCallableStatement)call).setINTERVALYM(13, ytomIn);
        call.registerOutParameter(14, OracleTypes.INTERVALYM);
        ((OracleCallableStatement)call).setINTERVALYM(14, ytomInOut);
        call.registerOutParameter(15, OracleTypes.INTERVALYM);

        ((OracleCallableStatement)call).setINTERVALDS(16, dtosIn);
        call.registerOutParameter(17, OracleTypes.INTERVALDS);
        ((OracleCallableStatement)call).setINTERVALDS(17, dtosInOut);
        call.registerOutParameter(18, OracleTypes.INTERVALDS);

        call.execute();

        java.sql.Date dateOut = call.getDate(3);
        oracle.sql.TIMESTAMP timestamp1Out = ((OracleCallableStatement)call).getTIMESTAMP(6);
        oracle.sql.TIMESTAMPTZ timestamp2Out = ((OracleCallableStatement)call).getTIMESTAMPTZ(9);
        oracle.sql.TIMESTAMPLTZ timestamp3Out = ((OracleCallableStatement)call).getTIMESTAMPLTZ(12);
        INTERVALYM ytomOut = ((OracleCallableStatement)call).getINTERVALYM(15);
        INTERVALDS dtosOut = ((OracleCallableStatement)call).getINTERVALDS(18);

        System.out.println(dateIn);
        System.out.println(dateInOut);
        System.out.println(dateOut);
        System.out.println();

        System.out.println(timestamp1In.timestampValue());
        System.out.println(timestamp1InOut.timestampValue());
        System.out.println(timestamp1Out.timestampValue());
        System.out.println();

        System.out.println(timestamp2In.timestampValue());
        System.out.println(timestamp2InOut.timestampValue());
        System.out.println(timestamp2Out.timestampValue());
        System.out.println();

        System.out.println(timestamp3In.timestampValue());
        System.out.println(timestamp3InOut.timestampValue());
        System.out.println(timestamp3Out.timestampValue());
        System.out.println();

        System.out.println(ytomIn);
        System.out.println(ytomInOut);
        System.out.println(ytomOut);
        System.out.println();

        System.out.println(dtosIn);
        System.out.println(dtosInOut);
        System.out.println(dtosOut);
        System.out.println();


    }

    void bfileproc() throws SQLException {

        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT COL_BFILE FROM BFILE");
        rs.next();
        oracle.sql.BFILE bfile = ((OracleResultSet)rs).getBFILE(1);

        String query = "CALL BFILEPROC(?, ?, ?)";

        OracleCallableStatement call = (OracleCallableStatement) oraConn.prepareCall(query);

        call.setBFILE(1, bfile);
        call.registerOutParameter(2, OracleTypes.BFILE);
        call.setBFILE(2, bfile);
        call.registerOutParameter(3, OracleTypes.BFILE);

        call.execute();

        oracle.sql.BFILE bfileOut = call.getBFILE(3);

        System.out.println(bfile);
        System.out.println(bfile);
        System.out.println(bfileOut);
        System.out.println();
    }

    public void objectproc() throws SQLException {

        StructDescriptor structdesc = StructDescriptor.createDescriptor("OBJECT_TYPE", conn);

        String attrIn1 = "attr1";
        String attrIn2 = "attr2";
        String attrIn3 = "attr3234";

        String attrInOut1 = "new";
        String attrInOut2 = "new";
        String attrInOut3 = "new";

        Object[] attributesIn = {attrIn1, attrIn2, attrIn3};
        Object[] attributesInOut = {attrIn1, attrIn2, attrIn3};

        STRUCT structIn = new STRUCT(structdesc, conn, attributesIn);

        STRUCT structInOut = new STRUCT(structdesc, conn, attributesInOut);

//        STRUCT[] structs = {structIn,structInOut};

//        ArrayDescriptor descriptor = ArrayDescriptor.createDescriptor( "IDS_TABLE", conn );
//        ARRAY array_to_pass = new ARRAY( descriptor, conn, idsArray );
        String query = "CALL USERDEFINED(?, ?, ?,  ?, ?, ?,  ?, ?, ? )";

        CallableStatement call = conn.prepareCall(query);

        ((OraclePreparedStatement)call).setOracleObject(1, structIn);

        call.setObject(2, structInOut);
        call.registerOutParameter(2, Types.JAVA_OBJECT);

        call.registerOutParameter(3, Types.JAVA_OBJECT);

        call.execute();
//        call.getObject(structOut);

    }

    // NESTED TABLES ALSO IS SIMILAR
    public void varayproc() throws SQLException {
        String strarrIn[] = {"one","two", "three"};
        String strarrInOut[] = {"three","two", "three"};

        ArrayDescriptor des = ArrayDescriptor.createDescriptor("VARRTYPE",conn);
        ARRAY ArrayIn = new ARRAY(des, conn, strarrIn);
        ARRAY ArrayInOut = new ARRAY(des, conn, strarrInOut);

        CallableStatement call = conn.prepareCall("CALL VARRAYSPROC(?, ?, ?)");

        call.setArray(1, ArrayIn);

        call.registerOutParameter(2, Types.ARRAY, "VARRTYPE");
        call.setArray(2, ArrayInOut);

        call.registerOutParameter(3, Types.ARRAY, "VARRTYPE");

        call.execute();

        ARRAY ArrayOut = ((OracleCallableStatement)call).getARRAY(3);
        String[] strArr = (String[])(ArrayOut.getArray());

        for(int i=0;i<strArr.length;i++)
            System.out.println("element" + i + ":" + strArr[i] + "\n");
    }

    public void anydataproc() throws SQLException {
        NUMBER numberIn = new NUMBER(12345);
        NUMBER numberInOut = new NUMBER(456456);

        ANYDATA anyDataIn = ANYDATA.convertDatum(numberIn);
        ANYDATA anyDataInOut = ANYDATA.convertDatum(numberIn);

        CallableStatement call = conn.prepareCall("CALL ANYPROC(?, ?, ?)");

        call.setObject(1, anyDataIn);

        call.registerOutParameter(2, OracleTypes.OPAQUE, "SYS.ANYDATA");
        call.setObject(2, anyDataInOut);

        call.registerOutParameter(3, OracleTypes.OPAQUE, "SYS.ANYDATA");
        call.execute();

        ANYDATA anyDataOut = (ANYDATA) call.getObject(3);

        System.out.println(anyDataOut.stringValue());
    }

    // NOT WORKING
    public void uriproc() throws SQLException, URISyntaxException, MalformedURLException {

//        XMLType xmlIn = new XMLType(conn, "<tag><Warehouse whNo= '100'> <Building>Owned</Building> </Warehouse></tag>");
//        XMLType xmlInOut = new XMLType(conn, "<Warehouse whNo= '500'> <Building>None</Building> </Warehouse>");
        URL uriIn = new URL("https://ballerina.io/swan-lake/learn/by-example/xml-access.html");
        URL uriInOut = new URL("https://ballerina.io/someothertext/learn/by-example/xml-access.html");

        OracleCallableStatement call = (OracleCallableStatement) oraConn.prepareCall("CALL XMLPROC( ?, ?, ?)");

//        call.setObject(1, xmlIn);
//
//        call.registerOutParameter(2, OracleTypes.SQLXML);
//        call.setObject(2, xmlInOut);
//
//        call.registerOutParameter(3, OracleTypes.SQLXML);

        call.setURL(1, uriIn);

        call.registerOutParameter(2, Types.JAVA_OBJECT);
        call.setURL(2, uriInOut);

        call.registerOutParameter(3, OracleTypes.JAVA_OBJECT);

        call.execute();

    }




    public void executeAllProcedures() throws SQLException, URISyntaxException, MalformedURLException {
//        timeProc();
//        bfileproc();
//        objectproc();
//        varayproc();
//        anydataproc();
//        uriproc();

    }
}
