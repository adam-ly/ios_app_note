package 观察者模式02.气象局例子;
import java.util.ArrayList;

// 气象数据
public class WeatherData implements Subject {

    private ArrayList<Observer> observers;
    private float temperture;// 气温
    private float pressure; // 气压
    private float humidity; // 湿度

    public WeatherData(){
        observers = new ArrayList<>();
    }

    public void registerObserver(Observer o) {
        observers.add(o);
    }

    public void removeObserver(Observer o) {
        observers.remove(o);
    }

    //数据有变化则
    public void nofityObserver() {
        for (Observer o: observers) {
            o.update();
        }
    }

    float getTemperature(){
        return 0;
    }

    float getHumidity(){
        return 0;
    }

    float getPressure(){
        return 0;
    }

    void messurementsChanged(){

    }

}
