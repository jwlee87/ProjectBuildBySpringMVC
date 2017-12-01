package kr.co.kingofday.test;

import org.junit.Test;

import com.nhncorp.lucy.security.xss.XssPreventer;

import junit.framework.Assert;

public class testXssPreventerUnicode {

	@Test
	public void test() {
		String dirty = "\"><script>alert('xss');</script>";
		String clean = XssPreventer.escape(dirty);
		
		Assert.assertEquals(clean, "&quot;&gt;&lt;script&gt;alert(&#39;xss&#39;);&lt;/script&gt;");
		Assert.assertEquals(dirty, XssPreventer.unescape(clean));
	}

}
