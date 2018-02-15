var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        loadRandomBiblioPhilly(this);
    }
};
xhttp.open("GET", "data/data.xml", true);
xhttp.send();

function loadRandomBiblioPhilly(xml) {
    var xmlDoc = xml.responseXML;
    
    var random = Math.floor(Math.random() * (6 - 0 + 1));
    
    var src = xmlDoc.getElementsByTagName("src")[random];
    var href = xmlDoc.getElementsByTagName("href")[random];
    var caption = xmlDoc.getElementsByTagName("caption")[random];
    
    document.getElementById("caption").innerHTML = caption.childNodes[0].nodeValue;
    document.getElementsByTagName("a")[0].setAttribute("href", href.childNodes[0].nodeValue);
   	document.getElementsByTagName("img")[0].setAttribute("src", src.childNodes[0].nodeValue);
   	document.getElementsByTagName("img")[0].setAttribute("alt", caption.childNodes[0].nodeValue);
   	
}