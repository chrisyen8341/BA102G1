package com.dateitemrep.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.appreprec.model.AppRepRecService;
import com.dateitem.model.DateItemService;
import com.dateitem.model.DateItemVO;
import com.dateitemrep.model.DateItemRep;
import com.dateitemrep.model.DateItemRepService;
import com.letter.model.LetterService;
import com.member.model.Member;


public class DateItemRepServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException{
			doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException{
		
//		HttpSession session = req.getSession();
//		Member member = (Member)session.getAttribute("member");
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=Big5");
		String action = req.getParameter("action");
		
		System.out.println(action);
		
		if("insert".equals(action)){
			
			//---------���|�H�s��-----------------����令��session��
			Integer memNo  = null;
			memNo =new Integer(req.getParameter("memNo").trim());
			System.out.println(memNo);
			//---------�Q���|���|�ӫ~�s��-----------------
			Integer dateItemNo  = null;
			dateItemNo =new Integer(req.getParameter("dateItemNo").trim());
			
			//---------�s�W������---------------------
			String repText = null;
			repText = req.getParameter("repText").trim();
			
			//--------���|�ɶ����{�b-------------------
			Date repDate = new Date(System.currentTimeMillis());
			Integer repState = new Integer(0);//�N���٨S���B�z
			
			//---------�I�sservice�e�ӳB�z---------------
			DateItemRepService dirSvc = new DateItemRepService();
			dirSvc.addRep(memNo, dateItemNo, repText, repDate, repState);
			
		}
		
		
		if("updatepass".equals(action)){
			
			//---------���|�ӫ~���|�s��-----------------
			Integer repNo  = null;
			repNo =new Integer(req.getParameter("repNo").trim());
			
			//---------�I�sservice�e�ӧ�Q���|�|��---------------
			DateItemRepService dirSvc = new DateItemRepService();
			DateItemService diSvc = new DateItemService();
			Integer memNo = diSvc.findByPK(dirSvc.findByPrimaryKey(repNo).getDateItemNo()).getSellerNo();
			Date recDate = new Date(System.currentTimeMillis());
			//---------�I�sAppreprec�e�Ӭ���-------------------
			AppRepRecService arrSvc = new AppRepRecService();
			arrSvc.addrep(memNo, recDate);
			//-----------�������|���A--------------------------
			DateItemRep dateItemRep = dirSvc.findByPrimaryKey(repNo);
			dirSvc.updateRep(repNo, dateItemRep.getMemNo(), dateItemRep.getDateItemNo(), dateItemRep.getRepText(), dateItemRep.getRepDate(), 1);
			
			//------------�N�ӫ~�אּ�U�[���A--------------------
			DateItemVO dateItem = diSvc.findByPK(dirSvc.findByPrimaryKey(repNo).getDateItemNo());
			diSvc.updateDateItem(dateItem.getDateItemNo(), dateItem.getSellerNo(), dateItem.getRestListNo(), dateItem.getDateItemTitle(),
									dateItem.getDateItemImg(), dateItem.getDateItemText(), dateItem.getDateItemTime(), dateItem.getDateMeetingTime(),
										dateItem.getDateItemLocate(), dateItem.getDateItemPeople(), dateItem.getHasMate(), dateItem.getDateItemPrice(),
											dateItem.getDateItemStatus(), 1, dateItem.getDateItemViewer(), dateItem.getBuyerNo(), dateItem.getIsQRCChecked(), 
											dateItem.getBuyerRep(), dateItem.getSellerRep(), dateItem.getIsInstantDate(), dateItem.getPetNo());
					
			
			//-----------�H�H���Q���|��------------------------
			LetterService ltrSvc = new LetterService();
			ltrSvc.addLtrOfRep(dateItem);
			
			
			
		}
		if("updatedeny".equals(action)){
			
			//---------���|�ӫ~���|�s��-----------------
			Integer repNo  = null;
			repNo =new Integer(req.getParameter("repNo").trim());
			
			//-----------�������|���A--------------------------
			DateItemRepService dirSvc = new DateItemRepService();
			DateItemRep dateItemRep = dirSvc.findByPrimaryKey(repNo);
			dirSvc.updateRep(repNo, dateItemRep.getMemNo(), dateItemRep.getDateItemNo(), dateItemRep.getRepText(), dateItemRep.getRepDate(), 1);
			
		}
		
		
	}
	

}