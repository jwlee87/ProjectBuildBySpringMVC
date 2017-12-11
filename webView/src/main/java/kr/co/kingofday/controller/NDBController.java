package kr.co.kingofday.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.nhncorp.lucy.security.xss.XssPreventer;

import kr.co.kingofday.common.CommonGenerator;
import kr.co.kingofday.domain.Email;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.News;
import kr.co.kingofday.domain.Reward;
import kr.co.kingofday.domain.SearchNDB;
import kr.co.kingofday.service.MemberService;
import kr.co.kingofday.service.NewsService;
import kr.co.kingofday.service.RewardService;

@Controller
public class NDBController {

	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	@Autowired
	@Qualifier("newsServiceImpl")
	private NewsService newsService;
	
	@Autowired
	private CommonGenerator commonGenerator;
	@Autowired
	private Email email;
	
	@Value("#{commonProperties['ndbServerURI']}")
	String ndbServerURI;
	@Value("#{commonProperties['testServerURI']}")
	String testServerURI;
	@Value("#{commonProperties['hash_key']}")
	String hash_key;
	
	
	private Logger logger = LogManager.getLogger();
	
	///Method
	@RequestMapping(value="/ndb/find")
	public void getFindId() throws Exception {
		logger.debug("/ndb/find");
	}
	
	@RequestMapping(value="/ndb/findAcnt", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findAcnt(
			@RequestParam Map<String, String> paramMap) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>(); 
		
		String onlyEmail = XssPreventer.escape(paramMap.get("onlyEmail"));
		
		String inputId = XssPreventer.escape(paramMap.get("inputId"));
		String inputEmail = XssPreventer.escape(paramMap.get("inputEmail"));
		
		logger.debug("debugging onlyEmail= "+onlyEmail+", inputId= "+inputId+", inputEmail= "+inputEmail);
		
		/////////////////////
		/* email로 아이디 찾기 */
		/////////////////////
		// find account by only email
		if(!onlyEmail.equals("")) {
			logger.debug("onlyEmail is not null");
			
			Member member = memberService.getMemberByEmail(onlyEmail);
			
			//입력된 이메일로 조회된 유저가 없을떄
			if(member == null) {
				
				logger.debug(" 멤버 널 ");
				resultMap.put("check", "notExistEmail");
				
			//입력된 이메일로 조회된 유저가 있을때
			} else {
				
				logger.debug(" 멤버 널 ");
				
				int key = commonGenerator.generateAuthKey();
				int token = commonGenerator.generateTokenKey();
				
				member.setAuthKey(key);
				member.setToken(String.valueOf(token).trim());
				// update findCondition true > 메일 보냈다는 뜻
				memberService.updateFindConditionTrue(member.getUniqueID());
				// update token generated for directly get-method-access type
				memberService.updateAuthKey(member);
				memberService.updateToken(member);
				
				logger.debug(" /findId >> onlyEmail >> debug to Member= "+member);
				
				String id = member.getId();
				String nick = member.getNickName();
				String authKey = String.valueOf(key);
				
				//리얼용 real
				String disposableURI = ndbServerURI+"/"+token+"/"+authKey;
				
				//로컬용 local
				//String disposableURI = "http://localhost/ndb/"+token+"/"+authKey;
				
				logger.debug("URI debugging= "+disposableURI);
				
				String contentForFindId = commonGenerator.findIDForNDB(id, disposableURI); 
				
				logger.debug(id+" :: "+ nick +" :: "+ authKey+" :: "+onlyEmail);
				
				email.setContent(contentForFindId);
				email.setReceiver(onlyEmail);
				email.setSubject("[네버다이바카라] 아이디 찾기 결과 입니다.");
				commonGenerator.sendEmail(email);
				resultMap.put("check", "true");
				resultMap.put("type", "email");
				
				return resultMap;
			}
		/////////////////////////////
		/* ID와 EMAIL로 패스워드 변경하기 */
		/////////////////////////////
		// find account by both id and email
		} else {
			
			Member member = memberService.getMemberByID(inputId);
			
			//입력받은 아이디로 멤버가 조회되지 않을때
			if(member == null) {
				
				resultMap.put("check", "notExistID");
			
			//입력받은 아이디로 멤버가 조회 될때
			} else if (member != null) {
				
				Member memberByInputEmail = memberService.getMemberByEmail(inputEmail);
				String emailByInputId = member.getEmail();
				
				//입력받은 이메일로 멤버가 조회되지 될 때
				if(memberByInputEmail != null) {
					String emailByInputEmail = memberByInputEmail.getEmail();

					//입력받은 아이디로 조회된 멤버와 이메일로 조회된 멤버가 일치 할 때
					//메일로 비밀번호 변경 URL 날려준다.
					if(emailByInputId.equals(emailByInputEmail)) {
						
						int key = commonGenerator.generateAuthKey();
						int token = commonGenerator.generateTokenKey();
						
						member.setAuthKey(key);
						member.setToken(String.valueOf(token).trim());
						// update findCondition true > 메일 보냈다는 뜻
						memberService.updateFindConditionTrue(member.getUniqueID());
						// update token generated for directly get-method-access type
						memberService.updateToken(member);
						memberService.updateAuthKey(member);
						logger.debug(" /findId >> Both id and email >> debug to Member= "+member);
						
						String id = member.getId();
						String nick = member.getNickName();
						String authKey = String.valueOf(key);
						
						//직접 비번변경 가능한 URI
						//리얼용 real
						String disposableURI = ndbServerURI+"/"+token+"/"+authKey;
						
						//로컬용 local
						//String disposableURI = "http://localhost/ndb/"+token+"/"+authKey;
						
						logger.debug("uri= "+disposableURI);
						
						String contentForFindPw = commonGenerator.findPWForNDB(id, disposableURI);
						
						email.setContent(contentForFindPw);
						email.setReceiver(inputEmail);
						email.setSubject("[네버다이바카라] 요청 결과입니다.");
						commonGenerator.sendEmail(email);
						
						logger.debug(id+" :: "+ nick +" :: "+ authKey+" :: "+inputEmail);
						
						resultMap.put("check", "true");
						resultMap.put("type", "both");
						
					//입력받은 아이디로 조회한 멤버와 이메일로 조회한 멤버가 일치하지 않을 때
					//인증번호 쏘지 말아야 되는 경우
					}else {
						
						resultMap.put("check", "notCrt");
					}
				} else {
					resultMap.put("check", "notExistEmail");
				}
			}
		}
		
		return resultMap;
	}
	
	//메일에서 직접 URL 입력
	@RequestMapping(value="/ndb/{token}/{authKey}")
	public String disposableURI( @PathVariable String token, @PathVariable int authKey, Model model) throws Exception {
		logger.debug(" token= "+token+", authKey= "+authKey);
		Member member = memberService.getMemberByAuthKey(authKey);
		if(member.isFindCondition()) {
			if( member.getToken().equals(token) ) {
				
				memberService.updateFindConditionFalse(member.getUniqueID());
				memberService.deleteToken(member.getUniqueID());
				
				model.addAttribute("user", member);
				return "ndb/getURLPage";
			} else {
				return "ndb/timeover";
			}
		} else {
			return "ndb/timeover";
		}
	}
	
	@RequestMapping(value="/ndb/change", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> changePw(@RequestParam HashMap<String, String> data) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String pass = XssPreventer.escape(data.get("pw"));
		String uui = XssPreventer.escape(data.get("uniqueID"));
		
		logger.debug(" [data degug] pw= "+pass+", uniqueID= "+uui);
		int userUniqueID = Integer.parseInt(uui.trim());
		Member member = memberService.getMemberByUniqueID(userUniqueID);
		member.setPass(pass);
		memberService.updateMember(member);
		
		resultMap.put("check", "true");
		return resultMap;
	}
	
	
	@RequestMapping(value="/ndb/responseReward", method=RequestMethod.GET)
	public void responseReward(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.debug("/ndb/responseReward");
		
		PrintWriter out = response.getWriter();
		
		JsonObject json = new JsonObject();
		
		String usn = request.getParameter("usn");
		String reward_key = request.getParameter("reward_key");
		String quantity = request.getParameter("quantity");
		String campaign_key = request.getParameter("campaign_key");
		
		String signed_value = request.getParameter("signed_value");
		
		String check_value= CommonGenerator.sStringToHMACMD5(usn+reward_key+quantity+campaign_key, hash_key); 
		
		logger.debug(" [callback parameter] singed_value= "+signed_value+", usn= "+usn+", reward_key= "+reward_key+", quantity= "+quantity+", campaign_key= "+campaign_key);
		
		int userNo = Integer.parseInt(usn);
		int rewardKey = Integer.parseInt(reward_key);
		int rewardCoin = Integer.parseInt(quantity);
		
		Reward reward = new Reward();
		reward.setUserUniqueID(userNo);
		reward.setReward_key(rewardKey);
		
		//signed_value 체크 성공
		if( signed_value.equals(check_value)) 
		{
			logger.debug("signed_value 체크 성공");
			
			Reward dbReward = rewardService.getReward(rewardKey);
			
			logger.debug("DBREWARD="+dbReward);
			
			//리워드 리스트에 리워드가 있는 회원
			if(dbReward != null)
			{
				logger.debug("1");
				//(이미 리워드 지급이 완료된 reward_key 일 경우)
				json.addProperty("Result", false);
				json.addProperty("ResultCode", 3100);
				json.addProperty("ResultMsg", "duplicate transaction");
				logger.debug(" [실패] 리워드 중복");
			}
			//(리워드 지급 성공)
			else
			{
				logger.debug("2");
				//해당 리워드 성공시 해당유저의 리워드키 저장
				rewardService.addReward(reward);
				Member member = memberService.getMemberByUniqueID(userNo);
				long nowMoney = member.getCashMoney();
				long plusMoney = nowMoney+rewardCoin;
				
				logger.debug(" [성공] 리워드 지급 성공 --- 현재코인:"+nowMoney+", 지급코인:"+rewardCoin+", 총 코인:"+plusMoney);
				
				member.setCashMoney(plusMoney);
				memberService.updateReward(member);
				
				json.addProperty("Result", true);
				json.addProperty("ResultCode", 1);
				json.addProperty("ResultMsg", "success");
			}
		}
		//signed_value 체크 실패
		else 
		{	
			logger.debug("3");
			
			json.addProperty("Result", false);
			json.addProperty("ResultCode", 1100);
			json.addProperty("ResultMsg", "invalid signed value");
			
			logger.debug(" [실패] signed_value 체크 실패");
		}
		
		out.print(json);
		out.flush();
		out.close();
	}
	
	//바카라 뉴스 리스트
	@RequestMapping(value="/ndb/b_news/{currentPage}")
	public String accessBnews(Model model, @PathVariable int currentPage) throws Exception{
		
		ArrayList<News> list = new ArrayList<News>();
		News n1 = newsService.getTotalCount();
		int totalCount = n1.getTotalCount();
		logger.debug("totalCount= "+totalCount);
		
		SearchNDB search = new SearchNDB(currentPage, totalCount);
		search.setTotalCount(totalCount);
		
		logger.debug("searchNDB= "+search);
		
		list = newsService.getNewsList(search);
		
		model.addAttribute("pageResult", search);
		model.addAttribute("list", list);
		
		return "ndb/b_news/index";
	}
	@RequestMapping(value="/ndb/b_news/jsp/{currentPage}/{uniqueID}")
	public String getNews(Model model, @PathVariable int uniqueID, @PathVariable int currentPage) throws Exception{
		News news = newsService.getNews(uniqueID);
		News n1 = newsService.getTotalCount();
		int totalCount = n1.getTotalCount();
		SearchNDB search = new SearchNDB(currentPage, totalCount, 5, 5);
		search.setTotalCount(totalCount);
		ArrayList<News> list = newsService.getNewsList(search);
		
		logger.debug("new.content="+news.getContent());
		
		model.addAttribute("news", news);
		model.addAttribute("pageResult", search);
		model.addAttribute("list", list);
		
		return "ndb/b_news/jsp/detail";
	}
}
