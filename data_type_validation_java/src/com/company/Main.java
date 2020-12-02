package com.company;

import oracle.jdbc.OracleConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class Main {

//    public Connection oraConn;

    public static void main(String[] args) {
        System.out.println("Hello, World!");

        try {
            Connection conn = InitializeClient.getConnection();

            OracleConnection oraConn = InitializeClient.getOracleConnection();

            InsertData insdata = new InsertData(conn, oraConn);
//            insdata.insert();

            SelectData selData = new SelectData(conn, oraConn);
            selData.select();

            Procedure procedure = new Procedure(conn, oraConn);
//            procedure.executeAllProcedures();

        } catch (SQLException | IOException throwables) {
            throwables.printStackTrace();
        }
    }
}
