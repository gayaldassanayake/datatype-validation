package com.company;

import oracle.jdbc.OracleConnection;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
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
//            selData.select();

            Procedure procedure = new Procedure(conn, oraConn);
            procedure.executeAllProcedures();

        } catch (SQLException | URISyntaxException | MalformedURLException throwables) {
            throwables.printStackTrace();
        }
    }
}
