package com.shop.service;

import java.util.List;

import com.shop.pojo.Auction;
import com.shop.pojo.AuctionCustomer;
import com.shop.pojo.Auctionrecord;

public interface AuctionService {
 List<Auction>queryAllAuctions(Auction auction);
 
 
 
 
 // 根据拍卖品id查询当前拍卖品的所有拍卖信息  
 Auction selectAuctionAndRecodList(int auctionId);




void saveAuctionRecord(Auctionrecord record) throws Exception;



// 查询拍卖时间结束的商品
List<AuctionCustomer> findAuctionendtime();

//查询拍卖时间没有结束的商品
List<Auction>findAuctionNoendtime();




void addAuction(Auction auction);
}
