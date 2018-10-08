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
<div id="city" style="width: 1000px;height:400px;"></div>
<div id="citypie" style="width: 1000px;height:400px;"></div>
<script type="text/javascript">

    function loadOneColumn() {
        var myChart = echarts.init(document.getElementById('citypie'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            color: ['#ff7d27', '#47b73d', '#fcc36e', '#57a2fd', "#228b22"],//饼图颜色
            title: {
                text: '城市排行',
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
                name: '发布排行',
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
            "url": 'http://localhost:8080/springmvc0713/getTwo.do',//请求数据的地址
            "async":true,
            "type":"get",
            "dataType":"json",
            success: function (result) {
                arr=result;
                for(var i=0;i<arr.length;i++){
                    names.push(arr[i].city+"\nID:"+arr[i].id);
                    brower.push({
                        name:arr[i].city+"\nID:"+arr[i].id,
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
    var arr;
    var nums=[];
    var values=[]
    $.ajax({
        "url":"http://localhost:8080/springmvc0713/getTwo.do",
        "async":false,
        "type":"get",
        "dataType":"json",
        "success":function(data){
            arr=data;
        }
    });
    for(var i=0;i<arr.length;i++){
        nums.push(arr[i].city+"\nID:"+arr[i].id);
        values.push(arr[i].cishu);
    }

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('city'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '城市排行'
        },
        tooltip: {},
        legend: {
            data:['城市排行']
        },
        grad:{
          y2:140
        },
        xAxis: {
            data:nums,
            axisLabel:{
                interval:0,
                rotate:-30,
            }
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
</html>