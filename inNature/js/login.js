// formulário
const form = document.querySelector(".form");


// campos
const email = document.getElementById("cd_email");
const senha = document.getElementById("cd_senha");


// Avisos
const alerta1 = document.getElementById("alerta1");
const alerta2 = document.getElementById("alerta2");
const alerta3 = document.getElementById("alerta3");
const alerta4 = document.getElementById("alerta4");
const alerta5 = document.getElementById("alerta5");


form.addEventListener("submit", (e) => {

    // Campos preenchidos
    
    if(email.value == 0){
        alerta1.style.display = "flex";
        e.preventDefault();
    }else{
        alerta1.style.display = "none";      
    }
    if(senha.value == 0){
        alerta4.style.display = "flex";
        e.preventDefault();
    }else{
        alerta4.style.display = "none";      
    }

    // validando email
    if(email.value.indexOf("@") == -1){
        alerta2.style.display = "flex";
        e.preventDefault();
    } else {
        alerta2.style.display = "none";
    }
});
