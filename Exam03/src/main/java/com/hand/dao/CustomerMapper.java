package com.hand.dao;

import java.util.List;

import com.hand.domain.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Short customerId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Short customerId);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    Customer checkCustomer(String username);
    
    List<Customer> getCustomerByPage(int begin,int size);
    
    int getCustomerTotal();
}