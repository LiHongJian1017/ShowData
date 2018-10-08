<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">

</style>
 <script src="http://localhost:8080/springmvc0713/js/echarts.min.js"></script>
 <script src="http://localhost:8080/springmvc0713/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	 <div id="main" style="width: 600px;height:400px;"></div>
	 <script type="text/javascript">
	 	var arr;
	 	var nums=[];
	 	var values=[]
	 	$.ajax({
	 		"url":"http://localhost:8080/springmvc0713/getWeather.do",
	 		"async":false,
	 		"type":"get",
	 		"dataType":"json",
	 		"success":function(data){
	 			arr=data;
	 		}
	 	});
	 	for(var i=0;i<arr.length;i++){
	 		nums.push(arr[i].num);
	 		values.push(arr[i].val);
	 	}
	 	
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '气温值分析'
            },
            tooltip: {},
            legend: {
                data:['气温值分析']
            },
            xAxis: {
                data:nums
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: values
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>