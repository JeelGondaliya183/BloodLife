/*   Assignment 4 Submission 
     by Gaganpreet Singh 
	 Banner ID: B00819217 
	 */

package com.bloodlife.utility;

import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class SendMail {
	
	 	@Autowired
	    private JavaMailSender javaMailSender;

	 	
		public void sendMail(String to, String subject, String messageText)  {
			try {
//				FileReader fr = new FileReader("src/main/resources/application.properties");
//				Properties property = new Properties();
//				property.load(fr);
				Properties properties = System.getProperties();
				properties.setProperty("mail.smtp.starttls.required","true");
				properties.setProperty("mail.smtp.starttls.enabled", "true");
				properties.setProperty("mail.smtp.host", "smtp.gmail.com");
				properties.setProperty("mail.smtp.port", "587");
				properties.put("mail.smtp.auth","true");

				Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("bloodLife.halifax@gmail.com",
								"Password@123");
					}
				});

				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress("bloodLife.halifax@gmail.com"));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject(subject);
				message.setContent(messageText, "text/html");
				Transport.send(message);

			} catch (Exception e) {

				e.printStackTrace();
			}
		}
}
