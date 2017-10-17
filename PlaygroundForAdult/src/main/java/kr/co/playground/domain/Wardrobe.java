package kr.co.playground.domain;

public class Wardrobe {

	///Field
  private int cls_no;
  private int member_no;
  private String cls_name;
  
  private int follower;
  private int following;
  private Member follow;
  
  private Style hang;
  
  ///Constructor
  public Wardrobe(){
  }
  
  ///Method
	public int getCls_no() {
    return cls_no;
  }

  public void setCls_no(int cls_no) {
    this.cls_no = cls_no;
  }

  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }

  public String getCls_name() {
    return cls_name;
  }

  public void setCls_name(String cls_name) {
    this.cls_name = cls_name;
  }

  public int getFollower() {
    return follower;
  }

  public void setFollower(int follower) {
    this.follower = follower;
  }

  public int getFollowing() {
    return following;
  }

  public void setFollowing(int following) {
    this.following = following;
  }

  public Member getFollow() {
    return follow;
  }

  public void setFollow(Member follow) {
    this.follow = follow;
  }

  public Style getHang() {
    return hang;
  }

  public void setHang(Style hang) {
    this.hang = hang;
  }

  @Override
  public String toString() {
    return "Wardrobe [cls_no=" + cls_no + ", member_no=" + member_no + ", cls_name=" + cls_name + ", follower=" + follower
        + ", following=" + following + ", follow=" + follow + ", hang=" + hang + "]";
  }

}