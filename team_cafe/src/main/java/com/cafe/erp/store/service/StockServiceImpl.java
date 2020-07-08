package com.cafe.erp.store.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe.erp.store.model.StockDAO;
import com.cafe.erp.store.model.StockDTO;

@Component
public class StockServiceImpl implements StockService {

	@Autowired
	private SqlSession sqlSession;
	

	
	@Override
	public void insertStock(StockDTO dto) {
		System.out.println("insertStock 진입");
		StockDAO stockDAO = sqlSession.getMapper(StockDAO.class);
		stockDAO.insertStock(dto);
	}
	

	@Override
	public List<StockDTO> getStockList(HashMap map) {
		StockDAO stockDAO = sqlSession.getMapper(StockDAO.class);

		return stockDAO.getStockList(map);
	}

	@Override
	public StockDTO getStock(int stock_code) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);

		return dao.getStock(stock_code);
	}

	@Override
	public int updateStock(StockDTO dto) {
		System.out.println("service updatestock 진입");
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.updateStock(dto);
	}

	@Override
	public int deleteStock(StockDTO dto) {
		System.out.println("service delete 진입");
		System.out.println(dto.getStock_code());
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.deleteStock(dto);
	}

	@Override
	public int getStockCount() {
		StockDAO stockDAO = sqlSession.getMapper(StockDAO.class);
		return stockDAO.getStockCount();
	}

}