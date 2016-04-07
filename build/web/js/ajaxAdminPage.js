

$(document).ready(function () {


    function getXMLObject()  //XML OBJECT
    {
        var xmlHttp = false;
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
        } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
            } catch (e2) {
                xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
            }
        }
        if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
            xmlHttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
        }
        return xmlHttp; // Mandatory Statement returning the ajax object created
    }

    $("#add_product").click(function () {
        var xmlhttp2 = new getXMLObject(); //xmlhttp holds the ajax object
        var getdate = new Date(); //Used to prevent caching during ajax call
        if (xmlhttp2) {

            var form = document.getElementById("upload_product");
            var photo = document.getElementById("photo");

            var name = $("#name").val();
            var price = $("#price").val();

            var fd = new FormData();
            fd.append("name", name);
            fd.append("price", price);
            fd.append("photo", photo.files[0]);

            xmlhttp2.open("POST", "AdminPanelController", true);
            xmlhttp2.onreadystatechange = handleServerResponseUpload;
            xmlhttp2.send(fd);
        }

        function handleServerResponseUpload() {
            if (xmlhttp2.readyState == 4) {
                if (xmlhttp2.status == 200) {
                    var req = xmlhttp2.responseText;
                    alert(req);
//                    if (xmlhttp2.responseText == "") {
//                        document.getElementById("uploadMsg").innerHTML = "<p style=\"color:red; \">No image Selected</p>";
//                        spinIconOff();
//                    } else {
//                        $("#ib-container2").prepend(xmlhttp2.responseText);
//                        spinIconOff();
//                        document.getElementById("uploadMsg").innerHTML = "<p style=\"color:green; \">Successfuly Uploaded</p>";
//                    }
                } else {
                    alert("Error during AJAX call. Please try again");
                }
            }
        }

       
    });
});