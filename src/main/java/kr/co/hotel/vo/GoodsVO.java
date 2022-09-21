package kr.co.hotel.vo;

public class GoodsVO {
	private int id, price, qty, deliveryday, deliveryfee;
	private String title, timg, mimg, goodscode, writeday;
	
	// cartwish 테이블필드
	 private int cid,cqty;
	 
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getCqty() {
		return cqty;
	}
	public void setCqty(int cqty) {
		this.cqty = cqty;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDeliveryday() {
		return deliveryday;
	}
	public void setDeliveryday(int deliveryday) {
		this.deliveryday = deliveryday;
	}
	public int getDeliveryfee() {
		return deliveryfee;
	}
	public void setDeliveryfee(int deliveryfee) {
		this.deliveryfee = deliveryfee;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTimg() {
		return timg;
	}
	public void setTimg(String timg) {
		this.timg = timg;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getGoodscode() {
		return goodscode;
	}
	public void setGoodscode(String goodscode) {
		this.goodscode = goodscode;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
