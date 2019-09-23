  import Chart from 'chart.js';


  // when user_challenge completed --> compute change#
  var chartDiv = document.getElementById("lineChart")
  var greenpoints = JSON.parse(chartDiv.dataset.green)
  var challenges = JSON.parse(chartDiv.dataset.chall)
  var earnedGreens = JSON.parse(chartDiv.dataset.earned)
  // need initial greenpoint score
  var originalGreen = [0]
  var originalChall = [0]
  var ctxL = chartDiv.getContext('2d');
  var myLineChart = new Chart(ctxL, {
  type: 'line',
  data: {
  labels: ["", "", "", "", "", "", ""],
  datasets: [{
    label: "Challenges",
    data: [...challenges],
    backgroundColor: [
    'rgba(204, 241, 255, .2)',
    ],
    borderColor: [
    'rgba(153, 201, 255, .9)',
    ],
    borderWidth: 2
  },
  {
    label: "Greens per challenge",
    data: [...earnedGreens],
    backgroundColor: [
    'rgba(70,193,144, .1)',
    ],
    borderColor: [
    'rgba(70,193,144, .7)',
    ],
    borderWidth: 2
  },
             {
    label: "Greenscore",
    data: [...greenpoints],
    backgroundColor: [
    'rgba(250, 218, 94, .2)',
    ],
    borderColor: [
    'rgba(250, 218, 94, .7)',
    ],
    borderWidth: 2
    }
    ]
  },
  options: {
  responsive: true
  }
  });

  // function updateChart() {
  //   chart.data.datasets[0].data = oldDataTwo;
  //   chart.data.datasets[1].data = oldDataOne;
  //   chart.data.labels = [];
  //   chart.update();
  // }

  // function addValue() {
  //   // chart.data.datasets[0].shift();
  //   chart.data.datasets[1].data.push(greenpoints);
  //   chart.data.datasets[0].data.push(challenges);
  //   // chart.data.labels.push("January");
  //   chart.update();
  // }

  // myLineChart.addValue()
