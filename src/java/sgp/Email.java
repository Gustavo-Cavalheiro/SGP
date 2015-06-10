package sgp;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class Email {

    public static boolean send(String email, String senha) throws Exception {
        Properties props = new Properties();
        // Parâmetros de conexão com servidor
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        // Configurações da conta de email
        final String from = "SGP - Sistema de Gerenciamento Político <sistemagpolitico@gmail.com>";
        final String user = "sistemagpolitico";
        final String pass = "*********"; //A senha da conta de e-mail do sgp
        final String sub = "Recuperação de Senha";
        final String msg = "Olá, você solicitou a recuperação da sua senha para acesso ao Sistema de Gerenciamento Político.\n\nSua senha é: " + senha;

        Session session = Session.getInstance(props, new Authenticator() {
            @Override protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from)); //Remetente
            Address[] to = InternetAddress.parse(email); //Destinatario
            message.setRecipients(Message.RecipientType.TO, to);
            message.setSubject(sub);
            message.setText(msg);
            Transport.send(message);
            return true;
        } catch (MessagingException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;
        }
    }

}
