package ��Ʈw���إ�;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.pet.model.Pet;
import com.pet.model.PetService;
import com.restaurant.model.RestaurantJDBCDAO;
import com.restaurant.model.RestaurantService;


@WebServlet("/DateItemFakeData2")
public class DateItemFakeData2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MemberService memSvc=new MemberService();
		
		Map<Integer,List<Integer>> pMember=new HashMap<Integer,List<Integer>>();
		for(int i=5001;i<=5015;i++){
			List<Pet> pets=memSvc.getPetsByMemNo(i);
			List<Integer> list=new ArrayList<Integer>();
			for(Pet pet:pets){
				list.add(pet.getPetNo());
			}
			pMember.put(i, list);
		}
		

		
		RestaurantService restSvc=new RestaurantService ();
		Map<Integer,String> rest=new HashMap<Integer,String>();
		for(int i=7006;i<=7080;i++){
			String loc=restSvc.getOneRest(i).getRestLocate();
			rest.put(i, loc);
		}
		
	
		
		List<String> dText=new ArrayList<String>();
		dText.add("Hey�� �˷R���A�̡A�̪�n���� �n�@�}�l�S����A�̳ܪM�@�ءB�U�ȯ��F�C��۳o���R���I�R�A�N�o�˧ڭ̶}�l�F���n���@�ѱ����C�C���h�A�N���F�o�f���H�n�F�A�ѫG�F�A�ڭ̥i�H�ɱ������A�F�C");
		dText.add("Hi~�̪�Ѯ�S�O�n�A�b�o���n���Ѯ�� �̾A�X��n�B�͡A�p�G�A�@�N���ڤ@�_�Y�y���A�|�O�b�������L���@�ѤF");
		dText.add("���o���A�j�a�n�ڡA�ڳ̪�W�R�ݤ��꦳�H�����A�γ\�ڭ̥i�H��Y����ᤤ�꦳�H���᪺�A");
		dText.add("�A�b�ݧڶܡA�S���N�O�p�A�٤��֨ӦY����ӪB�͡A�ڮa�i�R���d�����b���ۧA�O");
		dText.add("�ڮa���d���̪�ܩt��O�A�o���b���ۧA��A���}");
		dText.add("�ڳ̪�b�Чڮa�����ǲ�Hibernate�A�o�w�g�}�l�|�زպA�פF�A�γ\�ڭ̥i�H��Y�����Java��");
		
		
		List<String> dTitle=new ArrayList<String>();
		dTitle.add("�ڭ��ۭ��ۻ��S�ƧA���N�۫H�F�O");
		dTitle.add("�֨Ӥ@�_���a");
		dTitle.add("Yo this is your best chance");
		dTitle.add("�Ѯ�W�n�� ���Ѥ@�_�Y�Ӷ��a");
		dTitle.add("�ڷQ�p�F�A�A�̴H�N���Ѯ��");
		
		List<String> dDate=new ArrayList<String>();
		dDate.add("20170820");
		dDate.add("20170821");
		dDate.add("20170815");

		List<String> mDate=new ArrayList<String>();
		mDate.add("20170830");
		mDate.add("20170825");
		mDate.add("20170822");
		
		List<String> dTime=new ArrayList<String>();
		dTime.add("20:30:20");
		dTime.add("12:30:20");
		dTime.add("09:30:20");
		
		
		List<String> mTime=new ArrayList<String>();
		mTime.add("20:30:20");
		mTime.add("12:30:20");
		mTime.add("09:30:20");
		
		
		
		
		Random rand = new Random();
		for(int i=0;i<100;i++){
			Integer pMemberRand=rand.nextInt(15)+5001;
			Integer restRand=rand.nextInt(75)+7006;
			Integer titleRand=rand.nextInt(dTitle.size());
			Integer textRand=rand.nextInt(dText.size());
			Integer dDateR=rand.nextInt(dDate.size());
			Integer mDateR=rand.nextInt(mDate.size());
			Integer dTimeR=rand.nextInt(dTime.size());
			Integer mTimeR=rand.nextInt(mTime.size());
			Integer mPeopleR=rand.nextInt(5);
			Integer hasMateR=rand.nextInt(2);
			Integer priceR=(rand.nextInt(15)+1)*100;
			Integer statusR=0;
			Integer showR=0;
			Integer viewerR=rand.nextInt(1000);
			Integer buyerR=rand.nextInt(30)+5001;
			Integer qrCodeR=0;
			Integer buyerRepR=0;
			Integer sellerrRepR=0;
			Integer instantR=0;
			//�̷ӥD�H�����d�����ƨ�random
			Integer petNo=pMember.get(pMemberRand).get(rand.nextInt(pMember.get(pMemberRand).size()));
			
			
			String sql="INSERT INTO DATEITEM values (DATEITEMNO_SQ.NEXTVAL,"+(pMemberRand).toString()+","+restRand+",\'"+dTitle.get(titleRand)+"\'"
					+",EMPTY_BLOB(),'"+dText.get(textRand)+"',TO_DATE('"+dDate.get(dDateR)+" "+dTime.get(dTimeR)+"\',\'YYYYMMDD HH24:MI:SS'),TO_DATE('"
					+mDate.get(mDateR)+" "+mTime.get(mTimeR)+"\',\'YYYYMMDD HH24:MI:SS'),'"+rest.get(restRand)+"',"+mPeopleR+","+hasMateR+","+priceR+","
					+statusR+","+showR+viewerR+","+buyerR+","+qrCodeR+","+buyerRepR+","+sellerrRepR+","+instantR+","+petNo+");";
			System.out.println(sql); 
			
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
