package 创建型模式.工厂模式04.抽象工厂;

abstract class Dough { }

abstract class Clams { }

abstract class Sauce { }

abstract class Cheese { }

class ChicagoDough extends Dough {}
class NewYorkDough extends Dough {}

class NewYorkSauce extends Sauce {}
class ChicagoSauce extends Sauce {}

class NewYorkClams extends Clams {}
class ChicagoClams extends Clams {}

class NewYorkCheese extends Cheese {}
class ChicagoCheese extends Cheese {}