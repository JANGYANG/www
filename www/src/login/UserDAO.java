package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO(){
		try {
			  final String driverName= "com.mysql.jdbc.Driver";
			  final String dbDatabase = "jdbc:mysql://db.broken-glasses.com/dbradiata03";
			  final String dbUser = "radiata03";
			  final String dbPassword ="20160815!@";
			  Class.forName(driverName);
			  conn = DriverManager.getConnection(dbDatabase,dbUser,dbPassword);

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Users> search(String teamName){
		String SQL = "SELECT * FROM teams WHERE teamName LIKE ?";
		ArrayList<Teams> teamList = new ArrayList<Teams>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + teamName + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Teams team = new Teams();
				team.setTeamUid(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setRegionA(rs.getString(3));
				team.setRegionB(rs.getString(4));
				team.setTeamBirth(rs.getString(5));
				team.setCaptainUid(rs.getString(6));
				teamList.add(team);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return teamList;
	}

}
