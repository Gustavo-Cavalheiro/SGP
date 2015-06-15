package sgp;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class Email {

    public static boolean send(String nome, String email, String senha) throws Exception {
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
        final String pass = "*********"; // A senha da conta de e-mail do sgp
        final String sub = "Recuperação de Senha";
        final String msg = "<center><img src='http://sgp-eduribeiro.rhcloud.com/_imagens/logo.png' width='433' height='140' alt='SGP - Sistema de Gerenciamento Politico'></center><br><br><br><br>" + nome + ",<br><br>Conforme solicitado, segue sua senha de acesso ao Sistema de Gerenciamento Político:<br><br>Senha: " + senha + "<br><br><br>Caso esta solicitação não tenha sido feita por você, favor responder à este email para que as devidas providências sejam tomadas.<br><br>Atenciosamente,<br><br>Equipe SGP";

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
            message.setContent(msg, "text/html");
            Transport.send(message);
            return true;
        } catch (MessagingException ex) {
            throw ex;
        } catch (Exception ex) {
            throw ex;
        }
    }

}
