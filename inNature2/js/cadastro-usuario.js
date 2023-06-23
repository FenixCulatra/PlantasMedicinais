// var form = document.getElementById("cadastro");
// var cd_nome = document.getElementById("cd_nome");
// var cd_email = document.getElementById("cd_email");
// var cd_senha = document.getElementById("cd_senha");
// var cd_senha_confirmar = document.getElementById("cd_senha_confirmar");
// var submit = document.getElementById("submit");

// submit.addEventListener("click", (et) => {
//     if (cd_senha.value == cd_senha_confirmar.value) {
//         localStorage.setItem("nome", cd_nome.value);
//         localStorage.setItem("email", cd_email.value);
//         localStorage.setItem("senha", cd_senha.value);
//         localStorage.setItem("logado", "1");
//         window.location.href = "index.html";
//     }
// })
const itens = document.getElementById("itens");



const usu = document.getElementById("usu");
const alerta1 = document.getElementById("alerta1");

var senha = document.getElementById("senha");
const alerta2 = document.getElementById("alerta2");
const alerta3 = document.getElementById("alerta3");

var s = "";

function placeitens(){
    if(itens.style.display == "none"){
        itens.style.display = "flex";
    } else {
        itens.style.display = "none";
    }
}


const form = document.getElementByClass("form");
form.addEventListener("submit",function(e){
    // primeira condição
    if(usu.value == 0){
        alerta1.style.display = "flex";
        e.preventDefault();
    }else{
        alerta1.style.display = "none";      
    }

    // segunda condição
    if(senha.value == 0){
        alerta2.style.display = "flex";  
        e.preventDefault();
    }else{
        alerta2.style.display = "none";      
    }

    // terceira condição
    let cont = 0;
    for(var x in senha.value){
        s = s + x;
        cont =  cont+1;
    }
    if((cont < 6 || cont>30) && cont != 0){
        alerta3.style.display = "flex";

        e.preventDefault();
    }else{
        alerta3.style.display = "none";  
    }    
});