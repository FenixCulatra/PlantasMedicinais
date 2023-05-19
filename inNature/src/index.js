const maisPesquisados = document.getElementById("img_maisPesquisado");
// console.log(maisPesquisados);

for (let i = 0; i < 7; i++) {
    let div = document.createElement("div");
    let img = document.createElement("img");
    
    img.src = "https://fenixculatra.github.io/PlantasMedicinais/imagens/gegibre.jpg";
    div.className = "col";
    div.appendChild(img);
    
    // console.log(div);
    maisPesquisados.appendChild(div);
}