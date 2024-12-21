class CasCadePractice{
  int a = 10;

  void add10(){
    a = a + 10;
    print('after adding 10 : $a');

  }

  void add20(){
    a = a + 20;
    print('after adding 20 : $a');

  }

  void add30(){
    a = a + 30;
    print('after adding 30 : $a');
  }

}

void main(){

  CasCadePractice()..add10()..add20()..add30();



}