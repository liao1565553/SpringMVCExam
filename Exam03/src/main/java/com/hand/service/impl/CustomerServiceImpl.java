package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hand.dao.CustomerMapper;
import com.hand.domain.Customer;
import com.hand.model.PageModel;
import com.hand.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Resource
	CustomerMapper customerMapper;

	/**
	 * 检查用户是否存在，用户名和密码相等且在customer表中存在frist_name字段中有该username
	 * @param username
	 * @param password
	 * @return
	 */
	public Customer checkCustomer(String username, String password) {
		Customer customer = null;
		if (username != null && password != null && username.equals(password)) {
			customer = customerMapper.checkCustomer(username);
			if (customer != null) {
				return customer;
			}
		}
		return null;
	}
	
	/**
	 * 获取分页后的电影列表
	 */
	public PageModel<Customer> getCustomerByPage(int pageNo,int pageSize) {
		PageModel<Customer> pageModel = null;
		List<Customer> list =null;
		try {
			list=customerMapper.getCustomerByPage((pageNo-1)*pageSize, pageSize);
			int total=customerMapper.getCustomerTotal();

			pageModel=new PageModel<Customer>();
			pageModel.setList(list);
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setTotalRecords(total);
			pageModel.setTotalPages(pageModel.getTotalPages());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageModel;
	}
	
}
