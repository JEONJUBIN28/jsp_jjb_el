package edu.ict.prj.dao;

import java.sql.Connection;



import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import edu.ict.prj.vo.EmpDeptDto;





public class EmpDeptDao {
	
	private DataSource dataSource = null;
	
	public EmpDeptDao() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<EmpDeptDto> empDeptSelect() {

		ArrayList<EmpDeptDto> dtos = new ArrayList<>();

		Connection connetion = null;
		Statement statement = null;
		ResultSet rs = null;

		String sql = "select e.empno empno, e.ename ename,d.dname dname, d.loc from emp e, dept d where e.deptno=d.deptno";

		try {
			connetion = dataSource.getConnection();
			
			statement = connetion.createStatement();
			rs = statement.executeQuery(sql);

			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String ename = rs.getString("ename");
				String loc = rs.getString("loc");

				EmpDeptDto dto = new EmpDeptDto(deptno, ename, dname, loc);

				dtos.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();

				if (statement != null)
					statement.close();

				if (connetion != null)
					connetion.close();
			} catch (Exception e) {
			}

		}

		return dtos;
	}

}
