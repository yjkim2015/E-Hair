package com.makehair.shop.interceptor;

import com.makehair.shop.common.constants.Auth;
import com.makehair.shop.common.constants.CommonUserVo;
import com.makehair.shop.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        // 1. handler 종류 확인
        // 우리가 관심 있는 것은 Controller에 있는 메서드이므로 HandlerMethod 타입인지 체크
        if( handler instanceof HandlerMethod == false ) {
            // return true이면  Controller에 있는 메서드가 아니므로, 그대로 컨트롤러로 진행
            return true;
        }

        // 2.형 변환
        HandlerMethod handlerMethod = (HandlerMethod)handler;

        // 3. @Auth 받아오기
        Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

        // 4. method에 @Auth가 없는 경우, 즉 인증이 필요 없는 요청
        if( auth == null ) {
            return true;
        }

        // 5. @Auth가 있는 경우이므로, 세션이 있는지 체크
        HttpSession session = request.getSession();
        if( session == null ) {
            // 로그인 화면으로 이동
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        // 6. 세션이 존재하면 유효한 유저인지 확인
        CommonUserVo loginUser = (CommonUserVo) session.getAttribute("loginUser");
        System.out.println("로긴유저");
        System.out.println(loginUser);
        if ( loginUser == null ) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        // 7. admin일 경우
        String role = auth.role().toString();
        System.out.println("role");
        System.out.println(role);
        if( "ADMIN".equals(role) ) {

            Boolean isAdmin = userService.checkAdmin(loginUser.getAdminNo(), loginUser.getUserId());

            if(!isAdmin){   // admin이 아니므로 return false
                response.sendRedirect(request.getContextPath());
                return false;
            }
        }

        // 8. 접근허가, 즉 메서드를 실행하도록 함
        return true;
    }
}
