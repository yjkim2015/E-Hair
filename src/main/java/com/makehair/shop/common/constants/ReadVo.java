package com.makehair.shop.common.constants;

public class ReadVo {

    private int adminNo;
    private String searchValue;
    private String readType;
    private String searchType;
    private int pageNum;

    public int getAdminNo() {
        return adminNo;
    }

    public void setAdminNo(int adminNo) {
        this.adminNo = adminNo;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public String getReadType() {
        return readType;
    }

    public void setReadType(String readType) {
        this.readType = readType;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    @Override
    public String toString() {
        return "ReadVo{" +
                "adminNo=" + adminNo +
                ", searchValue='" + searchValue + '\'' +
                ", readType='" + readType + '\'' +
                ", searchType='" + searchType + '\'' +
                ", pageNum=" + pageNum +
                '}';
    }
}
