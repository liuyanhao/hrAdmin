package com.lxc.util.mail;
/**
 * 发送邮件需要使用的基本信息 
* @author lxc QQ 1094921525
* 创建时间：2017年12月20日
* @version 1.0
 */
import javax.mail.*;   

public class MyAuthenticator extends Authenticator{   
    String userName=null;   
    String password=null;   
        
    public MyAuthenticator(){   
    }   
    public MyAuthenticator(String username, String password) {    
        this.userName = username;    
        this.password = password;    
    }    
    protected PasswordAuthentication getPasswordAuthentication(){   
        return new PasswordAuthentication(userName, password);   
    }   
}   
