package 观察者模式02.气象局例子;

//当前天气数据展示板
class CurrentConditionsDisplayBoard implements Observer,DisplayElement {
    public void display() { }
    public void update() { }
}

//跟踪最小值 最大值 平均值
class StatisticsDisplayBoard implements Observer,DisplayElement {
    public void display() { }
    public void update() { }
}

//根据气压显示天气预报
class ForecastDisplayBoard implements Observer,DisplayElement {
    public void display() { }
    public void update() { }
}

//其他人自定义的展示板
class ThirdPartyDisplayBoard implements Observer,DisplayElement {
    public void display() { }
    public void update() { }
}
