package com.minihome.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.minihome.model.dao.MinihomeDao;
import com.minihome.model.vo.Minihome;

public class MinihomeService {
	
	private MinihomeDao minihomeDao=new MinihomeDao();

	public Minihome getMinihome(String hostMemberId) {
		Connection conn=getConnection();
		Minihome minihome=minihomeDao.getMinihome(conn,hostMemberId);
		close(conn);
		return minihome;
	}
	
}
