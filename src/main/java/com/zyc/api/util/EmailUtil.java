package com.zyc.api.util;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

/**
 * @author ma
 * @date 2020/9/25
 * @desc 发送邮件
 */
public class EmailUtil {
    //发件人
    private final static String from = "";
    //发件人的授权码密码
    private final static String password = "";
    //服务器地址
    private final static String host = "smtp.163.com";

    //配置参数创建会话
    public static void send(String receive){
        Properties prop = new Properties();
        //传输协议
        prop.setProperty("mail.transport.protocol","smtp");
        //主机地址
        prop.setProperty("mail.smtp.host",host);
        //开启认证
        prop.setProperty("mail.smtp.auth","true");
        //设置端口
        prop.setProperty("mail.smtp.port","25");

        //建立会话
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        //获取要发送的邮件
        try {
            MimeMessage mimeMessage = create(session, receive);
            //建立传输通道去发送邮件
            Transport transport = session.getTransport();
            transport.connect(from,password);
            transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //创建邮件
    public static MimeMessage create(Session session,String receive) throws MessagingException, UnsupportedEncodingException {
        //根据session创建一个邮件对象
        MimeMessage mimeMessage = new MimeMessage(session);
        //指定发件人
        mimeMessage.setFrom(new InternetAddress(from,"163","utf-8"));
        //指定收件人
        /*
        MimeMessage.RecipientType.TO：收件人
        MimeMessage.RecipientType.CC：抄送人
        MimeMessage.RecipientType.BCC：秘密抄送人
         */
        mimeMessage.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(receive,"utf-8"));
        //邮件主题
        mimeMessage.setSubject("邮箱绑定");
        //邮件内容
        mimeMessage.setContent("欢迎您使用金融商城，请点击下方链接激活<html><head></head><body><a>点我激活(应该是一个变量)</a></body></html>","text/html;charset=UTF-8");
        //保存邮件修改
        mimeMessage.saveChanges();
        return mimeMessage;
    }
}
