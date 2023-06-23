
// formulário
const form = document.querySelector(".form");


// campos
const nome = document.getElementById("cd_nome");
const email = document.getElementById("cd_email");
const senha = document.getElementById("cd_senha");
const conf_senha = document.getElementById("cd_senha_confirmar");



// Avisos
const alerta1 = document.getElementById("alerta1");
const alerta2 = document.getElementById("alerta2");
const alerta3 = document.getElementById("alerta3");
const alerta4 = document.getElementById("alerta4");
const alerta5 = document.getElementById("alerta5");
const alerta6 = document.getElementById("alerta6");
const alerta7 = document.getElementById("alerta7");

function contador(string){
    let cont = 0;
    let s = ''
    for(var x in senha.value){
        s= s+x;
        cont =  cont+1;
    }
    return cont;
}

// Validando conteúdo dos formulários

form.addEventListener("submit", (e) => {

    // Campos preenchidos
    if(nome.value == 0){
        alerta1.style.display = "flex";
        e.preventDefault();
    }else{
        alerta1.style.display = "none";      
    }
    
    if(email.value == 0){
        alerta2.style.display = "flex";
        e.preventDefault();
    }else{
        alerta2.style.display = "none";      
    }
    if(senha.value == 0){
        alerta4.style.display = "flex";
        e.preventDefault();
    }else{
        alerta4.style.display = "none";      
    }
    if(conf_senha.value == 0){
        alerta6.style.display = "flex";
        e.preventDefault();
    }else{
        alerta6.style.display = "none";      
    }

    // validando email
    if(email.value.indexOf("@") == -1){
        alerta3.style.display = "flex";
        e.preventDefault();
    } else {
        alerta3.style.display = "none";
    }

    

    // controle de caracteres da senha
    let cont = contador(senha.value);

    if(cont < 6 || cont>20){
        alerta5.style.display = "flex";
        e.preventDefault();
    } else {
        alerta5.style.display = "none";
    }

    // validando senhas iguais
    if(senha.value != conf_senha.value){
        alerta7.style.display = "flex";
        e.preventDefault();
    } else {
        alerta7.style.display = "none";
    }
});
