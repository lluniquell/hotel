package kr.co.hotel.vo;

public class QnaVO {
	private String content;
	private int state, id;
	public String getContent() {
		return content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
