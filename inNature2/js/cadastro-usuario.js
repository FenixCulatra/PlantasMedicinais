var form = document.getElementById("cadastro");
var cd_nome = document.getElementById("cd_nome");
var cd_email = document.getElementById("cd_email");
var cd_senha = document.getElementById("cd_senha");
var cd_senha_confirmar = document.getElementById("cd_senha_confirmar");
var submit = document.getElementById("submit");

submit.addEventListener("click", (et) => {
    if (cd_senha.value == cd_senha_confirmar.value) {
        localStorage.setItem("nome", cd_nome.value);
        localStorage.setItem("email", cd_email.value);
        localStorage.setItem("senha", cd_senha.value);
        localStorage.setItem("logado", "1");
    }
})
