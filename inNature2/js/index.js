var fotoPerfil = document.getElementById("fotoPerfil");
var maisPesquisados = document.getElementById("img_maisPesquisado");
var logado = false;
var tem_foto = false;
var LmP = [
    {
        "nome": "Gengibre",
        "avaliacao": 8,
        "imagem": "https://fenixculatra.github.io/PlantasMedicinais/imagens/gegibre.jpg"
    },
    {
        "nome": "Capim-Limão",
        "avaliacao": 7,
        "imagem": "https://fenixculatra.github.io/PlantasMedicinais/imagens/capim-limao.jpg"
    }
];


if (logado && tem_foto) {
    alert("Hã?")
} else {
    fotoPerfil.src = "img/foto_padrao.png";
}



for (let i = 0; i < LmP.length; i++) {
    let div         = document.createElement("div");
    let img         = document.createElement("img");
    let title       = document.createElement("p");
    let nota_t      = document.createElement("span");
    let nota        = LmP[i]["avaliacao"];
    let nota_r      = Math.ceil(nota/2);
    

    
    nota_t.textContent = nota + "/10";
    nota_t.style.fontSize = "1rem";
    nota_t.style.marginLeft = "1rem" ;

    console.log(nota);


    img.src = LmP[i]["imagem"];
    title.textContent = LmP[i]["nome"];

    // div.className = "border";
    div.appendChild(img);
    for (let b = 0; b < 5; b++) {
        if (nota_r > 0) {
            nota_r -= 1;
            let star = document.createElement("span");
            star.innerHTML = "&#9733";
            star.style.color = "yellow";
            div.appendChild(star);
        } else {
            let star = document.createElement("span");
            star.innerHTML = "&#9734";
            star.style.color = "yellow";
            div.appendChild(star);
        }
    }
    div.appendChild(nota_t)
    div.appendChild(title);
    
    // console.log(div);
    maisPesquisados.appendChild(div);
}