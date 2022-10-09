package kr.co.hotel.vo;

public class HugiVO {
	private int id, star, readnum, cnt;
	private String title, userid, name, content, fname, writeday, img;
	
	private int bid, grade;  // bid=예약 아이디
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getCnt() {
		return cnt;
	}
	public String getImg() {
		return img;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getId() {
		return id;
	}
	public int getStar() {
		return star;
	}
	public int getReadnum() {
		return readnum;
	}
	public String getTitle() {
		return title;
	}
	public String getUserid() {
		return userid;
	}
	public String getName() {
		return name;
	}
	public String getContent() {
		return content;
	}
	public String getFname() {
		return fname;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
