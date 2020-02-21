package com.entity;

public class Shop {
    private Integer shopId;
    private String shopName;
    private Double price;
    private Integer typeId;
    private Integer imgId;
    private Sdetail sdetail;
    private Img img;
    private ShoppingTyp shoppingTyp;

    public ShoppingTyp getShoppingTyp() {
        return shoppingTyp;
    }

    public void setShoppingTyp(ShoppingTyp shoppingTyp) {
        this.shoppingTyp = shoppingTyp;
    }

    public Sdetail getSdetail() {
        return sdetail;
    }

    public void setSdetail(Sdetail sdetail) {
        this.sdetail = sdetail;
    }

    public Img getImg() {
        return img;
    }

    public void setImg(Img img) {
        this.img = img;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getImgId() {
        return imgId;
    }

    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }
}
