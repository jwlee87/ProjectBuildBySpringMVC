package kr.co.playground.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.playground.dao.VideoDao;
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
	public List<Video> getFreeVideoJver() throws Exception {
		return videoDao.getFreeVideoJver();
	}

	@Override
	public List<Video> getFreeVideoKver() throws Exception {
		return videoDao.getFreeVideoKver();
	}

}
