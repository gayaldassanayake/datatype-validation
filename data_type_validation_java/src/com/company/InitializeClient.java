package com.company;

import oracle.jdbc.OracleConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InitializeClient {
    public static Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/ORCLCDB.localdomain", "admin", "password");

        return connection;
    }

    public static OracleConnection getOracleConnection() throws SQLException {
        Properties prp = new Properties();
        prp.put("user","admin");
        prp.put("password", "password");
        oracle.jdbc.OracleDriver ora = new oracle.jdbc.OracleDriver();
        OracleConnection oraConn = (oracle.jdbc.OracleConnection)ora.connect("jdbc:oracle:thin:@//localhost:1521/ORCLCDB.localdomain", prp);
        return oraConn;

    }

//    public void createTable(String tableName) throws SQLException{
//        try(Connection connection = getConnection()){
//            try(Statement statement = connection.createStatement()
//            ) {
////                    preparedStatement.setString(1,"tableName");
//                String query = "CREATE TABLE HELLO (ID NUMBER, NAME VARCHAR(50));";
//
//                statement.execute(query);
//                }
//
//            } catch (SQLException ex) {
//                logger.log(Level.SEVERE, "Unable to update record", ex);
//                throw new SQLException("Alert! Record could not be updated, "+ex.getMessage(), ex);
//        }
//
//    }

}
