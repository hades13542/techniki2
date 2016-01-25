// JavaScript Document

window.onload = function() {
      var chart = new CanvasJS.Chart("chartContainer", {
          theme: "Projekt 3",
          title: { text : " Sprzedaz produktow " },
          data: [ { type : "column", dataPoints: dd } ] 
          } );
       chart.render() ;
}

