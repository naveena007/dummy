package com.mss.msp.util;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.renderer.DefaultWordRenderer;

public class SimpleCaptcha extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	private HttpServletRequest httpServletRequest;
    private HttpServletResponse httpServletResponse;
	
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.httpServletResponse = httpServletResponse;
    }
    
	public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.httpServletRequest = httpServletRequest;
    }
	public void getCaptchaImage()throws Exception{
		System.out.println("In captcha image method");
		List<Color> colors = new ArrayList<Color> ();
        colors.add(Color.red);
        colors.add(Color.blue);
        colors.add(Color.GREEN);
        colors.add(Color.black);
        List<Font> fonts = new ArrayList<Font>();
        fonts.add(new Font("Arial", Font.ITALIC, 40));
         
        Captcha captcha = new Captcha.Builder(120, 50)
                .addText(new DefaultWordRenderer(colors, fonts))
                .addBackground(new GradiatedBackgroundProducer(Color.white, Color.white))
                .gimp()
                .addBorder()
                .build();
 
        // display the image produced
        CaptchaServletUtil.writeImage(httpServletResponse, captcha.getImage());
 
        // save the captcha value on session
        httpServletRequest.getSession(false).setAttribute("simpleCaptcha", captcha.getAnswer());
 	
	}
	}


