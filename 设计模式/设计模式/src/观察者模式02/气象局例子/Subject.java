
package 观察者模式02.气象局例子;

interface Subject {
    void registerObserver(Observer o);

    void removeObserver(Observer o);

    void nofityObserver();
}
