package com.hand.service;

import com.hand.domain.Customer;
import com.hand.model.PageModel;

public interface CustomerService {
	public Customer checkCustomer(String username, String password);
	public PageModel<Customer> getCustomerByPage(int pageNo,int pageSize);
}
