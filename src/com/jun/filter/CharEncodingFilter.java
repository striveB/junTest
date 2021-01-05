package com.jun.filter;

import javax.servlet.*;
import java.io.IOException;

public class CharEncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("过滤器");
        servletRequest.setCharacterEncoding("UTF-8");
        filterChain.doFilter(servletRequest,servletResponse);
        servletResponse.setCharacterEncoding("UTF-8");
    }

    @Override
    public void destroy() {
        System.out.println("销毁");
    }
}
