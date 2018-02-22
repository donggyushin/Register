package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	
	public UserDAO() {
		
		System.out.println("UserDAO ������ ȣ��");
		
		try {
			String dbURL ="jdbc:mysql://localhost:3306/register2";
			String dbID ="root";
			String dbPassword = "nlcfjb";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int registerCheck(String userID) {
		String SQL = "select * from user where userID = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() || userID.equals("")) {
				System.out.println("�̹� ���̵� ����");
				return 0;	//�̹� ���̵� ����
			}
			else {
				System.out.println("���̵��������");
				return 1;	//���̵� ���� ����
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("�����ͺ��̽� ����");
		
		return -1;
	}
	
	public int register(String userID, String userPassword, String userName, String userAge, String userGender, String userEmail) {
		String SQL = "insert into user values(?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setInt(4, Integer.parseInt(userAge));
			pstmt.setString(5, userGender);
			pstmt.setString(6, userEmail);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1;
	}
	
	
}
