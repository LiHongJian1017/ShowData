<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        input {
            width: 200px;
            padding:8px;
            background-color: #428bca;
            border-color: #357ebd;
            color: #fff;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px; /* future proofing */
            -khtml-border-radius: 10px; /* for old Konqueror browsers */
            text-align: center;
            vertical-align: middle;
            border: 1px solid transparent;
            font-weight: 900;
            font-size:125%
        }
    </style>
    <style>
        div {
            float : left;
        }
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">

</style>
 <script src="http://localhost:8080/springmvc0713/js/echarts.min.js"></script>
 <script src="http://localhost:8080/springmvc0713/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<input type="button" value="返回"
       onclick="javascrtpt:window.location.href='http://localhost:8080/springmvc0713/index.do'"/><br>
	 <div id="video" style="width: 600px;height:400px;"></div>
     <div id="article" style="width: 600px;height:400px;"></div><br>
    <div id="videopie" style="width: 600px;height:400px;"></div>
    <div id="articlepie" style="width: 600px;height:400px;"></div>

	 <script type="text/javascript">
	 	var arr;
	 	var nums=[];
	 	var values=[]
	 	$.ajax({
	 		"url":"http://localhost:8080/springmvc0713/getOnevideo.do",
	 		"async":false,
	 		"type":"get",
	 		"dataType":"json",
	 		"success":function(data){
	 			arr=data;
	 		}
	 	});
	 	for(var i=0;i<arr.length;i++){
	 		nums.push(arr[i].type+"\n"+arr[i].id);
	 		values.push(arr[i].cishu);
	 	}
	 	
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('video'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'Video排行'
            },
            tooltip: {},
            legend: {
                data:['Video排行']
            },
            xAxis: {
                data:nums
            },
            yAxis: {},
            series: [{
                name: '',
                type: 'bar',
                data: values
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
     <script type="text/javascript">
         var arr;
         var nums=[];
         var values=[]
         $.ajax({
             "url":"http://localhost:8080/springmvc0713/getOnearticle.do",
             "async":false,
             "type":"get",
             "dataType":"json",
             "success":function(data){
                 arr=data;
             }
         });
         for(var i=0;i<arr.length;i++){
             nums.push(arr[i].type+"\n"+arr[i].id);
             values.push(arr[i].cishu);
         }

         // 基于准备好的dom，初始化echarts实例
         var myChart = echarts.init(document.getElementById('article'));

         // 指定图表的配置项和数据
         var option = {
             title: {
                 text: 'article排行'
             },
             tooltip: {},
             legend: {
                 data:['article排行']
             },
             xAxis: {
                 data:nums
             },
             yAxis: {},
             series: [{
                 name: '',
                 type: 'bar',
                 data: values
             }]
         };

         // 使用刚指定的配置项和数据显示图表。
         myChart.setOption(option);
     </script>
</body>
<script type="text/javascript">
    function loadOneColumn() {
        var myChart = echarts.init(document.getElementById('videopie'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            color: ['#ff7d27', '#a65cb7', '#fcc36e', '#57a2fd', "#228b22","#A343FF"],//饼图颜色
            title: {
                text: 'video排行',
                subtext: '',
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: []
            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: 1548
                            }
                        }
                    },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            series: [{
                name: 'video排行',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: []
            }]
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names = [];    //类别数组（用于存放饼图的类别）
        var brower = [];
        var arr = []
        $.ajax({
            "url": 'http://localhost:8080/springmvc0713/getOnevideo.do',//请求数据的地址
            "async":true,
            "type":"get",
            "dataType":"json",
            success: function (result) {
                arr=result;
                for(var i=0;i<arr.length;i++){
                    names.push(arr[i].type+" "+arr[i].id);
                    brower.push({

                        name:arr[i].type+" "+arr[i].id,
                        value:arr[i].cishu
                    });
                    console.log(arr)
                }
                myChart.hideLoading();    //隐藏加载动画
                myChart.setOption({        //加载数据图表
                    legend: {
                        data: names
                    },
                    series: [{
                        data: brower
                    }]
                });
            },
            error: function (errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    };
    loadOneColumn();
</script>
<script type="text/javascript">
    function loadOneColumn2() {
        var myChart = echarts.init(document.getElementById('articlepie'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            color: ['#ff7d27', '#a65cb7', '#fcc36e', '#57a2fd', "#228b22","#A343FF"],//饼图颜色
            title: {
                text: 'article排行',
                subtext: '',
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: []
            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: 1548
                            }
                        }
                    },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            series: [{
                name: 'article排行',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: []
            }]
        });
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        var names = [];    //类别数组（用于存放饼图的类别）
        var brower = [];
        var arr = []
        $.ajax({
            "url": 'http://localhost:8080/springmvc0713/getOnearticle.do',//请求数据的地址
            "async":true,
            "type":"get",
            "dataType":"json",
            success: function (result) {
                arr=result;
                for(var i=0;i<arr.length;i++){
                    names.push(arr[i].type+" "+arr[i].id);
                    brower.push({

                        name:arr[i].type+" "+arr[i].id,
                        value:arr[i].cishu
                    });
                    console.log(arr)
                }
                myChart.hideLoading();    //隐藏加载动画
                myChart.setOption({        //加载数据图表
                    legend: {
                        data: names
                    },
                    series: [{
                        data: brower
                    }]
                });
            },
            error: function (errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    };
    loadOneColumn2();
</script>
</html>