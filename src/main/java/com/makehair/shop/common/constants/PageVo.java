package com.makehair.shop.common.constants;

public class PageVo {

    //현재 페이지 번호
    private int currentPage;
    //시작 페이지 번호
    private int startPage;
    //화면에 표시할 페이지 갯수
    private int pageBlock;
    //페이지 수
    private int pageCount;
    //끝 페이지 번호
    private int endPage;
    //게시물 수
    private int count;
    //현재 페이지의 첫 게시물 위치
    private int startRow;
    //한 페이지에 표시할 게시물 수
    private int pageSize;

    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getPageBlock() {
        return pageBlock;
    }
    public void setPageBlock(int pageBlock) {
        this.pageBlock = pageBlock;
    }
    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public int getStartRow() {
        return startRow;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "PageVO [currentPage=" + currentPage + ", startPage=" + startPage + ", pageBlock=" + pageBlock
                + ", pageCount=" + pageCount + ", endPage=" + endPage + ", count=" + count + ", startRow=" + startRow
                + ", pageSize=" + pageSize + "]";
    }
}
