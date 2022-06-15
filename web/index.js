function sendMail(name, email, msg){
    Email.send({
        Host: "smtp.yandex.ru",
            Username: "aatee.at@yandex.ru",
            Password: "huisemrmyfymkekm",
            To: "aatee.at@gmail.com",
            From: "aatee.at@yandex.ru",
            Subject: "Запрос от " + name,
            Body: email + "\n" + msg,
    }).then(
        message => alert("Sent")
    );
}