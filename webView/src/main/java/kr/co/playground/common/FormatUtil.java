package kr.co.playground.common;

import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.icert.comm.secu.*;

public class FormatUtil {

	public static String number(long number, String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		return format.format(number);
	}
	
	static IcertSecuManager seed = new IcertSecuManager();
	
	public static String enc_tr_cert(String tr_cert, String extendVar) throws Exception{
		
		String enc_tr_cert = "";
		
		enc_tr_cert = seed.getEnc(tr_cert, "");
		
		String hmacMsg = "";
		hmacMsg = seed.getMsg(enc_tr_cert);
		
		tr_cert = seed.getEnc(enc_tr_cert+"/"+hmacMsg+"/"+extendVar, "");
		
		return tr_cert;
	}
	
	public static boolean paramChk(String path, String param) throws Exception{
		boolean b = true;
		Pattern pattern = Pattern.compile(path);
		Matcher matcher = pattern.matcher(param);
		b= matcher.matches();
		return b;
	}
}
