package com.minihome.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.minihome.album.model.vo.Album;
import com.minihome.diary.model.vo.Diary;
import com.minihome.model.vo.LatestDiaryInfo;
import com.minihome.model.vo.Minihome;
import com.minihome.model.vo.ProfileImg;
import com.shop.model.vo.Skin;

public class MinihomeDao {

	private Properties prop=new Properties();
	
	public MinihomeDao() {
		String path=MinihomeDao.class.getResource("/sql/minihome_sql.properties").getPath();
		File f=new File(path);
		try{
			prop.load(new FileReader(f));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Minihome getMinihome(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Minihome minihome=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMinihome"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				minihome=new Minihome();
				minihome.setMemberId(rs.getString("member_id"));
				minihome.setToday(rs.getInt("today"));
				minihome.setTotal(rs.getInt("total"));
				minihome.setSkinItemNo(rs.getInt("skin_item_no"));
				minihome.setTodayDate(rs.getDate("today_date"));
				minihome.setProfileImgNo(rs.getInt("profile_img_no"));
				minihome.setProfileContent(rs.getString("profile_content"));
				minihome.setFeeling(rs.getString("feeling"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return minihome;
	}
	
	public int addToday(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		int todayResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("addToday"));
			pstmt.setString(1,hostMemberId);
			todayResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return todayResult;
	}
	
	public int todayToTotal(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		int todayToTotalResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("todayToTotal"));
			pstmt.setString(1,hostMemberId);
			todayToTotalResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return todayToTotalResult;
	}
	
	public ProfileImg getMyProfileImg(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProfileImg profileImg=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMyProfileImg"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				profileImg=new ProfileImg();
				profileImg.setMemberId(rs.getString("member_id"));
				profileImg.setFilepath(rs.getString("filepath"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return profileImg;
	}
	
	public int updateProfileContent(Connection conn,String hostMemberId,String profileContent) {
		PreparedStatement pstmt=null;
		int updateProfileContentResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateProfileContent"));
			pstmt.setString(1,profileContent);
			pstmt.setString(2,hostMemberId);
			updateProfileContentResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateProfileContentResult;
	}
	
	public int changeFeeling(Connection conn,String hostMemberId,String changeFeeling) {
		PreparedStatement pstmt=null;
		int changeFeelingResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("changeFeeling"));
			pstmt.setString(1,changeFeeling);
			pstmt.setString(2,hostMemberId);
			changeFeelingResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return changeFeelingResult;
	}
	
	public List<Album> getLatestAlbum(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Album> latestAlbumList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getLatestAlbum"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Album l=new Album();
				l.setImgNo(rs.getInt("img_no"));
				l.setMemberId(rs.getString("member_id"));
				l.setTitle(rs.getString("title"));
				l.setFilepath(rs.getString("filepath"));
				l.setFolder(rs.getString("folder"));
				l.setPostDate(rs.getDate("post_date"));
				l.setHashTag(rs.getString("post_date"));
				l.setContent(rs.getString("content"));
				latestAlbumList.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return latestAlbumList;
	}
	
	public List<LatestDiaryInfo> getLatestDiary(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<LatestDiaryInfo> latestDiaryList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getLatestDiary"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LatestDiaryInfo ld=new LatestDiaryInfo();
				ld.setWriter(rs.getString("writer"));
				ld.setNickname(rs.getString("nickname"));
				ld.setFolderName(rs.getString("folder_name"));
				ld.setPostDate(rs.getDate("post_date"));
				latestDiaryList.add(ld);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return latestDiaryList;
	}
	
	public Skin getMySkin(Connection conn,int itemNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Skin skin=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMySkin"));
			pstmt.setInt(1,itemNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				skin=new Skin();
				skin.setItemNo(rs.getInt("item_no"));
				skin.setSkinTitle(rs.getString("skin_title"));
				skin.setPrice(rs.getInt("price"));
				skin.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				skin.setCssFilepath(rs.getString("css_filepath"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return skin;
	}
	
	public List<Skin> getMySkins(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Skin> skinList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getMySkins"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Skin skin=new Skin();
				skin.setItemNo(rs.getInt("item_no"));
				skin.setSkinTitle(rs.getString("skin_title"));
				skin.setPrice(rs.getInt("price"));
				skin.setPreviewImgFilepath(rs.getString("preview_img_filepath"));
				skin.setCssFilepath(rs.getString("css_filepath"));
				skinList.add(skin);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return skinList;
	}
	
	public int changeSkin(Connection conn,String hostMemberId,int changeSkinItemNo) {
		PreparedStatement pstmt=null;
		int changeSkinResult=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("changeSkin"));
			pstmt.setInt(1,changeSkinItemNo);
			pstmt.setString(2,hostMemberId);
			changeSkinResult=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return changeSkinResult;
	}
	
	public int updateColorStr(Connection conn,String hostMemberId,String[] colorArr) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateColorStr"));
			for(int i=0;i<colorArr.length;i++) {
				pstmt.setString(i+1,colorArr[i]);
			}
			pstmt.setString(15,hostMemberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public String getColorStr(Connection conn,String hostMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String colorStr="";
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getColorStr"));
			pstmt.setString(1,hostMemberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				for(int i=0;i<14;i++) {
					if(i!=13) colorStr+=rs.getString("color_str_"+(i+1))+"&";
					else colorStr+=rs.getString("color_str_"+(i+1));
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);close(pstmt);
		}
		return colorStr;
	}
	
}
