// JavaScript Document
$(function() {
    var options = {
        backgroundColor: "#FFFFF2",
        theme: "Projekt 2",
        title: {
            fontWeight: "bold",
            text: "Wartości dla danych produktów"
        },
        animationEnabled: true,
        data: [{
            type: "column",
            indexLabelPlacement: "outside",
            indexLabel: "{y}",
            dataPoints: data
        }]
    };

    $("#chartContainer").CanvasJSChart(options);
});
