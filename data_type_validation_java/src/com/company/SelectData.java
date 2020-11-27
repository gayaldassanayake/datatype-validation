package com.company;

import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;
import oracle.sql.*;
//import oracle.spatial.geometry.JGeometry;

import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

import static oracle.jdbc.OracleType.VARCHAR2;

public class SelectData {
    private Connection conn;
    private OracleConnection oraConn;

    public SelectData(Connection conn, OracleConnection oraConn){
        this.conn = conn;
        this.oraConn = oraConn;
    }

    private void selectTime() throws SQLException {

        String selectQuery = "select " +
                "COL_DATE, COL_TIMESTAMP_1, COL_TIMESTAMP_2, COL_TIMESTAMP_3, " +
                "COL_INTERVAL_YEAR_TO_MONTH, COL_INTERVAL_DAY_TO_SECOND "+
                "from DATETIME";

        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(selectQuery);

        while(rs.next()){
            Date date = rs.getDate("COL_DATE");
            Timestamp timestamp1 = rs.getTimestamp("COL_TIMESTAMP_1");
            Timestamp timestamp2 = rs.getTimestamp("COL_TIMESTAMP_2");
            Timestamp timestamp3 = rs.getTimestamp("COL_TIMESTAMP_3");
            String ytom = rs.getString("COL_INTERVAL_YEAR_TO_MONTH");
            String dtos = rs.getString("COL_INTERVAL_DAY_TO_SECOND");

            System.out.println("date: "+date);
            System.out.println("timestamp: "+timestamp1);
            System.out.println("timestamp w/ tz: "+timestamp2);
            System.out.println("timestamp w/ ltz: "+timestamp3);
            System.out.println("year to month interval: "+ytom);
            System.out.println("days to second interval: "+dtos);
        }


    }

    private void selectBFile() throws SQLException, IOException {
        String selectQuery = "SELECT COL_BFILE FROM BFILE";

        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(selectQuery);

        rs.next();

        oracle.sql.BFILE bfile = ((OracleResultSet)rs).getBFILE (1);
        System.out.println(bfile.getName());
        bfile.openFile();

        InputStream in = bfile.getBinaryStream();
        int length ;

        byte[] buf = new byte[6];

        while ((length = in.read(buf)) != -1)
        {
            StringBuffer sb = new StringBuffer(length);
            for (int i=0; i<length; i++)
                sb.append( (char)buf[i] );
            System.out.println(sb.toString());
        }

        in.close();

        bfile.closeFile();
    }

    public void selectRowId() throws SQLException{

        String selectQuery = "SELECT ROWID FROM CHARACTER";

        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(selectQuery);

        rs.next();
        java.sql.RowId rowId_1 = rs.getRowId(1);

        System.out.println(rowId_1.toString());

    }

    public void objectSelect() throws SQLException {

        Statement stmt = conn.createStatement();

        ResultSet rs= stmt.executeQuery("SELECT * FROM USERDEFINED");

        while(rs.next()) {

            oracle.sql.STRUCT selectStruct = ((OracleResultSet) rs).getSTRUCT(2);

            Object[] selectAttr = selectStruct.getAttributes();

            for (Object attr : selectAttr) {
                System.out.println(attr);
            }
        }

    }

    public void refSelect() throws SQLException {
        String selectQuery = "SELECT COL_VARCHAR2 AS REF FROM CHARACTER";
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(selectQuery);

        while(rs.next()){
            Ref ref = rs.getRef(1);
            System.out.println(ref);
        }
    }

    public void varraySelect() throws SQLException {
        //        oracle.jdbc.OracleConnection oraConn = (oracle.jdbc.OracleConnection)ora.defaultConnection();

        String selectQuery = "SELECT COL_NUMARR FROM VARRAYTABLE";

        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(selectQuery);

        while(rs.next()){
            Array array = rs.getArray(1);
            System.out.println(array);
        }


    }

    public void anyDataSelect() throws SQLException {

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select ANYDATA.ConvertNUMBER(12345) from dual");
        ANYDATA anydt = null;
        if(rs.next()) {
            assert anydt != null;
            anydt = (ANYDATA) rs.getObject(1);
            TypeDescriptor typedesc = anydt.getTypeDescriptor();
            Datum embeddedDatum = anydt.accessDatum();
            if (typedesc.getTypeCode() == TypeDescriptor.TYPECODE_NUMBER) {
                // the embedded object is a NUMBER
                NUMBER numberdatum = (NUMBER)embeddedDatum ;

                System.out.println(numberdatum.intValue());
            }

        }


    }

//    public void geometrySelect(){
//        JGeometry circle = JGeometry.createCircle(10.0, 5.0, 4.0,1);
//    }


    public void select() throws SQLException, IOException {
        selectTime();
        selectBFile();
        selectRowId();
        objectSelect();
        refSelect();
        varraySelect();
        anyDataSelect();
    }
}
