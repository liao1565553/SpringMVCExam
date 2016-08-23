package com.hand.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hand.domain.Customer;
import com.hand.model.PageModel;
import com.hand.service.CustomerService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	private static Logger logger = Logger.getLogger(CustomerController.class);
	
	@Resource
	CustomerService customerService;
	
	@Resource
	HttpServletRequest request;
	
//	@Resource
//	HttpServletResponse response;
	
	/** 当前页 */
	int pageNo = 1;
	/** 每一页的大小 */
	final int pageSize = 10;
	/** 最后一页 */
	int lastPage = 1;
	/** 第一页 */
	int fristPage = 1;
	/** 上一页 */
	int prePage = 1;
	/** 下一页 */
	int nextPage = 1;

	
	/**
	 * 用户登录controller
	 * @param model
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(ModelMap model,@RequestParam String username,@RequestParam String password){
		
		logger.info(username+":"+password);
		Customer customer=customerService.checkCustomer(username, password);
		if (customer!=null) {
			request.getSession().setAttribute("loginCustomer",customer );
			return "main";
		}
		return "err";
	}
	
	
	/**
	 * 显示Customer列表
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/query",method=RequestMethod.GET)
	public String customerQuery(ModelMap modelMap){
		
		logger.info("显示Customer列表");

		String pageNoS = request.getParameter("pageNo");
		if (pageNoS != null && !"".equals(pageNoS)) {
			pageNo = Integer.parseInt(pageNoS);
		}
		PageModel<Customer> pageModel = customerService.getCustomerByPage(pageNo, pageSize);
		request.getSession().setAttribute("pageModel", pageModel);
		// 初始化页面属性，方便下面方法的调用
		lastPage = pageModel.getTotalPages();
		prePage = pageModel.getPreviousPageNo();
		nextPage = pageModel.getNextPageNo();
		
		return "customerQuery";
	}
	/**
	 * 下一页
	 * @return
	 */
	@RequestMapping(value="/nextPage",method=RequestMethod.GET)
	public  @ResponseBody PageModel<Customer> nextPage(){
		logger.info("下一页");
		pageNo = nextPage;
		PageModel<Customer> pageModel = customerService.getCustomerByPage(pageNo, pageSize);
		updatePageMsg(pageModel);
		return pageModel;
	}
	
	/**
	 * 上一页
	 * 
	 * @return
	 */
	@RequestMapping(value="prePage",method=RequestMethod.GET)
	public @ResponseBody PageModel<Customer> prePage() {
		logger.info("上一页");
		pageNo = prePage;
		PageModel<Customer> pageModel = customerService.getCustomerByPage(pageNo, pageSize);
		updatePageMsg(pageModel);
		return pageModel;
	}

	/**
	 * 第一页
	 * @return
	 */
	@RequestMapping(value="firstPage",method=RequestMethod.GET)
	public @ResponseBody PageModel<Customer> firstPage() {
		pageNo = fristPage;
		PageModel<Customer> pageModel = customerService.getCustomerByPage(pageNo, pageSize);
		updatePageMsg(pageModel);
		return pageModel;
	}
	
	/**
	 * 最后一页
	 * @return
	 */
	@RequestMapping(value="lastPage",method=RequestMethod.GET)
	public @ResponseBody PageModel<Customer> lastPage() {
		pageNo = lastPage;
		PageModel<Customer> pageModel = customerService.getCustomerByPage(pageNo, pageSize);
		updatePageMsg(pageModel);
		return pageModel;
	}

	/**
	 * 更新上一页和下一页的信息
	 * 
	 * @param pageModel
	 */
	public void updatePageMsg(PageModel<Customer> pageModel) {
		prePage = pageModel.getPreviousPageNo();
		nextPage = pageModel.getNextPageNo();
	}
	
	/**
	 * 更新页面信息
	 * @param request
	 */
	public void updatePageModel(HttpServletRequest request){
		PageModel<Customer> pageModel = customerService.getCustomerByPage(pageNo, pageSize);
		request.getSession().setAttribute("pageModel", pageModel);
	}

}
