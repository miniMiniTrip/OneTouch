package com.onetouch.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.common.MyConstant;
import com.onetouch.dao.ReplyDao;
import com.onetouch.util.PostReplyPaging;
import com.onetouch.vo.ReplyPageVo;
import com.onetouch.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDao replyDao;

	@Override
	public Map<String, Object> selectReplyList(Map<String, Object> map) {
		map.put("page", ((Integer)map.get("nowReplyPage")-1)*MyConstant.Reply.BLOCK_LIST );
		map.put("block_list", MyConstant.Reply.BLOCK_LIST);
		List<ReplyPageVo> postReplyIdxPageList= replyDao.selectReplyIdxPageList(map);
		System.out.printf("			reply_idx_List =>%s\n",postReplyIdxPageList);
		map.put("postReplyIdxPageList", postReplyIdxPageList);
		int postIdxReplyTotalCount=replyDao.selectPostIdxReplyTotalCount(map);
		System.out.printf("post_idx(댓글갯수) => %d(%d)\n",map.get("post_idx"),postIdxReplyTotalCount);
		map.put("postIdxReplyTotalCount", postIdxReplyTotalCount);
		String ReplyPagingation=PostReplyPaging.getPaging((String)map.get("post_category"), null, (Integer)map.get("nowReplyPage"), postIdxReplyTotalCount, MyConstant.Reply.BLOCK_LIST, MyConstant.Reply.BLOCK_PAGE,map);
		map.put("ReplyPagingation", ReplyPagingation);

		List<ReplyVo> replyList=replyDao.selectReplyList(map);
		System.out.printf("			replyList => %s\n",replyList);
		map.put("replyList", replyList);
		
		return map;
	}
	
}
