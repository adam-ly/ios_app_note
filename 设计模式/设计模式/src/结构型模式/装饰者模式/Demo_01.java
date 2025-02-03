package 结构型模式.装饰者模式;

interface Notifier {
    void sendMessage();
}

class BaseNotifier implements Notifier {
    @Override
    public void sendMessage() {
        System.out.print("send message");
    }
}

class QQNotifier implements Notifier {
    Notifier notifier;
    public QQNotifier(Notifier notifier) {
        this.notifier = notifier;
    }

    @Override
    public void sendMessage() {
        System.out.print("send QQ message");
    }
}

class WeChatNotifier implements Notifier {
    Notifier notifier;
    public WeChatNotifier(Notifier notifier) {
        this.notifier = notifier;
    }

    @Override
    public void sendMessage() {
        System.out.print("send wechat message");
    }
}

class EmailNotifier implements Notifier {
    Notifier notifier;
    public EmailNotifier(Notifier notifier) {
        this.notifier = notifier;
    }

    @Override
    public void sendMessage() {
        System.out.print("send email notifier");
    }
}

public class Demo_01 {
    public static void main(String[] args) {
        Notifier baseNotify = new BaseNotifier();
        Notifier qqNotify = new QQNotifier(baseNotify);
        Notifier wcNotify = new WeChatNotifier(qqNotify);
        Notifier emNotify = new EmailNotifier(wcNotify);

        emNotify.sendMessage();
    }
}
