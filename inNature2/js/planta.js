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

var planta = null;
var nome = document.getElementById("nome");
var imagem = document.getElementById("imagem");

if (typeof(Storage) !== "undefined") {
    planta = localStorage.getItem("planta selecionada");
    document.getElementById("imagem").src = pl[planta]["imagem"];
    document.getElementById("nome").textContent = pl[planta]["nome"];

  } else {
    alert("O nosso site não funciona corretamente no seu navegador")
  }

console.log(planta)