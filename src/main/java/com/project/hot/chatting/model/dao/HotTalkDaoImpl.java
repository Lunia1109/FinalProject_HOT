package com.project.hot.chatting.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.hot.chatting.model.dto.CommonMessageDTO;
import com.project.hot.chatting.model.dto.HotTalkAtt;
import com.project.hot.chatting.model.dto.HotTalkContent;
import com.project.hot.chatting.model.dto.HotTalkMember;
import com.project.hot.chatting.model.dto.HotTalkStatus;
import com.project.hot.chatting.model.dto.ResponseHotTalkContentDTO;
import com.project.hot.chatting.model.dto.ResponseHotTalkListDTO;
import com.project.hot.chatting.model.dto.ResponseLoginEmployeeDTO;
@Repository
public class HotTalkDaoImpl implements HotTalkDao {

	@Override
	public List<ResponseLoginEmployeeDTO> getHotTalkMemberList(SqlSession session, int empNo) {
		return session.selectList("hottalk.getHotTalkMemberList", empNo);
	}

	@Override
	public List<ResponseHotTalkListDTO> getPrivateHotTalkList(SqlSession session, int employeeNo) {
		return session.selectList("hottalk.getPrivateHotTalkList", employeeNo);

	}

	@Override
	public List<ResponseHotTalkListDTO> getGroupHotTalkList(SqlSession session, int employeeNo) {

		return session.selectList("hottalk.getGroupHotTalkList", employeeNo);
	}

	@Override
	public List<ResponseHotTalkContentDTO> getHotTalkContents(SqlSession session, int openEmployeeNo,
			int openHotTalkNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("openEmployeeNo", openEmployeeNo);
		param.put("openHotTalkNo", openHotTalkNo);
		return session.selectList("hottalk.getHotTalkContents", param);
	}

	@Override
	public int updateHotTalkStatus(SqlSession session, int employeeNo, String status) {
		HotTalkStatus newStatus = new HotTalkStatus();
		newStatus.setEmployeeNo(employeeNo);
		newStatus.setHotTalkStatus(status);
		return session.update("hottalk.updateHotTalkStatus", newStatus);
	}

	@Override
	public int updateHotTalkStatusMessage(SqlSession session, int employeeNo, String statusMsg) {
		HotTalkStatus newStatus = new HotTalkStatus();
		newStatus.setEmployeeNo(employeeNo);
		newStatus.setHotTalkStatusMessage(statusMsg);
		return session.update("hottalk.updateHotTalkStatusMessage", newStatus);
	}

	@Override
	public int insertMessageSender(SqlSession session, CommonMessageDTO msg) {
		return session.insert("hottalk.insertMessageSender", msg);
	}

	@Override
	public int insertMessageReceiver(SqlSession session, CommonMessageDTO msg) {
		return session.insert("hottalk.insertMessageReceiver",msg);
	}

	@Override
	public int insertHotTalkAtt(SqlSession session, HotTalkAtt hotTalkAtt) {
		return session.insert("hottalk.insertHotTalkAtt", hotTalkAtt);
	}

	@Override
	public int getHotTalkNo(SqlSession session, Map<String, Integer> param) {
		int result=0;
		if(session.selectOne("hottalk.getHotTalkNo", param)!=null) result = session.selectOne("hottalk.getHotTalkNo", param);
		return result>0?result:0;
	}

	@Override
	public HotTalkMember selectMember(SqlSession session, int employeeNo) {
		return session.selectOne("hottalk.selectMember", employeeNo);
	}

	@Override
	public int insertNewChatRoom(SqlSession session, CommonMessageDTO msg) {
		return session.insert("hottalk.insertNewChatRoom", msg);
	}

	@Override
	public int insertNewChatRoomMember(SqlSession session, CommonMessageDTO msg) {
		return session.insert("hottalk.insertNewChatRoomMember", msg);
	}

	@Override
	public int insertNewChatRoomContents(SqlSession session, CommonMessageDTO msg) {
		return session.insert("hottalk.insertNewChatRoomContents", msg);
	}

	@Override
	public int insertNewChatRoomReceiver(SqlSession session, CommonMessageDTO msg) {
		return session.insert("hottalk.insertNewChatRoomReceiver", msg);
	}

	@Override
	public int getGroupTalkNo(SqlSession session, CommonMessageDTO msg) {
		return session.selectOne("hottalk.getGroupTalkNo", msg);
	}

	@Override
	public List<HotTalkContent> selectMyMessage(SqlSession session, int employeeNo) {
		return session.selectList("hottalk.selectMyMessage", employeeNo);
	}

	@Override
	public int updateIsReadByNo(SqlSession session, Map<String, Integer> param) {
		return session.update("hottalk.updateIsReadByNo", param);
	}

	public List<Integer> getReceivers(SqlSession session, int hotTalkNo){
		return session.selectList("hottalk.getReceivers", hotTalkNo);
	}

	@Override
	public int insertHotTalkStatus(SqlSession session, int employeeNo, String status) {
		Map<String, Object> param = new HashMap<>();
		param.put("employeeNo", employeeNo);
		param.put("status", status);
		return session.insert("hottalk.insertHotTalkStatus", param);
	}

	@Override
	public int insertHotTalkStatusMessage(SqlSession session, int employeeNo, String statusMsg) {
		Map<String, Object> param = new HashMap<>();
		param.put("employeeNo", employeeNo);
		param.put("statusMsg", statusMsg);
		return session.insert("hottalk.insertHotTalkStatusMessage", param);
	}


}
