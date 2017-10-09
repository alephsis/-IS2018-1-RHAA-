/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var modalEli = document.getElementById('myModalEli');

var modalMod = document.getElementById('myModalMod');

var btnEli = document.getElementById("btnEli");

var btnMod = document.getElementById("btnMod");

var span = document.getElementsByClassName("close");


btnEli.onclick = function() {
    modalEli.style.display = "block";
}

btnMod.onclick = function() {
    modalMod.style.display = "block";
}

span[0].onclick = function() {
    modalEli.style.display = "none";
    modalMod.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modalEli) {
        modalEli.style.display = "none";
    }
    if (event.target == modalMod) {
        modalMod.style.display = "none";
    }
}


