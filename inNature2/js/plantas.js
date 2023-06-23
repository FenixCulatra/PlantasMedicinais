var plantas = document.getElementById("plantas")

function loadPlantas(pl) {
    for (let i = 0; i < pl.length; i++) {
    let div         = document.createElement("div");
    let img         = document.createElement("img");
    let title       = document.createElement("p");
    img.src = pl[i]["imagem"];
    title.textContent = pl[i]["nome"];


    div.appendChild(img);
    //&#9733
    div.appendChild(title);
    div.setAttribute("planta", pl[i]["cod_plt"]);

    div.addEventListener("click", (ev) => {
        if (typeof(Storage) !== "undefined") {
            localStorage.setItem("planta selecionada", ev.target.parentElement.getAttribute("planta"));
            window.location.href = "planta.html";
          } else {
            alert("O nosso site não funciona corretamente no seu navegador")
          }
    });

    // console.log(div);
    plantas.appendChild(div);
}
}



fetch("https://innatureweb.onrender.com/getAllPlantas/50")
.then(response => response.json())
.then(data => {
    let pl = data['result'];
    loadPlantas(pl);
})
.catch(err => console.log(err));
