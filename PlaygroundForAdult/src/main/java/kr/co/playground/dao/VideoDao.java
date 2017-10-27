package kr.co.playground.dao;

import java.util.List;

import kr.co.playground.domain.Video;

public interface VideoDao {
	public List<Video> getVideo() throws Exception;

	public List<Video> getFreeVideoJver() throws Exception;
	
	public List<Video> getFreeVideoKver() throws Exception;
	
}
