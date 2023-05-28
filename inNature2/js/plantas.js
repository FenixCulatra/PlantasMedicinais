var plantas = document.getElementById("plantas")

var pl = [
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

for (let i = 0; i < pl.length; i++) {
    let div         = document.createElement("div");
    let img         = document.createElement("img");
    let title       = document.createElement("p");
    let nota_t      = document.createElement("span");
    let nota        = pl[i]["avaliacao"];
    let nota_r      = Math.ceil(nota/2);
    

    
    nota_t.textContent = nota + "/10";
    nota_t.style.fontSize = "1rem";
    nota_t.style.marginLeft = "1rem" ;

    console.log(nota);


    img.src = pl[i]["imagem"];
    title.textContent = pl[i]["nome"];

    // div.className = "border";
    div.appendChild(img);
    let nota_e = document.createElement("p");
    for (let b = 0; b < 5; b++) {
        if (nota_r > 0) {
            nota_r -= 1;
            let star = document.createElement("span");
            star.innerHTML = "&#9733";
            star.style.color = "yellow";
            nota_e.appendChild(star);
        } else {
            let star = document.createElement("span");
            star.innerHTML = "&#9734";
            star.style.color = "yellow";
            nota_e.appendChild(star);
        }
    }
    div.appendChild(nota_e);
    div.appendChild(nota_t)
    div.appendChild(title);
    
    // console.log(div);
    plantas.appendChild(div);
}