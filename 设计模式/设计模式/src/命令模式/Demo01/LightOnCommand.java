package 命令模式.Demo01;

class LightOnCommand implements Command{

    Light light;
    public LightOnCommand(Light light){
        this.light = light;
    }

    public void excute() {
        light.on();
    }
}

class MatchOnCommand implements Command{

    Match match;
    public MatchOnCommand(Match match){
        this.match = match;
    }

    public void excute() {
        match.fire();
    }
}