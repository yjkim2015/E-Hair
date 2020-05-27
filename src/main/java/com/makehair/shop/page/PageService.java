package com.makehair.shop.page;

import com.makehair.shop.admin_read.AdminReadDao;
import com.makehair.shop.commom.util.DateFormatUtil;
import com.makehair.shop.common.constants.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class PageService {

    //한 페이지에 표시할 게시물 수
    private final int PAGE_SIZE = 3;

    @Autowired
    private AdminReadDao adminReadDao;

    // 현재 조회하고자 하는 게시물 리스트에 대한 페이징 변수 생성 by 조회 유형, 검색어, 페이지 번호, 관리자 번호
    public PageVo getPaging(String readType, String searchType, String searchValue, int pageNum, int adminNo) {

        PageVo pageVo = new PageVo();
        int count = 0;
        Map<String, Object> map = new HashMap<>();

        if(readType.equals("salesDay")) {
            map = DateFormatUtil.getStartEndTime(readType, searchValue);
            map.put("adminNo", adminNo);
            count = adminReadDao.getSalesDayCount(map);
        } else if(readType.equals("salesMonth")) {
            map = DateFormatUtil.getStartEndTime(readType, searchValue);
            map.put("adminNo", adminNo);
            count = adminReadDao.getSalesDayCount(map);
        } else if(readType.equals("user")) {
            map.put("searchValue", searchValue);
            count = adminReadDao.getUserCount(map);
        } else {
            map.put("searchValue", searchValue);
            count = adminReadDao.getReviewCount(map);
        }

        int currentPage = pageNum;

        //한 페이지에 10개의 게시물 표시
        int pageBlock = 5;

        //한 페이지의 시작행, 끝행
        int startRow = (currentPage-1) * PAGE_SIZE + 1;

        int pageCount = count / PAGE_SIZE + (count % PAGE_SIZE == 0 ? 0 : 1);
        int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;

        if(endPage > pageCount) {
            endPage = pageCount;
        }

        pageVo.setCount(count);
        pageVo.setStartRow(startRow);
        pageVo.setPageCount(pageCount);
        pageVo.setStartPage(startPage);
        pageVo.setEndPage(endPage);
        pageVo.setCurrentPage(currentPage);
        pageVo.setPageBlock(pageBlock);
        pageVo.setPageSize(PAGE_SIZE);

        return pageVo;
    }
}