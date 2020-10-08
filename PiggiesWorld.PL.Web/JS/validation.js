function validateLogin() {
    let element = document.getElementById("login");
    let value = element.value;

    if (value.length < 5 || value.length > 15) {
        alert('Длина имени пользователя должна быть не менее 5 и не более 15 символов!');
        return false;
    }

    for (let i = 0; i < value.length; i++) {
        if (!(isCorrectSymbol(value[i]))) {
            alert('Имя может состоять только из русских и английских букв, а также цифр!');
            return false;
        }
    }

    return true;
}

function validatePassword() {
    let element = document.getElementById("pass");
    let value = element.value;

    if (value.length < 5 || value.length > 15) {
        alert('Пароль должен быть не менее 5 и не более 15 символов!');
        return false;
    }

    for (let i = 0; i < value.length; i++) {
        if (!(isCorrectSymbol(value[i]))) {
            alert('Пароль может состоять только из русских и английских букв, а также цифр!');
            return false;
        }
    }

    return true;
}

function isCorrectSymbol(char) {
    if (char >= 'a' && char <= 'z') // eng
        return true;

    if (char >= 'A' && char <= 'Z') // eng
        return true;

    if (char >= 'а' && char <= 'Я') // rus
        return true;

    if (char >= 'А' && char <= 'Я') // rus
        return true;

    if (char >= '0' && char <= '9')
        return true;

    return false;
}

function validateForm() {
    return validateLogin() && validatePassword();
}