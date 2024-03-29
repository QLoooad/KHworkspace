package edu.kh.jdbc.member.model.dao;

import static edu.kh.jdbc.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.kh.jdbc.common.Session;
import edu.kh.jdbc.member.model.dto.Member;

public class MemberDAO {

	// JDBC 객체 참조 변수
	private Statement stmt; // SQL 수행, 결과 반환
	private PreparedStatement pstmt; // placeholder를 포함한 SQL 세팅/수행
	private ResultSet rs; // SELECT 수행 결과 저장

	private Properties prop;
	// Map<String, String> 형태
	// XML 파일 입/출력 메서드 제공

	public MemberDAO() {// 기존 생성자로 객체 생성 시 XML 읽어오기
		try {
			prop = new Properties();
			prop.loadFromXML(new FileInputStream("member-sql.xml"));
			// Properties 객체에
			// key:value 형식으로 xml 내용이 저장됨
			// prop.getProperty("key") 호출
			// value (SQL) 반환

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Member> selectMemberList(Connection conn) throws SQLException {
		// 1. 결과 저장용 변수/객체 선언
		List<Member> memberList = new ArrayList<>();

		try {
			// 2. SQL 작성 후 수행
			String sql = prop.getProperty("selectMemberList");

			// prepareStatement 객체 생성 후 SQL 삽입
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			// 3. 조회 결과를 1행씩 접근해서 얻어오기
			while (rs.next()) {

				String memberId = rs.getString(1);
				String memberName = rs.getString(2);
				String memberGender = rs.getString(3);

				Member member = new Member(memberId, memberName, memberGender);

//				Member member = new Member();
//				member.setMemberId(memberId);
//				member.setMemberName(memberName);
//				member.setMemberGender(memberGender);

				memberList.add(member);

			}

		} finally {// 사용한 JDBC 객체 자원 반환
			close(rs);
			close(pstmt);

		}

		return memberList;
	}

	public int updateMember(Connection conn, String memberName, String memberGender, int memberNo) throws Exception {

		int result = 0;

		try {
			// 2. PreaparedStatement 생성
			// 2.1 SQL 작성
			String sql = prop.getProperty("updateMember");
			// 2.2 PreaparedStatement 생성 후 placeholder에 값 세팅
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberName);
			pstmt.setString(2, memberGender);
			pstmt.setInt(3, memberNo);

			result = pstmt.executeUpdate();

		} finally {

			close(pstmt);
		}

		// 5.결과반환
		return result;
	}

	public int updatePw(Connection conn, String nowPw, String newPw, int memberNo) throws SQLException {
		int result = 0;

		try {
			// 2. PreaparedStatement 생성
			// 2.1 SQL 작성
			
			String sql = prop.getProperty("updatePw");
			// 2.2 PreaparedStatement 생성 후 placeholder에 값 세팅
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPw);
			pstmt.setString(2, nowPw);
			pstmt.setInt(3, memberNo);

			result = pstmt.executeUpdate();

		} finally {

			close(pstmt);
		}

		// 5.결과반환
		return result;
	}

	public int unRegisterMember(Connection conn, String nowPw, int memberNo) throws Exception  {
		int result = 0;
		
		try {
			String sql = prop.getProperty("unRegisterMember");
			// 2.2 PreaparedStatement 생성 후 placeholder에 값 세팅
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, nowPw);
			result = pstmt.executeUpdate();
			//매개변수에 SQL 작성x
			
		} finally {
			
			// 4. JDBC 객체 자원 반환
			close(pstmt);
		}
		
		// 5.결과반환
		return result;
	}
}
