package kr.co.playground.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.playground.dao.WardrobeDao;
import kr.co.playground.domain.Wardrobe;

@Repository("wardrobeDaoImpl")
public class WardrobeDaoImpl implements WardrobeDao {

  /// Field
  @Autowired
  @Qualifier("sqlSessionTemplate")
  private SqlSession sqlSession;

  public void setSqlSession(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
  }

  /// Constructor
  public WardrobeDaoImpl() {
    System.out.println(this.getClass());
  }

  /// Method
  public void addWardrobe(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: addWardrobe");
    sqlSession.insert("WardrobeMapper.addWardrobe", wardrobe);
  }

  public Wardrobe getWardrobe(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: getWardrobe");
    return sqlSession.selectOne("WardrobeMapper.getWardrobeByMemberNo", wardrobe);
  }
  
  public Wardrobe getWardrobe(int cls_no) throws Exception {
    System.out.println("[wardrobeDao] ::: getWardrobe");
    return sqlSession.selectOne("WardrobeMapper.getWardrobeByClsNo", cls_no);
  }

  public Map<String, Object> getWardrobeList(int member_no) throws Exception {

    System.out.println("[wardrobeDao] ::: getWardrobeList");
    Map<String , Object>  map = new HashMap<String, Object>();
    
    List<Wardrobe> list =  sqlSession.selectList("WardrobeMapper.getWardrobeList", member_no);
    List<Wardrobe> postList =  sqlSession.selectList("WardrobeMapper.getMyPostThumb", member_no);
    
    map.put("followerCount",sqlSession.selectOne("WardrobeMapper.getFollowerCount", member_no));
    map.put("followingCount",sqlSession.selectOne("WardrobeMapper.getFollowingCount", member_no));
    map.put("postCount",sqlSession.selectOne("WardrobeMapper.getMyPostCount", member_no));
    map.put("list", list);
    map.put("postList", postList);
    
    return map; 
  }

  public void updateWardrobe(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: updateWardrobe");
    sqlSession.update("WardrobeMapper.updateWardrobe", wardrobe);
  }

  public void deleteWardrobe(int cls_no) throws Exception {
    System.out.println("[wardrobeDao] ::: deleteWardrobe");
    sqlSession.delete("WardrobeMapper.deleteWardrobe", cls_no);
  }
  
  
  
  public void addFollow(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: addFollow");
    sqlSession.insert("WardrobeMapper.addFollow", wardrobe);
  }

  public void deleteFollow(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: deleteFollow");
    sqlSession.delete("WardrobeMapper.deleteFollow", wardrobe);
  }

  public int getFollow(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: getFollow");
    return sqlSession.selectOne("WardrobeMapper.getFollow", wardrobe);
  }

  public List<Wardrobe> getFollowerList(int following) throws Exception {
    System.out.println("[wardrobeDao] ::: getFollowerList");
    return sqlSession.selectList("WardrobeMapper.getFollowerList", following);
  }

  public List<Wardrobe> getFollowingList(int follower) throws Exception {
    System.out.println("[wardrobeDao] ::: getFollowingList");
    return sqlSession.selectList("WardrobeMapper.getFollowingList", follower);
  }

}
