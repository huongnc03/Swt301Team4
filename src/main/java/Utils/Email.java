/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.util.Date;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeUtility;

public class Email {

    static final String username = "fashionlane-system";
    static final String from = "khacson17@gmail.com";
    static final String password = "ymvk uyfu vpsb twwq";

    public boolean sendEmail(String to, String title, String content, String reply) {
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(from, username));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject(MimeUtility.encodeText(title, "UTF-8", "B"));
            msg.setHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setSentDate(new Date());
            if (reply != null) {
                msg.setReplyTo(new InternetAddress[]{new InternetAddress(reply)});
            }
            // Nội dung
            msg.setContent(content, "text/HTML; charset=UTF-8");
            // Gửi email
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
