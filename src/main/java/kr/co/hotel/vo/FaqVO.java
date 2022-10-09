package kr.co.hotel.vo;

public class FaqVO {
	
	private int id, gubun;
	private String userid, question, answer, writeday;
	
	public int getId() {
		return id;
	}
	public int getGubun() {
		return gubun;
	}
	public String getUserid() {
		return userid;
	}
	public String getQuestion() {
		return question;
	}
	public String getAnswer() {
		return answer;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setGubun(int gubun) {
		this.gubun = gubun;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
}
