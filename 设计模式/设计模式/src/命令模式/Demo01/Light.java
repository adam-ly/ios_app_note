package 命令模式.Demo01;

class Light {
    void on(){
        System.out.println("light on");
    }

    void off(){
        System.out.println("light off");
    }
}

class Match {
    void fire(){
        System.out.println("fire");
    }

    void putOut(){
        System.out.println("fire Off");
    }
}