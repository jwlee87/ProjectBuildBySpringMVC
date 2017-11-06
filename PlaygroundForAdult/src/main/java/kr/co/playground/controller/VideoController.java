package kr.co.playground.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.playground.common.EmailSender;
import kr.co.playground.domain.Email;
import kr.co.playground.domain.Member;
import kr.co.playground.domain.Video;
import kr.co.playground.service.MemberService;
import kr.co.playground.service.VideoService;

@Controller
@RequestMapping("/web/video/*")
public class VideoController {
	
	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("videoServiceImpl")
	private VideoService videoService;
	
	@Autowired
	private Email email;
	
	@Autowired
	private EmailSender emailSender;
	
	//한페이지에 표시될 게시글 수
	@Value("#{commonProperties['countList']}")
	int countList;
	
	@Value("#{commonProperties['countPage']}")
	int countPage;

	
	///Constructor
	public VideoController() {
		System.out.println(this.getClass());
	}
	
	///Method
	
	//////////////////
	//  videoList  ///
	//////////////////
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String videoList(HttpServletRequest request
		, @ModelAttribute Member member, @RequestParam String id
		, @ModelAttribute Video video, Model model)throws Exception{
		
		System.out.println("::START Controller:: /web/videoList init");
		System.out.println("debug requestParam String id= "+id);
		
		member = memberService.getMemberByID(id);
		model.addAttribute("member", member);
		String countryCode = String.valueOf(member.getCountryCode());
		String tempURI = emailSender.makingReturnWebViewURI(member.getCountryCode());
		String returnURI = tempURI+"video/videoList.jsp";
		String errorURI = tempURI+"video/notAccess.jsp"; 
		
		Device device = DeviceUtils.getCurrentDevice(request);
		System.out.println("device dubug : "+device);
		
		if(device == null) {
			System.out.println("divice is null");
		}
		System.out.println("DEVICE GET DEVICEPLATFORM = "+device.getDevicePlatform().name());
		
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
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return returnURI;
			//kr
			} else if (countryCode.trim().equals("1")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return returnURI;
			//ch
			} else if (countryCode.trim().equals("2")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return returnURI;
			//jp
			} else if (countryCode.trim().equals("3")){
				List<Video> list = videoService.getFreeVideoJver();
				model.addAttribute("list", list);
				return returnURI;
			//error
			} else {
				return errorURI;
			}
		} else {
			System.out.println("This page is not serviced at Desktop");
			return errorURI;
		}
	}
}
