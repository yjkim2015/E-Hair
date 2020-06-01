package com.makehair.shop.admin;

import com.makehair.shop.commom.util.DateFormatUtil;
import com.makehair.shop.common.constants.*;
import com.makehair.shop.page.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    @Autowired
    private PageService pageService;

    // 매출 등록
    public Boolean insertSales(SalesVo salesVo) {
        return adminDao.insertSales(salesVo) == 1;
    }

    // 메모 등록
    public boolean insertMemo(UserDetail userDetail) {
        return adminDao.insertMemo(userDetail) == 1;
    }

    // 메모 목록
    public Map<String, Object> getMemoList(ReadVo readVo) {
        PageVo pageVo = pageService.getPaging(
                readVo.getReadType(),
                readVo.getSearchType(),
                String.valueOf(readVo.getUserNo()),
                readVo.getPageNum(),
                readVo.getAdminNo()
        );

        Map<String, Object> map = new HashMap<>();

        // 조회 시 필요한 페이징 파라미터
        map.put("adminNo", readVo.getAdminNo());
        map.put("startRow", pageVo.getStartRow() - 1);
        map.put("pageSize", pageVo.getPageSize());
        map.put("searchValue", readVo.getUserNo());

        if (readVo.getReadType().equals("memo")) {
            List<UserDetail> dataList = adminDao.getMemoList(map);
            System.out.println(dataList.size());
            map.put("dataList", dataList);
        }

        // 필수 반환 파라미터
        map.put("pageVo", pageVo);
        map.put("readType", readVo.getReadType());
        map.put("searchType", readVo.getSearchType());
        map.put("pageNum", readVo.getPageNum());

        return map;
    }

    public int deleteMemo(Integer detailNo) {
        return adminDao.deleteMemo(detailNo);
    }
}
