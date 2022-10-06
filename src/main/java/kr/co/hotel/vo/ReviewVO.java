package kr.co.hotel.vo;

public class ReviewVO {
	private int id, star, gid, bea_ev, de_ev, du_ev, b1,b2,b3,d1,d2,d3,du1,du2,du3,s1,s2,s3,s4,s5,cnt;
	private double avg;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}

	private String[] fimgs;
	
	public String[] getFimgs() {
		return fimgs;
	}
	public void setFimgs(String[] fimgs) {
		this.fimgs = fimgs;
	}
	public int getB1() {
		return b1;
	}
	public void setB1(int b1) {
		this.b1 = b1;
	}
	public int getB2() {
		return b2;
	}
	public void setB2(int b2) {
		this.b2 = b2;
	}
	public int getB3() {
		return b3;
	}
	public void setB3(int b3) {
		this.b3 = b3;
	}
	public int getD1() {
		return d1;
	}
	public void setD1(int d1) {
		this.d1 = d1;
	}
	public int getD2() {
		return d2;
	}
	public void setD2(int d2) {
		this.d2 = d2;
	}
	public int getD3() {
		return d3;
	}
	public void setD3(int d3) {
		this.d3 = d3;
	}
	public int getDu1() {
		return du1;
	}
	public void setDu1(int du1) {
		this.du1 = du1;
	}
	public int getDu2() {
		return du2;
	}
	public void setDu2(int du2) {
		this.du2 = du2;
	}
	public int getDu3() {
		return du3;
	}
	public void setDu3(int du3) {
		this.du3 = du3;
	}
	public int getS1() {
		return s1;
	}
	public void setS1(int s1) {
		this.s1 = s1;
	}
	public int getS2() {
		return s2;
	}
	public void setS2(int s2) {
		this.s2 = s2;
	}
	public int getS3() {
		return s3;
	}
	public void setS3(int s3) {
		this.s3 = s3;
	}
	public int getS4() {
		return s4;
	}
	public void setS4(int s4) {
		this.s4 = s4;
	}
	public int getS5() {
		return s5;
	}
	public void setS5(int s5) {
		this.s5 = s5;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public int getBea_ev() {
		return bea_ev;
	}
	public void setBea_ev(int bea_ev) {
		this.bea_ev = bea_ev;
	}
	public int getDe_ev() {
		return de_ev;
	}
	public void setDe_ev(int de_ev) {
		this.de_ev = de_ev;
	}
	public int getDu_ev() {
		return du_ev;
	}
	public void setDu_ev(int du_ev) {
		this.du_ev = du_ev;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	private String title, content, goodscode, fname, userid, writeday, ordercode, pcode;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGoodscode() {
		return goodscode;
	}
	public void setGoodscode(String goodscode) {
		this.goodscode = goodscode;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
}
