<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>

<body class="fixed-navigation">
<div id="wrapper">
    <%@ include file="/WEB-INF/views/common/admin_navbar_left.jsp" %>

    <div id="page-wrapper" class="gray-bg sidebar-content">
        <%@ include file="/WEB-INF/views/common/admin_navbar_top.jsp" %>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox ">
                        <div class="ibox-content">
                            <div>
                                <span class="float-right text-right">
                                <small>Average value of sales in the past month in: <strong>United states</strong></small>
                                    <br/>
                                    All sales: 162,862
                                </span>
                                <h1 class="m-b-xs">$ 50,992</h1>
                                <h3 class="font-bold no-margins">
                                    Half-year revenue margin
                                </h3>
                                <small>Sales marketing.</small>
                            </div>

                            <div>
                                <canvas id="lineChart" height="70"></canvas>
                            </div>

                            <div class="m-t-md">
                                <small class="float-right">
                                    <i class="fa fa-clock-o"> </i>
                                    Update on 16.07.2015
                                </small>
                                <small>
                                    <strong>Analysis of sales:</strong> The value has been changed over time, and last month reached a level over $50,000.
                                </small>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-4">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <div class="ibox-tools">
                                <span class="label label-primary float-right">Today</span>
                            </div>
                            <h5>visits</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">22 285,400</h1>
                            <div class="stat-percent font-bold text-navy">20% <i class="fa fa-level-up"></i></div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <div class="ibox-tools">
                                <span class="label label-info float-right">Monthly</span>
                            </div>
                            <h5>Orders</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">60 420,600</h1>
                            <div class="stat-percent font-bold text-info">40% <i class="fa fa-level-up"></i></div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <div class="ibox-tools">
                                <span class="label label-warning float-right">Annual</span>
                            </div>
                            <h5>Income</h5>
                        </div>
                        <div class="ibox-content">
                            <h1 class="no-margins">$ 120 430,800</h1>
                            <div class="stat-percent font-bold text-warning">16% <i class="fa fa-level-up"></i></div>
                            <small>New orders</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mainly scripts -->
<script src="../../../resources/js/jquery-3.1.1.min.js"></script>
<script src="../../../resources/js/popper.min.js"></script>
<script src="../../../resources/js/bootstrap.js"></script>
<script src="../../../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../../../resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../../../resources/js/plugins/flot/jquery.flot.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.pie.js"></script>
<script src="../../../resources/js/plugins/flot/jquery.flot.symbol.js"></script>
<script src="../../../resources/js/plugins/flot/curvedLines.js"></script>

<!-- Peity -->
<script src="../../../resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../../../resources/js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="../../../resources/js/inspinia.js"></script>
<script src="../../../resources/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../../../resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Jvectormap -->
<script src="../../../resources/js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="../../../resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Sparkline -->
<script src="../../../resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../../../resources/js/demo/sparkline-demo.js"></script>

<!-- ChartJS-->
<script src="../../../resources/js/plugins/chartJs/Chart.min.js"></script>
<script>
  $(document).ready(function() {

    var lineData = {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
        {
          label: "Example dataset",
          backgroundColor: "rgba(26,179,148,0.5)",
          borderColor: "rgba(26,179,148,0.7)",
          pointBackgroundColor: "rgba(26,179,148,1)",
          pointBorderColor: "#fff",
          data: [28, 48, 40, 19, 86, 27, 90]
        },
        {
          label: "Example dataset",
          backgroundColor: "rgba(220,220,220,0.5)",
          borderColor: "rgba(220,220,220,1)",
          pointBackgroundColor: "rgba(220,220,220,1)",
          pointBorderColor: "#fff",
          data: [65, 59, 80, 81, 56, 55, 40]
        }
      ]
    };

    var lineOptions = {
      responsive: true
    };


    var ctx = document.getElementById("lineChart").getContext("2d");
    new Chart(ctx, {type: 'line', data: lineData, options:lineOptions});

  });
</script>
</body>
</html>
