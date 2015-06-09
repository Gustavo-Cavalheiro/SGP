package sgp;

public class Validacoes {

    private static final int[] pesoCPF = {11, 10, 9, 8, 7, 6, 5, 4, 3, 2};

    public static boolean validaCPF(String cpf) {
        if ((cpf == null) || (cpf.length() != 11)) return false;
        Integer digito1 = calcularDigito(cpf.substring(0, 9), pesoCPF);
        Integer digito2 = calcularDigito(cpf.substring(0, 9) + digito1, pesoCPF);
        return cpf.equals(cpf.substring(0, 9) + digito1.toString() + digito2.toString());
    }

    public static boolean validaCep(String cep) {
        return cep != null && cep.length() == 8 && isNumeric(cep);
    }

    public static boolean validaEmail(String email) {
        return email.matches("\\S+@\\S+\\.\\S+");
    }

    public static boolean validaTelefone(String tel) {
        return tel != null && tel.length() == 10 && isNumeric(tel);
    }

    public static boolean validaCelular(String cel) {
        return cel != null && cel.length() == 11 && isNumeric(cel);
    }

    public static boolean isNumeric(String str) {
        try {
            double d = Double.parseDouble(str);
        } catch (NumberFormatException ex) {
            return false;
        }
        return true;
    }

    private static int calcularDigito(String str, int[] peso) {
        int soma = 0;
        for (int indice = str.length() - 1, digito; indice >= 0; indice--) {
            digito = Integer.parseInt(str.substring(indice, indice + 1));
            soma += digito * peso[peso.length - str.length() + indice];
        }
        soma = 11 - soma % 11;
        return soma > 9 ? 0 : soma;
    }

}
