package kr.co.playground.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.co.playground.domain.Member;
import kr.co.playground.domain.Video;
import kr.co.playground.service.MemberService;
import kr.co.playground.service.VideoService;

@Controller
@RequestMapping("/web/*")
public class webViewController {

	
	///Field
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("videoServiceImpl")
	private VideoService videoService;
	
	//한페이지에 표시될 게시글 수
	@Value("#{commonProperties['countList']}")
	int countList;
	
	@Value("#{commonProperties['countPage']}")
	int countPage;
	
	//Constructor
	public webViewController() {
		System.out.println(this.getClass());
	}
	
	//videoList
	@RequestMapping(value="/videoList", method=RequestMethod.GET)
	public String videoList(HttpSession session, HttpServletRequest request
			, @ModelAttribute Member member, @RequestParam String id
			, @ModelAttribute Video video, Model model)throws Exception{
		
		System.out.println("::START Controller:: /web/videoList init");
		System.out.println("debug requestParam String id= "+id);
		
		member = memberService.getMemberByID(id);
		model.addAttribute("member", member);
		session.setAttribute("wmember", member);
		String countryCode = String.valueOf(member.getCountryCode());
		
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
				List<Video> list = videoService.getVideo();
				model.addAttribute("list", list);
				return "/webView/view/en/videoList.jsp";
			//kr
			} else if (countryCode.trim().equals("1")){
				List<Video> list = videoService.getFreeVideoKver();
				model.addAttribute("list", list);
				return "/webView/view/kr/videoList.jsp";
			//ch
			} else if (countryCode.trim().equals("2")){
				List<Video> list = videoService.getVideo();
				model.addAttribute("list", list);
				return "/webView/view/ch/videoList.jsp";
			//jp
			} else if (countryCode.trim().equals("3")){
				List<Video> list = videoService.getFreeVideoJver();
				model.addAttribute("list", list);
				return "/webView/view/jp/videoList.jsp";
			} else {
				return "/webView/view/jp/notAccess.jsp";
			}
		} else {
			System.out.println("This page is not serviced at Desktop");
			return "/webView/view/jp/notAccess.jsp";
		}
		
		
		//findAccount
		
	}
	
	// terms of service
	@RequestMapping(value="/tos", method=RequestMethod.GET)
	public String tos(HttpSession session, HttpServletRequest request
			, @ModelAttribute Member member, @RequestParam String id
			, @ModelAttribute Video video, Model model) throws Exception {
		
		member = memberService.getMemberByID(id);
		if(member == null) {
			return "/webView/view/jp/notAccess.jsp";
		}
		//en
		if(member.getCountryCode()==0) {
			return "/webView/view/kr/tos.jsp";
		}
		//kr
		else if(member.getCountryCode()==1) {
			return "/webView/view/kr/tos.jsp";
		}
		//ch
		else if(member.getCountryCode()==2) {
			return "/webView/view/kr/tos.jsp";
		}
		//jp
		else if(member.getCountryCode()==3) {
			return "/webView/view/jp/tos.jsp";
		}
		return "/webView/view/jp/notAccess.jsp";
	}
}
