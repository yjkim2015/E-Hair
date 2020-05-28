package com.makehair.shop.admin_read;

import com.makehair.shop.commom.util.DateFormatUtil;
import com.makehair.shop.common.constants.*;
import com.makehair.shop.page.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminReadService {

    @Autowired
    private AdminReadDao adminReadDao;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private PageService pageService;

    // 관리자 메인 -> 금일 매출
    public Map<String, Object> getSalesDayList(int adminNo) {
        String searchValue = DateFormatUtil.getNowTime();
        PageVo pageVo = pageService.getPaging("salesDay", "", searchValue, 1, adminNo);

        Map<String, Object> map = DateFormatUtil.getStartEndTime("salesDay", searchValue);

        map.put("adminNo", adminNo);
        map.put("startRow", pageVo.getStartRow() - 1);
        map.put("pageSize", pageVo.getPageSize());

        // 조회 데이터
        List<SalesVo> salesDayList = adminReadDao.getSalesDayList(map);
        map.put("salesDayList", salesDayList);

        // 필수 반환 파라미터
        map.put("pageVo", pageVo);
        map.put("readType", "salesDay");
        map.put("searchValue", searchValue);
        map.put("pageNum", 1);

        return map;
    }

    // 일별 매출, 월별 매출, 고객 관리, 후기 관리 데이터 조회
    public Map<String, Object> getDataList(ReadVo readVo) {
        PageVo pageVo = pageService.getPaging(
            readVo.getReadType(),
            readVo.getSearchType(),
            readVo.getSearchValue(),
            readVo.getPageNum(),
            readVo.getAdminNo()
        );

        Map<String, Object> map = new HashMap<>();

        // 조회 시 필요한 페이징 파라미터
        map.put("adminNo", readVo.getAdminNo());
        map.put("startRow", pageVo.getStartRow() - 1);
        map.put("pageSize", pageVo.getPageSize());
        map.put("searchValue", readVo.getSearchValue());

        if(readVo.getReadType().equals("salesDay") || readVo.getReadType().equals("salesMonth")) {
            Map<String, Object> timeMap = DateFormatUtil.getStartEndTime(readVo.getReadType(), readVo.getSearchValue());
            map.put("startTime", timeMap.get("startTime"));
            map.put("endTime", timeMap.get("endTime"));

            List<SalesVo> dataList = adminReadDao.getSalesDayList(map);
            map.put("dataList", dataList);
        } else if(readVo.getReadType().equals("user")) {
            List<CommonUserVo> dataList = adminReadDao.getUserList(map);
            map.put("dataList", dataList);
        } else {
            map.put("searchValue", readVo.getAdminNo());
            List<ReviewVo> dataList = adminReadDao.getReviewList(map);
            map.put("dataList", dataList);
        }

        // 필수 반환 파라미터
        map.put("pageVo", pageVo);
        map.put("readType", readVo.getReadType());
        map.put("searchType", readVo.getSearchType());
        map.put("pageNum", readVo.getPageNum());

        return map;
    }
}
