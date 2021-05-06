package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/simpleboard";
            String dbID = "root";
            String dbPW = "root";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPW);
            System.out.println(conn);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public int login(String userID, String userPW){
        String SQL = "select userPW from user where userID = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPW)){
                    return 1; // login success
                }
                else
                    return 0; // login fail
            }
            return -1; // no signal id
        } catch(Exception e){
            e.printStackTrace();
        }
        return -2; // database 오류
    }
}
