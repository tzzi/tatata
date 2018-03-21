package service;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailAuthService {
	@Autowired
	JavaMailSender sender;
	
	public String sendAuthKey(String email) {
		String[] uuids = UUID.randomUUID().toString().split("-");
		String key = uuids[0]+"-"+uuids[1];
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.addRecipients(RecipientType.TO, email);
			message.setSubject("인증키입니다.");
			
			String text = "<h3>인증키</h3>";
			text +="<p>전송받은 인증키 "+ key +" 를 입력해주세요";
			
			message.setContent(text, "text/html;charset=utf-8");
			
			
			
			sender.send(message);
			return key;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
