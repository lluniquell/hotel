package kr.co.hotel.vo;

public class AnswerVO {
	
	private int id, qid;
	private String userid, content, writeday;
	
	public int getId() {
		return id;
	}
	public int getQid() {
		return qid;
	}
	public String getUserid() {
		return userid;
	}
	public String getContent() {
		return content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
