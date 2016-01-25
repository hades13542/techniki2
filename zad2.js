// JavaScript Document
$(function() {
    var options = {
        backgroundColor: "#FFFFF2",
        theme: "Projekt 2",
        title: {
            fontWeight: "bold",
            text: "Liczba ludności w miastach"
        },
        animationEnabled: true,
        data: [{
            type: "column",
            indexLabelPlacement: "outside",
            indexLabel: "{y}",
            dataPoints: data
        }]
    };

    var options2 = {
        backgroundColor: "#FFFFF2",
        theme: "Projekt 2",
        title: {
            fontWeight: "bold",
            text: "Liczba ludności w województwach"
        },
        animationEnabled: true,
        data: [{
            type: "column",
            indexLabelPlacement: "outside",
            indexLabel: "{y}",
            dataPoints: data2
        }]
    };

    $("#chartContainer").CanvasJSChart(options);
    $("#chartContainer2").CanvasJSChart(options2);
});