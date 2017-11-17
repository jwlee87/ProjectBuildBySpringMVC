package kr.co.kingofday.service;

import java.util.List;

import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.Search;
import kr.co.kingofday.domain.Video;

public interface VideoService {
	public List<Video> getVideo() throws Exception;
	public List<Video> getFreeVideo(int countryCode) throws Exception;
	public Video getTotalCountNotPaidVideo(Member member) throws Exception;
	public List<Video> getVideoListNotPaid(Search search) throws Exception;
	public Video getTotalCountPaidVideo(Member member) throws Exception;
	public List<Video> getVideoListPaid(Search search) throws Exception;
	public Video getVideoDetail(int no) throws Exception;
	public void insertMemberVideo(Video memberVideo) throws Exception;
}
