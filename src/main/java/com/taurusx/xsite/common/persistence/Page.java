
package com.taurusx.xsite.common.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.taurusx.xsite.common.config.Global;
import com.taurusx.xsite.common.utils.CookieUtils;

/**
 * 分页类
 * @author ThinkGem
 * @version 2013-7-2
 * @param <T>
 */
public class Page<T> {
	
	private int pageNo = 1; // 当前页码
	private int pageSize = Integer.valueOf(Global.getConfig("page.pageSize")); // 页面大小，设置为“-1”表示不进行分页（分页无效）
	
	private long count;// 总记录数，设置为“-1”表示不查询总数
	
	private int first;// 首页索引
	private int last;// 尾页索引
	private int prev;// 上一页索引
	private int next;// 下一页索引
	
	private boolean firstPage;//是否是第一页
	private boolean lastPage;//是否是最后一页

	private int pagerLength = Integer.valueOf(Global.getConfig("page.pagerLength"));// 页面显示页码个数长度
	private int slider = 1;// 前后显示页面长度
	
	private List<T> list = new ArrayList<T>();
	
	private String orderBy = ""; // 标准查询有效， 实例： updatedate desc, name asc

	private String funcName = "page"; // 设置点击页码调用的js函数名称，默认为page，在一页有多个分页对象时使用。
	
	private String funcParam = ""; // 函数的附加参数，第三个参数值。
	
	private String message = ""; // 设置提示消息，显示在“共n条”之后

	public Page() {
		this.pageSize = -1;
	}
	
	/**
	 * 构造方法
	 * @param request 传递 repage 参数，来记住页码
	 * @param response 用于设置 Cookie，记住页码
	 */
	public Page(HttpServletRequest request, HttpServletResponse response){
		this(request, response, -2);
	}

	/**
	 * 构造方法
	 * @param request 传递 repage 参数，来记住页码
	 * @param response 用于设置 Cookie，记住页码
	 * @param defaultPageSize 默认分页大小，如果传递 -1 则为不分页，返回所有数据
	 */
	public Page(HttpServletRequest request, HttpServletResponse response, int defaultPageSize){
		// 设置页码参数（传递repage参数，来记住页码）
		String no = request.getParameter("pageNo");
		if (StringUtils.isNumeric(no)){
			CookieUtils.setCookie(response, "pageNo", no);
			this.setPageNo(Integer.parseInt(no));
		}else if (request.getParameter("repage")!=null){
			no = CookieUtils.getCookie(request, "pageNo");
			if (StringUtils.isNumeric(no)){
				this.setPageNo(Integer.parseInt(no));
			}
		}
		// 设置页面大小参数（传递repage参数，来记住页码大小）
		String size = request.getParameter("pageSize");
		if (StringUtils.isNumeric(size)){
			CookieUtils.setCookie(response, "pageSize", size);
			this.setPageSize(Integer.parseInt(size));
		}else if (request.getParameter("repage")!=null){
			size = CookieUtils.getCookie(request, "pageSize");
			if (StringUtils.isNumeric(size)){
				this.setPageSize(Integer.parseInt(size));
			}
		}else if (defaultPageSize != -2){
			this.pageSize = defaultPageSize;
		}
		// 设置页面分页函数
        String funcName = request.getParameter("funcName");
        if (StringUtils.isNotBlank(funcName)){
            CookieUtils.setCookie(response, "funcName", funcName);
            this.setFuncName(funcName);
        }else if (request.getParameter("repage")!=null){
            funcName = CookieUtils.getCookie(request, "funcName");
            if (StringUtils.isNotBlank(funcName)){
                this.setFuncName(funcName);
            }
        }
        // 设置页面分页函数参数
        String funcParam = request.getParameter("funcParam");
        if (StringUtils.isNotBlank(funcParam)){
            CookieUtils.setCookie(response, "funcParam", funcParam);
            this.setFuncParam(funcParam);
        }else if (request.getParameter("repage")!=null){
            funcName = CookieUtils.getCookie(request, "funcParam");
            if (StringUtils.isNotBlank(funcParam)){
                this.setFuncParam(funcParam);
            }
        }
        
		// 设置排序参数
		String orderBy = request.getParameter("orderBy");
		if (StringUtils.isNotBlank(orderBy)){
			this.setOrderBy(orderBy);
		}
	}
	
	/**
	 * 构造方法
	 * @param pageNo 当前页码
	 * @param pageSize 分页大小
	 */
	public Page(int pageNo, int pageSize) {
		this(pageNo, pageSize, 0);
	}
	
	/**
	 * 构造方法
	 * @param pageNo 当前页码
	 * @param pageSize 分页大小
	 * @param count 数据条数
	 */
	public Page(int pageNo, int pageSize, long count) {
		this(pageNo, pageSize, count, new ArrayList<T>());
	}
	
	/**
	 * 构造方法
	 * @param pageNo 当前页码
	 * @param pageSize 分页大小
	 * @param count 数据条数
	 * @param list 本页数据对象列表
	 */
	public Page(int pageNo, int pageSize, long count, List<T> list) {
		this.setCount(count);
		this.setPageNo(pageNo);
		this.pageSize = pageSize;
		this.list = list;
	}
	
	/**
	 * 初始化参数
	 */
	public void initialize(){
				
		//1
		this.first = 1;
		
		this.last = (int)(count / (this.pageSize < 1 ? 20 : this.pageSize) + first - 1);
		
		if (this.count % this.pageSize != 0 || this.last == 0) {
			this.last++;
		}

		if (this.last < this.first) {
			this.last = this.first;
		}
		
		if (this.pageNo <= 1) {
			this.pageNo = this.first;
			this.firstPage=true;
		}

		if (this.pageNo >= this.last) {
			this.pageNo = this.last;
			this.lastPage=true;
		}

		if (this.pageNo < this.last - 1) {
			this.next = this.pageNo + 1;
		} else {
			this.next = this.last;
		}

		if (this.pageNo > 1) {
			this.prev = this.pageNo - 1;
		} else {
			this.prev = this.first;
		}
		
		//2
		if (this.pageNo < this.first) {// 如果当前页小于首页
			this.pageNo = this.first;
		}

		if (this.pageNo > this.last) {// 如果当前页大于尾页
			this.pageNo = this.last;
		}
		
	}
	
	/**
	 * 默认输出当前分页标签 
	 * <div class="page">${page}</div>
	 */
	@Override
	public String toString() {

		StringBuilder pager = new StringBuilder();
		
		if (pageNo == first) {// 如果是首页
		    if (Global.TRUE.equals(Global.getConfig("page.showFirstLast"))){
		        pager.append("<li class=\"prev disabled\"><a href=\"javascript:;\" title=\"First\"><i class=\"fa fa-angle-double-left\"></i></a></li>");       
	        }
	        if (Global.TRUE.equals(Global.getConfig("page.showPreNext"))){
	            pager.append("<li class=\"prev disabled\"><a href=\"javascript:;\" title=\"Prev\"><i class=\"fa fa-angle-left\"></i></a></li>");
	        }
		} else {
            if (Global.TRUE.equals(Global.getConfig("page.showFirstLast"))){
                pager.append("<li class=\"prev\"><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:1,pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\" title=\"First\"><i class=\"fa fa-angle-double-left\"></i></a></li>");
            }
            if (Global.TRUE.equals(Global.getConfig("page.showPreNext"))){
                pager.append("<li class=\"prev\"><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:"+prev+",pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\" title=\"Prev\"><i class=\"fa fa-angle-left\"></i></a></li>");
            }
		}

		int begin = pageNo - (pagerLength / 2);

		if (begin < first) {
			begin = first;
		}

		int end = begin + pagerLength - 1;

		if (end >= last) {
			end = last;
			begin = end - pagerLength + 1;
			if (begin < first) {
				begin = first;
			}
		}

		if (begin > first) {
			int i = 0;
			for (i = first; i < first + slider && i < begin; i++) {
				pager.append("<li><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:"+i+",pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\">"
						+ (i + 1 - first) + "</a></li>");
			}
			if (i < begin) {
				pager.append("<li class=\"disabled\"><a href=\"javascript:;\">...</a></li>");
			}
		}

		for (int i = begin; i <= end; i++) {
			if (i == pageNo) {
				pager.append("<li class=\"active\"><a href=\"javascript:;\">" + (i + 1 - first)
						+ "</a></li>");
			} else {
				pager.append("<li><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:"+i+",pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\">"
						+ (i + 1 - first) + "</a></li>");
			}
		}

		if (last - end > slider) {
			pager.append("<li class=\"disabled\"><a href=\"javascript:;\">...</a></li>");
			end = last - slider;
		}

		for (int i = end + 1; i <= last; i++) {
			pager.append("<li><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:"+i+",pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\">"
					+ (i + 1 - first) + "</a></li>");
		}

		if (pageNo == last) {
		    if (Global.TRUE.equals(Global.getConfig("page.showPreNext"))){
		         pager.append("<li class=\"next disabled\"><a href=\"javascript:;\" title=\"Next\"><i class=\"fa fa-angle-right\"></i></a></li>");       
	        }
	        if (Global.TRUE.equals(Global.getConfig("page.showFirstLast"))){
	             pager.append("<li class=\"next disabled\"><a href=\"javascript:;\" title=\"Last\"><i class=\"fa fa-angle-double-right\"></i></a></li>");       
	        }
			
		} else {
	        if (Global.TRUE.equals(Global.getConfig("page.showPreNext"))){
	            pager.append("<li class=\"next\"><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:"+next+",pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\" title=\"Next\"><i class=\"fa fa-angle-right\"></i></a></li>");    
	        }
	        if (Global.TRUE.equals(Global.getConfig("page.showFirstLast"))){
	            pager.append("<li class=\"next\"><a href=\"javascript:;\" onclick=\""+funcName+"({pageNo:"+last+",pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\" title=\"Last\"><i class=\"fa fa-angle-double-right\"></i></a></li>");
	        }
		}

		StringBuilder pagination = new StringBuilder();
		//pagination.append("<div class=\"row\">");
		pagination.append("    <div class=\"col-md-5 col-sm-5\">");
        pagination.append("        <div class=\"dataTables_info\" role=\"status\" aria-live=\"polite\"><label>");
        pagination.append("            第 " + ((pageNo - 1) * pageSize + (count == 0 ? 0:1))  + " - " + ((pageNo - 1) * pageSize + list.size()) /*(pageNo * pageSize)*/ + " 条，共 " + count + " 条" + (message!=null?message:""));
        pagination.append("            ，第 <input type=\"text\" value=\""+pageNo+"\" onkeypress=\"var e=window.event||event;var c=e.keyCode||e.which;if(c==13)");
        pagination.append(            funcName+"({pageNo:this.value,pageSize:"+pageSize+",funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\" onclick=\"this.select();\" class=\"form-control input-inline\" style=\"width:50px\"> 页，每页");
        pagination.append("            <input type=\"text\" value=\""+pageSize+"\" onkeypress=\"var e=window.event||event;var c=e.keyCode||e.which;if(c==13)");
        pagination.append(            funcName+"({pageNo:"+pageNo+",pageSize:this.value,funcParam:" + (StringUtils.isEmpty(funcParam) ? "''" : funcParam) + "});\" onclick=\"this.select();\" class=\"form-control input-inline\" style=\"width:50px\"> 条");
        pagination.append("        </label></div>");
        pagination.append("    </div>");
        pagination.append("    <div class=\"col-md-7 col-sm-7\">");
        pagination.append("        <div class=\"dataTables_paginate paging_bootstrap_full_number\">");
        pagination.append("            <ul class=\"pagination\" style=\"visibility: visible;\">");
        pagination.append(pager);
        pagination.append("            </ul>");
        pagination.append("       </div>");
        pagination.append("    </div>");
        //pagination.append("</div>");
		
		/*	分页控件示例
		<div class="row">
    	    <div class="col-md-5 col-sm-5">
    	        <div class="dataTables_info" id="sample_1_2_info" role="status" aria-live="polite">Showing 1 to 5 of 25 records</div>
    	    </div>
    	    <div class="col-md-7 col-sm-7">
    	        <div class="dataTables_paginate paging_bootstrap_full_number" id="sample_1_2_paginate">
    	            <ul class="pagination" style="visibility: visible;">
    	                <li class="prev disabled"><a href="#" title="First"><i class="fa fa-angle-double-left"></i></a></li>
    	                <li class="prev disabled"><a href="#" title="Prev"><i class="fa fa-angle-left"></i></a></li>
    	                <li class="active"><a href="#">1</a></li>
    	                <li><a href="#">2</a></li>
    	                <li><a href="#">3</a></li>
    	                <li><a href="#">4</a></li>
    	                <li><a href="#">5</a></li>
    	                <li class="next"><a href="#" title="Next"><i class="fa fa-angle-right"></i></a></li>
    	                <li class="next"><a href="#" title="Last"><i class="fa fa-angle-double-right"></i></a></li>
    	            </ul>
    	        </div>
    	    </div>
    	</div>
    	
        
        StringBuilder paginationSample = new StringBuilder();
        //paginationSample.append("<div class=\"row\">");
        paginationSample.append("     <div class=\"col-md-5 col-sm-5\">");
        paginationSample.append("        <div class=\"dataTables_info\" id=\"sample_1_2_info\" role=\"status\" aria-live=\"polite\">Showing 1 to 5 of 25 records</div>");
        paginationSample.append("    </div>");
        paginationSample.append("    <div class=\"col-md-7 col-sm-7\">");
        paginationSample.append("        <div class=\"dataTables_paginate paging_bootstrap_full_number\" id=\"sample_1_2_paginate\">");
        paginationSample.append("            <ul class=\"pagination\" style=\"visibility: visible;\">");
        paginationSample.append("                <li class=\"prev disabled\"><a href=\"#\" title=\"First\"><i class=\"fa fa-angle-double-left\"></i></a></li>");
        paginationSample.append("                <li class=\"prev disabled\"><a href=\"#\" title=\"Prev\"><i class=\"fa fa-angle-left\"></i></a></li>");
        paginationSample.append("                <li class=\"active\"><a href=\"#\">1</a></li>");
        paginationSample.append("                <li><a href=\"#\">2</a></li>");
        paginationSample.append("                <li><a href=\"#\">3</a></li>");
        paginationSample.append("                <li><a href=\"#\">4</a></li>");
        paginationSample.append("                <li><a href=\"#\">5</a></li>");
        paginationSample.append("                <li class=\"next\"><a href=\"#\" title=\"Next\"><i class=\"fa fa-angle-right\"></i></a></li>");
        paginationSample.append("                <li class=\"next\"><a href=\"#\" title=\"Last\"><i class=\"fa fa-angle-double-right\"></i></a></li>");
        paginationSample.append("            </ul>");
        paginationSample.append("        </div>");
        paginationSample.append("    </div>");
        //paginationSample.append("</div>");
        */
        
		return pagination.toString();
	}
	
	/**
	 * 获取分页HTML代码
	 * @return
	 */
	public String getHtml(){
		return toString();
	}
	
//	public static void main(String[] args) {
//		Page<String> p = new Page<String>(3, 3);
//		System.out.println(p);
//		System.out.println("首页："+p.getFirst());
//		System.out.println("尾页："+p.getLast());
//		System.out.println("上页："+p.getPrev());
//		System.out.println("下页："+p.getNext());
//	}

	/**
	 * 获取设置总数
	 * @return
	 */
	public long getCount() {
		return count;
	}

	/**
	 * 设置数据总数
	 * @param count
	 */
	public void setCount(long count) {
		this.count = count;
		if (pageSize >= count){
			pageNo = 1;
		}
	}
	
	/**
	 * 获取当前页码
	 * @return
	 */
	public int getPageNo() {
		return pageNo;
	}
	
	/**
	 * 设置当前页码
	 * @param pageNo
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	/**
	 * 获取页面大小
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 设置页面大小（最大500）
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize <= 0 ? 10 : pageSize;// > 500 ? 500 : pageSize;
	}

	/**
	 * 首页索引
	 * @return
	 */
	@JsonIgnore
	public int getFirst() {
		return first;
	}

	/**
	 * 尾页索引
	 * @return
	 */
	@JsonIgnore
	public int getLast() {
		return last;
	}
	
	/**
	 * 获取页面总数
	 * @return getLast();
	 */
	@JsonIgnore
	public int getTotalPage() {
		return getLast();
	}

	/**
	 * 是否为第一页
	 * @return
	 */
	@JsonIgnore
	public boolean isFirstPage() {
		return firstPage;
	}

	/**
	 * 是否为最后一页
	 * @return
	 */
	@JsonIgnore
	public boolean isLastPage() {
		return lastPage;
	}
	
	/**
	 * 上一页索引值
	 * @return
	 */
	@JsonIgnore
	public int getPrev() {
		if (isFirstPage()) {
			return pageNo;
		} else {
			return pageNo - 1;
		}
	}

	/**
	 * 下一页索引值
	 * @return
	 */
	@JsonIgnore
	public int getNext() {
		if (isLastPage()) {
			return pageNo;
		} else {
			return pageNo + 1;
		}
	}
	
	/**
	 * 获取本页数据对象列表
	 * @return List<T>
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * 设置本页数据对象列表
	 * @param list
	 */
	public Page<T> setList(List<T> list) {
		this.list = list;
		initialize();
		return this;
	}

	/**
	 * 获取查询排序字符串
	 * @return
	 */
	@JsonIgnore
	public String getOrderBy() {
		// SQL过滤，防止注入 
		String reg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|"
					+ "(\\b(select|update|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)";
		Pattern sqlPattern = Pattern.compile(reg, Pattern.CASE_INSENSITIVE);
		if (sqlPattern.matcher(orderBy).find()) {
			return "";
		}
		return orderBy;
	}

	/**
	 * 设置查询排序，标准查询有效， 实例： updatedate desc, name asc
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	/**
	 * 获取点击页码调用的js函数名称
	 * function ${page.funcName}(pageNo){location="${ctxAdmin}/list-${category.id}${urlSuffix}?pageNo="+i;}
	 * @return
	 */
	@JsonIgnore
	public String getFuncName() {
		return funcName;
	}

	/**
	 * 设置点击页码调用的js函数名称，默认为page，在一页有多个分页对象时使用。
	 * @param funcName 默认为page
	 */
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}

	/**
	 * 获取分页函数的附加参数
	 * @return
	 */
	@JsonIgnore
	public String getFuncParam() {
		return funcParam;
	}

	/**
	 * 设置分页函数的附加参数
	 * @return
	 */
	public void setFuncParam(String funcParam) {
		this.funcParam = funcParam;
	}

	/**
	 * 设置提示消息，显示在“共n条”之后
	 * @param message
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * 分页是否有效
	 * @return this.pageSize==-1
	 */
	@JsonIgnore
	public boolean isDisabled() {
		return this.pageSize==-1;
	}
	
	/**
	 * 是否进行总数统计
	 * @return this.count==-1
	 */
	@JsonIgnore
	public boolean isNotCount() {
		return this.count==-1;
	}
	
	/**
	 * 获取 Hibernate FirstResult
	 */
	public int getFirstResult(){
		int firstResult = (getPageNo() - 1) * getPageSize();
		if (firstResult >= getCount()) {
			firstResult = 0;
		}
		return firstResult;
	}
	/**
	 * 获取 Hibernate MaxResults
	 */
	public int getMaxResults(){
		return getPageSize();
	}

//	/**
//	 * 获取 Spring data JPA 分页对象
//	 */
//	public Pageable getSpringPage(){
//		List<Order> orders = new ArrayList<Order>();
//		if (orderBy!=null){
//			for (String order : StringUtils.split(orderBy, ",")){
//				String[] o = StringUtils.split(order, " ");
//				if (o.length==1){
//					orders.add(new Order(Direction.ASC, o[0]));
//				}else if (o.length==2){
//					if ("DESC".equals(o[1].toUpperCase())){
//						orders.add(new Order(Direction.DESC, o[0]));
//					}else{
//						orders.add(new Order(Direction.ASC, o[0]));
//					}
//				}
//			}
//		}
//		return new PageRequest(this.pageNo - 1, this.pageSize, new Sort(orders));
//	}
//	
//	/**
//	 * 设置 Spring data JPA 分页对象，转换为本系统分页对象
//	 */
//	public void setSpringPage(org.springframework.data.domain.Page<T> page){
//		this.pageNo = page.getNumber();
//		this.pageSize = page.getSize();
//		this.count = page.getTotalElements();
//		this.list = page.getContent();
//	}
	
}
