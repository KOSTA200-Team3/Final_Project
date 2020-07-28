package com.cafe.erp.sell.service;

import java.util.List;

import com.cafe.erp.sell.model.SellDTO;

public interface SellReportsService {
	//상품당 판매 건수
	public List<SellDTO> pcount();
	
	//총 판매한 건수
	public int pcounttotal();
}
