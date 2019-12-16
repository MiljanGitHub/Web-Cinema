package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

import model.Role;
import model.User;

public class UserDAO {
	
	public static SimpleDateFormat DATETIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public static User get(String username, String password) throws Exception{
		
		Connection conn = ConnectionManager.getConnection();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			String query = "SELECT * FROM User WHERE active = ? AND username = ? AND password = ?";

			pstmt = conn.prepareStatement(query);
			int index = 1;
	
			pstmt.setInt(index++, 1); 	//column 1; column id, doesn't count, primary key auto increment whatever...
			pstmt.setString(index++, username);	//column 2
			pstmt.setString(index++, password);// column 3
			//System.out.println(index);

			//System.out.println(pstmt);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				
				int id = rset.getInt(1);
				
			
				boolean active = (rset.getInt(2) == 0 ? false : true);
				
				//String s = rset.getString(5);
				//System.out.println(s);
				//System.exit(1);
				//Date date = rset.getDate(5);
				Timestamp timestamp = rset.getTimestamp(1);
				//Timestamp timestamp = new Timestamp(date.getTime());
				//Timestamp timestamp = rset.getTimestamp(5);
				LocalDateTime registartionDate = timestamp.toLocalDateTime();
		
	
				Role role = Role.valueOf(rset.getString(6));

				return new User(id, active, username, password, registartionDate, role);
			}
		} finally {
			try {pstmt.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {rset.close();} catch (Exception ex1) {ex1.printStackTrace();}
			try {conn.close();} catch (Exception ex1) {ex1.printStackTrace();} // ako se koristi DBCP2, konekcija se mora vratiti u pool
		
		}

		return null;
		
		
	}
	
//	private LocalDateTime convertToEntityAttribute(Date date) {
//        return Optional.ofNullable(date)
//          .map(Date::toLocalDateTime)
//          .orElse(null);
//    }

}
