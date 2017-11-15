package kr.co.playground.dao;

import java.util.List;

import kr.co.playground.domain.Member;
import kr.co.playground.domain.Search;
import kr.co.playground.domain.Video;

public interface VideoDao {
	public List<Video> getVideo() throws Exception;
	public List<Video> getFreeVideo(int countryCode) throws Exception;
	public Video getTotalCountNotPaidVideo(Member member) throws Exception;
	public List<Video> getVideoListNotPaid(Search search) throws Exception;
	public Video getTotalCountPaidVideo(Member member) throws Exception;
	public List<Video> getVideoListPaid(Search search) throws Exception;
	public Video getVideoDetail(int no) throws Exception;
	public void insetMemberVideo(Video memberVideo) throws Exception;
	
}
