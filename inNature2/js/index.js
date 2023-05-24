var fotoPerfil = document.getElementById("fotoPerfil");
var maisPesquisados = document.getElementById("img_maisPesquisado");
var logado = false;
var tem_foto = false;

if (logado && tem_foto) {
    alert("Hã?")
} else {
    fotoPerfil.src = "img/foto_padrao.png";
}

for (let i = 0; i < 7; i++) {
    let div = document.createElement("div");
    let img = document.createElement("img");
    
    img.src = "https://fenixculatra.github.io/PlantasMedicinais/imagens/gegibre.jpg";
    // div.className = "col";
    div.appendChild(img);
    
    // console.log(div);
    maisPesquisados.appendChild(div);
}