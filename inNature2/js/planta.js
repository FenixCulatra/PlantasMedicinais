

var planta = null;
var nome = document.getElementById("nome");
var imagem = document.getElementById("imagem");

if (typeof(Storage) !== "undefined") {
    var planta = parseInt(localStorage.getItem("planta selecionada"));
    fetch(`https://innatureweb.onrender.com/planta/${planta}`)
      .then(response => response.json())
      .then(data => {
          let pl = data[0];
          document.getElementById("imagem").src = pl["imagem"];
          document.getElementById("nome").textContent = pl["nome"];
      })
      .catch(err => console.log(err));

      fetch(`https://innatureweb.onrender.com/getPlantasPreparo/${planta}`)
      .then(response => response.json())
      .then(data => {
          let pla = data;
          console.log(pla)
          let preparos = document.querySelector(".preparos");
          for (let i = 0; i < pla.lenght; i++) {
            console.log("oi");
            let div = document.createElement("div");
            let cabeca = document.createElement("div");
            let conte = document.createElement("div");

            div.class = "preparo";
            cabeca.class = "accordion-cabecalho";
            conte.class = "accordion-conteudo";
            cabeca.textContent = "Receita" + i;
            conte.textContent = pla[i]["descricao"];
            
            div.appendChild(cabeca);
            div.appendChild(conte);
            preparos.appendChild(div);
          }
          
      })
      .catch(err => console.log(err));
  } else {
    alert("O nosso site não funciona corretamente no seu navegador")
  }

console.log(planta)


const cabecalho = document.querySelectorAll(".accordion-cabecalho");

cabecalho.forEach((cabecalho) => {
  cabecalho.addEventListener("click", toggleAccordion);
  cabecalho.setAttribute("children", "hide");
});

function toggleAccordion(event) {
  const cabecalho = event.target;
  const conteudo = cabecalho.nextElementSibling;

  if (conteudo.style.display === "none" || conteudo.style.display === "") {
    fechaTodosAccordionContent();
    conteudo.style.display = "block";
    cabecalho.setAttribute("children", "show");
  } else {
    conteudo.style.display = "none";
    cabecalho.setAttribute("children", "hide");
  }
}

function fechaTodosAccordionContent() {
  const conteudo = document.querySelectorAll(".accordion-conteudo");

  conteudo.forEach((content) => {
    content.style.display = "none";
  });
}

fechaTodosAccordionContent();