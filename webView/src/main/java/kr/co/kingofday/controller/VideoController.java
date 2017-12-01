package kr.co.kingofday.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.kingofday.common.CommonGenerator;
import kr.co.kingofday.domain.Member;
import kr.co.kingofday.domain.Search;
import kr.co.kingofday.domain.Video;
import kr.co.kingofday.service.MemberService;
import kr.co.kingofday.service.VideoService;

@Controller
public class VideoController {
	
	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("videoServiceImpl")
	private VideoService videoService;
	
	@Autowired
	private CommonGenerator commonGenerator;
	
	private Logger logger = LogManager.getLogger();
	
	
	///Constructor
	public VideoController() {
		logger.info(this.getClass());
	}
	
	///Method
	
	//////////////////
	//  videoList  ///
	//////////////////
	@RequestMapping(value="/web/video/list", method=RequestMethod.GET)
	public String videoList(HttpServletRequest request
		, @ModelAttribute Member member, @RequestParam String id
		, @ModelAttribute Video video, Model model)throws Exception{
		
		logger.debug("::START Controller:: /web/video/list init");
		logger.debug("debug requestParam String id= "+id);
		
		member = memberService.getMemberByID(id);
		model.addAttribute("member", member);
		int cc = member.getCountryCode();
		String countryCode = String.valueOf(cc);
		String tempURI = commonGenerator.makingReturnWebViewURI(member.getCountryCode());
		String returnURI = tempURI+"video/videoList";
		String errorURI = tempURI+"video/notAccess"; 
		
		Device device = DeviceUtils.getCurrentDevice(request);
		logger.debug("device dubug : "+device);
		
		if(device == null) {
			logger.debug("divice is null");
		}
		logger.debug("DEVICE GET DEVICEPLATFORM = "+device.getDevicePlatform().name());
		
		String deviceType="unknown";
		if(device.isNormal()) {
			deviceType = "normal";
		}else if(device.isMobile()) {
			deviceType = "mobile";
		}else if(device.isTablet()) {
			deviceType = "tablet";
		}
		
		//디바이스 분기처리 추후 데스크탑에서 접근은 막아야함
		if(deviceType.equals("mobile")||deviceType.equals("tablet")||deviceType.equals("normal")) {
		
			//en
			if (countryCode.trim().equals("0")) {
				List<Video> list = videoService.getFreeVideo(cc);
				model.addAttribute("list", list);
				return returnURI;
			//kr
			} else if (countryCode.trim().equals("1")){
				List<Video> list = videoService.getFreeVideo(cc);
				model.addAttribute("list", list);
				return returnURI;
			//ch
			} else if (countryCode.trim().equals("2")){
				List<Video> list = videoService.getFreeVideo(cc);
				model.addAttribute("list", list);
				return returnURI;
			//jp
			} else if (countryCode.trim().equals("3")){
				List<Video> list = videoService.getFreeVideo(cc);
				model.addAttribute("list", list);
				return returnURI;
			//error
			} else {
				return errorURI;
			}
		} else {
			logger.debug("This page is not serviced at Desktop");
			return errorURI;
		}
	}
	
	/////////////////////
	// video shop list //
	/////////////////////
	@RequestMapping(value="/web/video/shop", method=RequestMethod.GET)
	public String videoShopList(@RequestParam String id, @RequestParam String cp
			, @ModelAttribute Member member, Model model, @ModelAttribute Search search
			, @ModelAttribute Video video) throws Exception {
		
		logger.debug("::START Controller:: /web/video/shop init");
		logger.debug("debug requestParam String id= "+id);
		logger.debug("debug requestParam String page= "+cp);
		
		member = memberService.getMemberByID(id);
		int totalCount = videoService.getTotalCountNotPaidVideo(member).getTotalCount();
		search = new Search(Integer.parseInt(cp), totalCount, member.getCountryCode(), member.getUniqueID(), member.getId());
		
		List<Video> list = videoService.getVideoListNotPaid(search);
		model.addAttribute("member", member);
		model.addAttribute("list", list);
		model.addAttribute("pageResult",search);
		
		int cc = member.getCountryCode();
		String countryString = String.valueOf(cc);
		String tempURI = commonGenerator.makingReturnWebViewURI(member.getCountryCode());
		String returnURI = tempURI+"video/shopList";
		String errorURI = tempURI+"video/notAccess";
		
		if(countryString.trim().equals("0")) {
			return returnURI;
		}else if(countryString.trim().equals("1")) {
			return returnURI;
		}else if(countryString.trim().equals("2")) {
			return returnURI;
		}else if(countryString.trim().equals("3")) {
			return returnURI;
		}else {
			return errorURI;
		}
	}
	////////////////////
	///// my video /////
	////////////////////
	@RequestMapping(value="/web/video/my", method=RequestMethod.GET)
	public String myVideoList(@RequestParam String id, @ModelAttribute Member member
			, Model model, @ModelAttribute Search search, @RequestParam String cp
			, @ModelAttribute Video video) throws Exception {
		
		logger.debug("::START Controller:: /web/video/my init");
		logger.debug("debug requestParam String id= "+id);
		
		member = memberService.getMemberByID(id);
		model.addAttribute("member", member);
		int totalCount = videoService.getTotalCountPaidVideo(member).getTotalCount();
		
		search = new Search(Integer.parseInt(cp), totalCount, member.getCountryCode(), member.getUniqueID(), member.getId());
		logger.debug("서치 디버깅"+search);
		
		List<Video> list = videoService.getVideoListPaid(search);
		model.addAttribute("list", list);
		model.addAttribute("pageResult",search);
		
		int cc = member.getCountryCode();
		String countryString = String.valueOf(cc);
		String tempURI = commonGenerator.makingReturnWebViewURI(member.getCountryCode());
		String returnURI = tempURI+"video/myList";
		String errorURI = tempURI+"video/notAccess";
		
		if(countryString.trim().equals("0")) {
			return returnURI;
		}else if(countryString.trim().equals("1")) {
			return returnURI;
		}else if(countryString.trim().equals("2")) {
			return returnURI;
		}else if(countryString.trim().equals("3")) {
			return returnURI;
		}else {
			return errorURI;
		}
	}
	
	
	//////////////////////////////
	///// VideoDetail /////
	//////////////////////////////
	@RequestMapping(value="/web/video/detail", method=RequestMethod.GET)
	public String freeDetail(@RequestParam String id, @RequestParam int no
			, @ModelAttribute Video video, Model model) throws Exception{
		video = videoService.getVideoDetail(no);
		model.addAttribute("video", video);
		model.addAttribute("id", id);
		return "/webView/view/kr/video/free";
	}
	//////////////////////////////
	///// notPaidVideoDetail /////
	//////////////////////////////
	@RequestMapping(value="/web/video/videoDetail", method=RequestMethod.GET)
	public String notPaidDetail(@RequestParam String id, @RequestParam int no
			, @ModelAttribute Video video, Model model) throws Exception{
		video = videoService.getVideoDetail(no);
		model.addAttribute("video", video);
		model.addAttribute("id", id);
		return "/webView/view/kr/video/notPaidDetail";
	}
	
	
	//////////////////////////
	///// ajax buy check /////
	//////////////////////////
	@RequestMapping(value="/web/video/buyCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> buyCheck(@RequestParam Map<String, Object> paramMap
			, @ModelAttribute Video video) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		logger.debug("/buyCheck debug paramMap= "+paramMap);
		String memberId = (String)paramMap.get("id");
		String tmp = (String)paramMap.get("videoNo");
		int videoNo = Integer.parseInt(tmp);
		
		logger.debug("id= "+memberId+", videoNo= "+videoNo);
		
		Member member = memberService.getMemberByID(memberId.trim());
		video = videoService.getVideoDetail(videoNo);
		
		long cashMoney = member.getCashMoney();
		long nowMoney = member.getNowMoney();
		int price = video.getPrice();
		int point = video.getPoint();
		long changeMoney = cashMoney-price;
		
		
		logger.debug("돈 디버깅:: 코인="+cashMoney+", 가격:"+price+", 지급포인트:"+point+", 보유포인트:"+nowMoney);
		nowMoney += point;
		
		logger.debug("변경 된 포인트: "+nowMoney);
		
		if(cashMoney < price) {
			
			resultMap.put("check", "false");
			return resultMap;
		} else {
			
			Video memberVideo = new Video();
			memberVideo.setUserUniqueNo(member.getUniqueID());
			memberVideo.setVideoNo(video.getVideoNo());
			
			member.setNowMoney(nowMoney);
			member.setCashMoney(changeMoney);
			memberService.updateMemberMoney(member);
			videoService.insertMemberVideo(memberVideo);
			
			resultMap.put("check", "success");
			return resultMap;
		}
		
	}
	
	// Never Die Baccarat Application Video Player
	@RequestMapping(value="/ndb/player/{videoNo}")
	public String videoPlayer(@PathVariable String videoNo, Model model) throws Exception{
		model.addAttribute("no", videoNo);
		
		return "ndb/player";
	}
	
}
