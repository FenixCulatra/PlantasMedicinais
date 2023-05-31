var nome = document.querySelector(".nome");
var email = document.querySelector(".email");


if (typeof(Storage) !== "undefined") {
    let tnome = localStorage.getItem("nome");
    nome.innerHTML = tnome.toString();
    let temail = localStorage.getItem("email");
    email.innerHTML = temail.toString();
  } else {
   alert("Não é possível logar neste navegador");
  }
