
    let kopy = ["Meia lua de frente", "Compasso", "Queixada", "Armada", "Rabo de arraia", "Martelo", "Bênção","Pisão", "Martelo rotado", "Armada com martelo", "Ponteira", "Queixada com martelo", "Queixada com a mão no chão", "Pisão rotado", "Gancho"];
    let skivy = ["Esquiva de frente", "Esquiva de lado", "Esquiva na cadeira", "De terra basico", "Cocorinha", "Esquiva improvisada"];
    let akrobacie = ["Aú", "Macaco", "Aú sem mão", "Macaquinho", "Aú reversão", "Aú pra frente", "Giro de mão", "Aú batido", "Queda de rins", "Relógio", "Ponte"];
    let basicos = ["Rolê", "Negativa", "Negativa inverge", "Queda de quatro", "Finta aú", "Finta compasso", "Ginga", "Finta armada", "Rasteira", "Rasteira de costa", "Vingativa", "Tesoura","Cabeçada","Passado"];
    let prvky_div = document.getElementById("prvky");
    prvky_div = $("#prvky");
    let sekvence_div = document.getElementById("sekvence")
    let select = document.createElement("select");
    let s_kopy = document.createElement("option");
    s_kopy.value = "kopy";
    s_kopy.innerText  = "Kop";
    select.append(s_kopy);

    let s_skivy = document.createElement("option");
    s_skivy.value = "skivy";
    s_skivy.innerText = "Esquiva";
    select.append(s_skivy);

    let s_akrobacie = document.createElement("option");
    s_akrobacie.value = "akrobacie";
    s_akrobacie.innerText = "Akrobacie";
    select.append(s_akrobacie);

    let s_basicos = document.createElement("option");
    s_basicos.value = "basicos";
    s_basicos.innerText = "Basico"
    select.append(s_basicos);

    let range = document.getElementById("range");
    let range_value = document.getElementById("range_value");
    let generovat_button = document.getElementById("generovat");


    range.addEventListener("change", function () {
        range_value.innerText = range.value;
        console.log( generuj_prvek())
        let selecty = document.querySelectorAll("#prvky select");
        selecty.forEach(function (s) {
            s.remove();
        })
        for(let i = 0; i < range.value; i++){
            console.log(i)
            let select = document.createElement("select");
            let s_kopy = document.createElement("option");
            s_kopy.value = "kopy";
            s_kopy.innerText  = "Kop";
            select.append(s_kopy);

            let s_skivy = document.createElement("option");
            s_skivy.value = "skivy";
            s_skivy.innerText = "Esquiva";
            select.append(s_skivy);

            let s_akrobacie = document.createElement("option");
            s_akrobacie.value = "akrobacie";
            s_akrobacie.innerText = "Akrobacie";
            select.append(s_akrobacie);

            let s_basicos = document.createElement("option");
            s_basicos.value = "basicos";
            s_basicos.innerText = "Basico"
            select.append(s_basicos);

            prvky_div.prepend(select);
        }
    });


    function generuj_prvek(pole = []) {
        let max = pole.length;
        let rand = Math.floor(Math.random() * max);
        return pole[rand];
    }
    function generuj_sekvenci() {
        let selecty = document.querySelectorAll("#prvky select");
        let sekvence = "";
        let sekvence_p = document.createElement("p");
        selecty.forEach(function (s) {
            if(s.value == "kopy"){
                sekvence  += " - " +generuj_prvek(kopy);
            }else if(s.value == "skivy"){
                sekvence  += " - " +generuj_prvek(skivy);
            }else if(s.value == "akrobacie"){
                sekvence  += " - " +generuj_prvek(akrobacie);
            }else if(s.value == "basicos"){
                sekvence  += " - " +generuj_prvek(basicos);
            }
        });
        sekvence_p.innerText = sekvence;
        sekvence_div.append(sekvence_p);
    }
    generovat_button.addEventListener("click", generuj_sekvenci);

