var fotoPerfil = document.getElementById("fotoPerfil");
var logado = false;
var tem_foto = false;

console.log(fotoPerfil);

if (logado && tem_foto) {
    alert("Hã?")
} else {
    fotoPerfil.src = "../img/foto_padrao.png";
}
