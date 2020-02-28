package com.entity;

public class Order {
    private Integer id;
    private Integer userid;
    private Integer shoppingid;
    private Integer state;
    private Shop shop;
    private Img img;
    private PingJia pingJia;

    public PingJia getPingJia() {
        return pingJia;
    }

    public void setPingJia(PingJia pingJia) {
        this.pingJia = pingJia;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Img getImg() {
        return img;
    }

    public void setImg(Img img) {
        this.img = img;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getShoppingid() {
        return shoppingid;
    }

    public void setShoppingid(Integer shoppingid) {
        this.shoppingid = shoppingid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
