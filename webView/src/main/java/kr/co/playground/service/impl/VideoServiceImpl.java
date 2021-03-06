package kr.co.playground.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.playground.dao.VideoDao;
import kr.co.playground.domain.Member;
import kr.co.playground.domain.Search;
import kr.co.playground.domain.Video;
import kr.co.playground.service.VideoService;

@Service("videoServiceImpl")
public class VideoServiceImpl implements VideoService {

	///Field
	@Autowired
	@Qualifier("videoDaoImpl")
	private VideoDao videoDao;
	public void setVideoDao(VideoDao videoDao) {
		this.videoDao=videoDao;
	}
	
	///Constructor
	public VideoServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public List<Video> getVideo() throws Exception {
		return videoDao.getVideo();
	}

	@Override
	public List<Video> getFreeVideo(int countryCode) throws Exception {
		return videoDao.getFreeVideo(countryCode);
	}
	@Override
	public Video getTotalCountNotPaidVideo(Member member) throws Exception {
		return videoDao.getTotalCountNotPaidVideo(member);
	}

	@Override
	public List<Video> getVideoListNotPaid(Search search) throws Exception {
		return videoDao.getVideoListNotPaid(search);
	}

	@Override
	public Video getTotalCountPaidVideo(Member member) throws Exception {
		return videoDao.getTotalCountPaidVideo(member);
	}

	@Override
	public List<Video> getVideoListPaid(Search search) throws Exception {
		return videoDao.getVideoListPaid(search);
	}

	@Override
	public Video getVideoDetail(int no) throws Exception {
		return videoDao.getVideoDetail(no);
	}

	@Override
	public void insertMemberVideo(Video memberVideo) throws Exception {
		videoDao.insetMemberVideo(memberVideo);
	}

}
