<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://localhost:8080/springmvc0713/js/echarts.min.js"></script>
    <script src="http://localhost:8080/springmvc0713/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
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

</head>
<body>
<input type="button" value="返回"
       onclick="javascrtpt:window.location.href='http://localhost:8080/springmvc0713/index.do'"/><br>
<div id="traffic" style="width: 1000px;height:400px;"></div>
<div id="trafficpie" style="width: 1000px;height:400px;"></div>
<div id="container" style="width: 1000px;height:400px;"></div>





<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('traffic'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title: {
            text: '流量排行'
        },
        tooltip: {},
        legend: {
            data:['']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '',
            type: 'bar',
            data: []
        }]
    });
    myChart.showLoading();
    var names=[];    //类别数组（实际用来盛放X轴坐标值）
    var nums=[];    //销量数组（实际用来盛放Y坐标值）

    $.ajax({
        type : "post",
        async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : "http://localhost:8080/springmvc0713/getThree.do",    //请求发送
        data : {},
        dataType : "json",        //返回数据形式为json
        success : function(result) {
            //请求成功时执行该函数内容，result即为服务器返回的json对象
            if (result) {
                for(var i=0;i<result.length;i++){
                    names.push(result[i].id);    //挨个取出类别并填入类别数组
                }
                for(var i=0;i<result.length;i++){
                    nums.push(result[i].traffic);    //挨个取出流量并填入销量数组
                }
                myChart.hideLoading();    //隐藏加载动画
                myChart.setOption({        //加载数据图表
                    xAxis: {
                        data: names
                    },
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '流量',
                        data: nums
                    }]
                });

            }

        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart.hideLoading();
        }
    })


</script>
<%--<script type="text/javascript">--%>
    <%--var arr;--%>
    <%--var nums=[];--%>
    <%--var values=[]--%>
    <%--$.ajax({--%>
        <%--"url":"http://localhost:8080/springmvc0713/getThree.do",--%>
        <%--"async":false,--%>
        <%--"type":"get",--%>
        <%--"dataType":"json",--%>
        <%--"success":function(data){--%>
            <%--arr=data;--%>
        <%--}--%>
    <%--});--%>
    <%--for(var i=0;i<arr.length;i++){--%>
        <%--nums.push(arr[i].id);--%>
        <%--values.push(arr[i].traffic);--%>
    <%--}--%>

    <%--// 基于准备好的dom，初始化echarts实例--%>
    <%--var myChart = echarts.init(document.getElementById('traffic'));--%>

    <%--// 指定图表的配置项和数据--%>
    <%--var option = {--%>
        <%--title: {--%>
            <%--text: '流量排行'--%>
        <%--},--%>
        <%--tooltip: {},--%>
        <%--legend: {--%>
            <%--data:['流量排行']--%>
        <%--},--%>
        <%--grad:{--%>
            <%--y2:140--%>
        <%--},--%>
        <%--xAxis: {--%>
            <%--data:nums,--%>
            <%--axisLabel:{--%>
                <%--interval:0,--%>
                <%--rotate:-30,--%>
            <%--}--%>
        <%--},--%>
        <%--yAxis: {},--%>
        <%--series: [{--%>
            <%--name: '',--%>
            <%--type: 'bar',--%>
            <%--data: values--%>
        <%--}]--%>
    <%--};--%>

    <%--// 使用刚指定的配置项和数据显示图表。--%>
    <%--myChart.setOption(option);--%>
<%--</script>--%>
</body>
<script type="text/javascript">
    function loadOneColumn() {
        var myChart = echarts.init(document.getElementById('trafficpie'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            color: ['#ff7d27', '#a65cb7', '#fcc36e', '#57a2fd', "#228b22","#A343FF"],//饼图颜色
            title: {
                text: '流量排行',
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
            "url": 'http://localhost:8080/springmvc0713/getThree.do',//请求数据的地址
            "async":true,
            "type":"get",
            "dataType":"json",
            success: function (result) {
                arr=result;
                for(var i=0;i<arr.length;i++){
                    names.push(i+1+":"+arr[i].id);
                    brower.push({
                        name:i+1+":"+arr[i].id,
                        value:arr[i].traffic
                    });
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


<%--<script type="text/javascript">--%>
    <%--function loadOneColumn3() {--%>
        <%--var myChart3 = echarts.init(document.getElementById('traffic3'));--%>
        <%--// 显示标题，图例和空的坐标轴--%>
        <%--myChart3.option = {--%>
            <%--color: ['#3398DB'],--%>
            <%--tooltip : {--%>
                <%--trigger: 'axis',--%>
                <%--axisPointer : {            // 坐标轴指示器，坐标轴触发有效--%>
                    <%--type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'--%>
                <%--}--%>
            <%--},--%>
            <%--grid: {--%>
                <%--left: '3%',--%>
                <%--right: '4%',--%>
                <%--bottom: '3%',--%>
                <%--containLabel: true--%>
            <%--},--%>
            <%--xAxis : [--%>
                <%--{--%>
                    <%--type : 'category',--%>
                    <%--data : [],--%>
                    <%--axisTick: {--%>
                        <%--alignWithLabel: true--%>
                    <%--}--%>
                <%--}--%>
            <%--],--%>
            <%--yAxis : [--%>
                <%--{--%>
                    <%--type : 'value'--%>
                <%--}--%>
            <%--],--%>
            <%--series : [--%>
                <%--{--%>
                    <%--name:'流量：',--%>
                    <%--type:'bar',--%>
                    <%--barWidth: '60%',--%>
                    <%--data:[]--%>
                <%--}--%>
            <%--]--%>
        <%--};--%>
        <%--myChart3.showLoading();    //数据加载完之前先显示一段简单的loading动画--%>
        <%--var names3 = [];    //类别数组（用于存放图的类别）--%>
        <%--var brower3 = [];--%>
        <%--var arr3 = []--%>
        <%--$.ajax({--%>
            <%--"url": 'http://localhost:8080/springmvc0713/getThree.do',//请求数据的地址--%>
            <%--"async":true,--%>
            <%--"type":"get",--%>
            <%--"dataType":"json",--%>
            <%--success: function (result) {--%>
                <%--arr3=result;--%>
                <%--for(var i=0;i<arr3.length;i++){--%>
                    <%--names3.push(i+1+":"+arr3[i].id);--%>
                    <%--brower3.push({--%>
                        <%--name3:i+1+":"+arr3[i].id,--%>
                        <%--value:arr3[i].traffic--%>
                    <%--});--%>
                    <%--console.log(arr3)--%>
                <%--}--%>
                <%--myChart3.hideLoading();    //隐藏加载动画--%>
                <%--myChart3.setOption({        //加载数据图表--%>
                    <%--xAxis: {--%>
                        <%--data: names3--%>
                    <%--},--%>
                    <%--series: [{--%>
                        <%--data: brower3--%>
                    <%--}]--%>
                <%--});--%>
            <%--},--%>
            <%--error: function (errorMsg) {--%>
                <%--//请求失败时执行该函数--%>
                <%--alert("图表请求数据失败!");--%>
                <%--myChart3.hideLoading();--%>
            <%--}--%>
        <%--});--%>
    <%--};--%>
    <%--loadOneColumn3();--%>
<%--</script>--%>


</html>