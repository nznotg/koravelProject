/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.61
 * Generated at: 2022-01-03 02:17:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.festival;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class detailFestival_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1635998956472L));
    _jspx_dependants.put("jar:file:/Users/nz/DEV/koravelProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/koravelProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/fmt.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("jar:file:/Users/nz/DEV/koravelProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/koravelProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fchoose;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fotherwise;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fchoose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fotherwise = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fchoose.release();
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fotherwise.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"../resources/css/detail_bootstrap-grid.min.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"../resources/css/detail.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"../resources/css/detail_font-awesome.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"../resources/css/detail_slick.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"../resources/css/detail_lightgallery.css\">\t\n");
      out.write("\t<!-- JavaScript Libraries -->\n");
      out.write("    <script src=\"../resources/js/jquery.min.js\"></script>    \n");
      out.write("    <script src=\"../resources/js/detail_slick.min.js\"></script>\n");
      out.write("    <script src=\"../resources/js/detail_lightgallery.min.js\"></script>\n");
      out.write("    \n");
      out.write("    <!-- 좋아요 ajax -->\n");
      out.write("\t<script src=\"../resources/js/recoForRegion.js\"></script>\n");
      out.write("<title>지역행사 상세보기</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t<nav class=\"navbar\">\n");
      out.write("    <div class=\"navbar_logo\">          \n");
      out.write("      <a href=\"../index.jsp\">koravel</a>\n");
      out.write("    </div>\n");
      out.write("    <ul class=\"navbar_menu\">\n");
      out.write("      <li><a href=\"../region/recommand.do\">맞춤추천</a></li>\n");
      out.write("      <li><a href=\"../festival/festival.do\">지역행사</a></li>\n");
      out.write("      <li><a href=\"../board/getBoardMain.do\">커뮤니티</a></li>\n");
      out.write("      <li><a href=\"../main/tip.do\">팁</a></li>\n");
      out.write("      <li><a href=\"\">북마크</a></li>\n");
      out.write("    </ul>        \n");
      out.write("\t</nav>\n");
      out.write("\t<!-- 헤더 -->\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\t<section class=\"container\">\n");
      out.write("\t\t\t<div class=\"column row\">\n");
      out.write("\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t<div class=\"info1 col-md-6\">\t\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<div class=\"festival_info\" id=\"recoForReload\">\t\t\t\t\n");
      out.write("\t\t\t\t\t\t<span class=\"bookmark\">북마크\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id='searchRecoIdx' name=\"searchRecoIdx\" value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalIdx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id='readerID' name=\"readerID\" value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.readerID}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id='checkRecoTF' name=\"checkRecoTF\" value='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.checkRecoTF}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("'>\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fchoose_005f0(_jspx_page_context))
        return;
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</span>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\t\t\t\t\n");
      out.write("\t\t\t\t\t<h1 class=\"col_tit\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalTitle }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h1>\n");
      out.write("\t\t\t\t\t<h4 class=\"col_desc\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalDate }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\n");
      out.write("\t\t\t\t\t<h4>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalAddr }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\n");
      out.write("\t\t\t\t\t<h4>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalAddr2 }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\n");
      out.write("\t\t\t\t\t<h4>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalPay }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\n");
      out.write("\t\t\t\t\t<h4>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalTel }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\n");
      out.write("\t\t\t\t\t<h4>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalInfo }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\n");
      out.write("\t\t\t\t</div>\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t<div class=\"slider_info col-md-6\">\n");
      out.write("\t\t\t\t\t<!-- 이미지 슬라이드 -->\n");
      out.write("\t\t\t\t\t<div class=\"slider\">\n");
      out.write("\t\t\t\t\t\t<div>\n");
      out.write("\t\t\t\t\t\t\t<figure>\n");
      out.write("\t\t\t\t\t\t\t\t<img src=\"../resources/images/festival/");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalIdx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(".jpeg\" alt=\"이미지1\">\n");
      out.write("\t\t\t\t\t\t\t\t<figcaption><em>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalTitle }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</em><span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.festivalDate }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</span></figcaption>\n");
      out.write("\t\t\t\t\t\t\t</figure>\n");
      out.write("\t\t\t\t\t\t</div>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<!--//이미지 슬라이드 -->\n");
      out.write("\t\t\t\t</div>\t\t\t\t\t\n");
      out.write("\t\t\t\t\n");
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</section>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("\t<section class=\"container\">\n");
      out.write("        <article class=\"column col5\">\n");
      out.write("            <h3><em class=\"col_tit\">여행지</em></h3>\n");
      out.write("            <p class=\"col_desc\">가장 인기 있는 여행지 유형입니다.</p>\n");
      out.write("            <!-- 오버효과 -->\n");
      out.write("            <div class=\"notice_hover2\">\n");
      out.write("                <ul>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <span><img src=\"https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm01.jpg\" alt=\"이미지1\"><em>바로가기</em></span>\n");
      out.write("                            <strong>경복궁1</strong>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <span><img src=\"https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm02.jpg\" alt=\"이미지2\"><em>바로가기</em></span>\n");
      out.write("                            <strong>경복궁2</strong>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"last\">\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <span><img src=\"https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm03.jpg\" alt=\"이미지3\"><em>바로가기</em></span>\n");
      out.write("                            <strong>경복궁3</strong>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <!-- //오버효과 -->\n");
      out.write("            <!-- 오버효과2 -->\n");
      out.write("            <div class=\"notice_hover2 mt15\">\n");
      out.write("                <ul>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <span><img src=\"https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm04.jpg\" alt=\"이미지1\"><em>바로가기</em></span>\n");
      out.write("                            <strong>경복궁4</strong>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <span><img src=\"https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm05.jpg\" alt=\"이미지2\"><em>바로가기</em></span>\n");
      out.write("                            <strong>경복궁5</strong>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"last\">\n");
      out.write("                        <a href=\"#\">\n");
      out.write("                            <span><img src=\"https://www.royalpalace.go.kr/content/images/leedeokman/summer/sm06.jpg\" alt=\"이미지3\"><em>바로가기</em></span>\n");
      out.write("                            <strong>경복궁6</strong>\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <!-- //오버효과2 -->\n");
      out.write("        </article>\n");
      out.write("        <!-- //col4 -->\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("\n");
      out.write("\n");
      out.write("\t<section class=\"container\">\n");
      out.write("\t\t<article class=\"column col5\">\n");
      out.write("\t\t\t<h4 class=\"col_tit\">추천 코스</h4>\n");
      out.write("\t\t\t<p class=\"col_desc\">주변 관광지를 빠르게 찾아줍니다.</p>\n");
      out.write("\t\t\t<!-- lightbox -->\n");
      out.write("\t\t\t<div class=\"lightbox square clearfix\">\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/1.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/1.jpg\" alt=\"경복궁1\"><em>경복궁1</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/2.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/2.jpg\" alt=\"경복궁2\"><em>경복궁2</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/3.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/3.jpg\" alt=\"경복궁3\"><em>경복궁3</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/4.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/4.jpg\" alt=\"경복궁4\"><em>경복궁4</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/5.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/5.jpg\" alt=\"경복궁5\"><em>경복궁5</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/6.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/6.jpg\" alt=\"경복궁6\"><em>경복궁6</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/7.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/7.jpg\" alt=\"경복궁7\"><em>경복궁7</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/8.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/8.jpg\" alt=\"경복궁8\"><em>경복궁8</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/9.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/9.jpg\" alt=\"경복궁9\"><em>경복궁9</em></a>\n");
      out.write("\t\t\t\t<a href=\"https://www.royalpalace.go.kr/content/images/season/winter/10.jpg\"><img src=\"https://www.royalpalace.go.kr/content/images/season/winter/10.jpg\" alt=\"경복궁10\"><em>경복궁10</em></a>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<!--//lightbox -->\n");
      out.write("\t\t</article>\n");
      out.write("\t\t<!-- //col5 -->\n");
      out.write("\t</section>\n");
      out.write("\n");
      out.write("   \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\t<footer>\n");
      out.write("\t\t<div class=\"footer1\">\n");
      out.write("\t\t\t<div class=\"navbar_logo\">\n");
      out.write("\t\t\t\t<i class=\"fab fa-accusoft\"></i>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div>\n");
      out.write("\t\t\t\tKoravel <br> Addr. 서울특별시 금천구 가산디지털1로 151 2F<br> Tel.\n");
      out.write("\t\t\t\t02 - 123 - 4567<br> COPYRIGHT 2021. Koravel. ALL RIGHT\n");
      out.write("\t\t\t\tRESERVED.\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\n");
      out.write("    \n");
      out.write("    <script>       \n");
      out.write("        //라이트 박스\n");
      out.write("        $(\".lightbox\").lightGallery({\n");
      out.write("            thumbnail: true,\n");
      out.write("            autoplay: true,\n");
      out.write("            pause: 3000,\n");
      out.write("            progressBar: true\n");
      out.write("        }); \n");
      out.write("        //이미지 슬라이더\n");
      out.write("        $(\".slider\").slick({\n");
      out.write("\t\t\tdots: true,\n");
      out.write("\t\t\tautoplay: true,\n");
      out.write("\t\t\tautoplaySpeed: 3000,\n");
      out.write("\t\t\tarrows: true,\n");
      out.write("\t\t\tresponsive: [\n");
      out.write("\t\t\t    {\n");
      out.write("\t\t\t\t    breakpoint: 768,\n");
      out.write("\t\t\t\t    settings: {\n");
      out.write("\t\t\t\t        autoplay: false,\n");
      out.write("\t\t\t      \t}\n");
      out.write("\t\t\t    }\n");
      out.write("\t\t\t]\n");
      out.write("\t\t});       \n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fchoose_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    boolean _jspx_th_c_005fchoose_005f0_reused = false;
    try {
      _jspx_th_c_005fchoose_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fchoose_005f0.setParent(null);
      int _jspx_eval_c_005fchoose_005f0 = _jspx_th_c_005fchoose_005f0.doStartTag();
      if (_jspx_eval_c_005fchoose_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("\t\t\t   \t\t\t");
          if (_jspx_meth_c_005fwhen_005f0(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write("\n");
          out.write("\t\t\t\t \t    ");
          if (_jspx_meth_c_005fotherwise_005f0(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write("\n");
          out.write("\t\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fchoose_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fchoose_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f0);
      _jspx_th_c_005fchoose_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fchoose_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fchoose_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fwhen_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    boolean _jspx_th_c_005fwhen_005f0_reused = false;
    try {
      _jspx_th_c_005fwhen_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fwhen_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      // /WEB-INF/views/festival/detailFestival.jsp(49,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fwhen_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${festival.readerID ne null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fwhen_005f0 = _jspx_th_c_005fwhen_005f0.doStartTag();
      if (_jspx_eval_c_005fwhen_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("\t\t\t    \t\t<a href='javascript: like_func();'><img src='../resources/images/reco/dislike.PNG' id='like_img'></a>\n");
          out.write("\t\t\t\t\t    ");
          int evalDoAfterBody = _jspx_th_c_005fwhen_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fwhen_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f0);
      _jspx_th_c_005fwhen_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fwhen_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fwhen_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fotherwise_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:otherwise
    org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_005fotherwise_005f0 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _005fjspx_005ftagPool_005fc_005fotherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
    boolean _jspx_th_c_005fotherwise_005f0_reused = false;
    try {
      _jspx_th_c_005fotherwise_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fotherwise_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      int _jspx_eval_c_005fotherwise_005f0 = _jspx_th_c_005fotherwise_005f0.doStartTag();
      if (_jspx_eval_c_005fotherwise_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("\t\t\t\t\t\t<a href='javascript: login_need();'><img src='../resources/images/reco/dislike.PNG'></a>\n");
          out.write("\t\t\t  \t  \t\t");
          int evalDoAfterBody = _jspx_th_c_005fotherwise_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fotherwise_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f0);
      _jspx_th_c_005fotherwise_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fotherwise_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fotherwise_005f0_reused);
    }
    return false;
  }
}
