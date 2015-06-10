function mascaraCpf(cpf, e) {
    if (apenasNumeros(e)) {
        setTimeout(function () {
            cpf.value = formataCpf(cpf.value);
        }, 1);
        return true;
    } else {
        return false;
    }
}

function mascaraCep(cep, e) {
    if (apenasNumeros(e)) {
        setTimeout(function () {
            cep.value = formataCep(cep.value);
        }, 1);
        return true;
    } else {
        return false;
    }
}

function mascaraTelefone(tel, e) {
    if (apenasNumeros(e)) {
        setTimeout(function () {
            tel.value = formataTelefone(tel.value);
        }, 1);
        return true;
    } else {
        return false;
    }
}

function mascaraCelular(cel, e) {
    if (apenasNumeros(e)) {
        setTimeout(function () {
            cel.value = formataCelular(cel.value);
        }, 1);
        return true;
    } else {
        return false;
    }
}

function mascaraEmail(email, e) {
    var tecla = getKey(e);
    if (!tecla) return true;
    var caractere = String.fromCharCode(tecla);
    var validar = /^[a-zA-z0-9@.\-_]+$/;
    if (validar.test(caractere) || tecla === 8 || tecla === 13) { // 8=Backspace, 13=Enter
        setTimeout(function () {
            email.value = email.value.toLowerCase();
        }, 1);
        return true;
    } else {
        return false;
    }
}

function formataCpf(valor) {
    valor = valor.replace(/\D/g, "");
    valor = valor.replace(/(\d{3})(\d)/, "$1.$2");
    valor = valor.replace(/(\d{3})(\d)/, "$1.$2");
    valor = valor.replace(/(\d{3})(\d)/, "$1-$2");
    return valor;
}

function formataCep(valor) {
    valor = valor.replace(/\D/g, "");
    valor = valor.replace(/(\d{2})(\d)/, "$1.$2");
    valor = valor.replace(/(\d{3})(\d)/, "$1-$2");
    return valor;
}

function formataTelefone(valor) {
    valor = valor.replace(/\D/g, "");
    valor = valor.replace(/(\d{0})(\d)/, "$1($2");
    valor = valor.replace(/(\d{2})(\d)/, "$1) $2");
    valor = valor.replace(/(\d{4})(\d)/, "$1-$2");
    return valor;
}

function formataCelular(valor) {
    valor = valor.replace(/\D/g, "");
    valor = valor.replace(/(\d{0})(\d)/, "$1($2");
    valor = valor.replace(/(\d{2})(\d)/, "$1) $2");
    valor = valor.replace(/(\d{5})(\d)/, "$1-$2");
    return valor;
}

function apenasNumeros(e) {
    var tecla = getKey(e);
    if (!tecla) return true;
    if ((tecla > 47 && tecla < 58) || tecla === 8 || tecla === 13) { // 8=Backspace, 13=Enter
        return true;
    } else {
        return false;
    }
}

function apenasLetras(e) {
    var tecla = getKey(e);
    if (!tecla) return true;
    var letra = String.fromCharCode(tecla);
    var validar = /^[a-zA-z\u00C0-\u00ff\s]+$/;
    if (validar.test(letra) || tecla === 8 || tecla === 13) { // 8=Backspace, 13=Enter
        return true;
    } else {
        return false;
    }
}

function getKey(e) {
    if (window.event) {
        return e.keyCode;
    } else if (e.which) {
        return e.which;
    }
}