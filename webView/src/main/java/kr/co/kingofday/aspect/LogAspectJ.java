package kr.co.kingofday.aspect;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

public class LogAspectJ {
	///Field
	private Logger logger = LogManager.getLogger();
	
	///Constructor
	public LogAspectJ() {
		logger.info("\n [Common] :: "+this.getClass()+"\n");
	}
	
	//Around  Advice
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		logger.debug("");
		logger.debug("[Around before]  :"+
													joinPoint.getTarget().getClass().getName() +"."+
													joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length !=0){
			logger.debug("[Around before]method: "+ joinPoint.getArgs()[0]);
		}
		Object obj = joinPoint.proceed();

		logger.debug("[Around after] return value  : "+obj);
		logger.debug("");
		
		return obj;
	}
	
}//end of class