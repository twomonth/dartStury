//定义命名可选参数

test(String jiazu,{String fistName,String lastName}){
  print(fistName);
  print(lastName);
}
//使用命名可选参数，flutter 里面很多widget使用的时候就是这个风格。
main(){
  void printElement(element) {
    print(element);
  }

  var list = [1, 2, 3];

// 将 printElement 函数作为参数传递。
  list.forEach(printElement);
}
void doStuff(
    {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
  print('list:  $list');
  print('gifts: $gifts');
}