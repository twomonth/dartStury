# dartStury
建立dart学习空间

## 重要的概念
- 无论是数字，函数和 null 都是对象。所有对象继承自 Object 类
- Dart 支持泛型，如 List <int> （整数列表）或 List <dynamic> （任何类型的对象列表）

## 变量
- 本页局部变量遵守 风格建议指南 使用 var。 没有使用指定类型的方式
- 未初始化的变量默认值是 null ，即使是数字也不会例外。
- 实例变量可以是 final 类型但不能是 const 类型。 必须在构造函数体执行之前初始化 final 实例变量 —— 在变量声明中，参数构造函数中或构造函数的初始化列表中进行初始化。
- 如果需要在编译时就固定变量的值，可以使用 const 类型变量。 如果 Const 变量是类级别的，需要标记为 static const

## 内建类型

<u>**因为在 Dart 所有的变量终究是一个对象（一个类的实例）， 所以变量可以使用 构造涵数 进行初始化。 一些内建类型拥有自己的构造函数。 例如， 通过 Map() 来构造一个 map 变量。**</u>



### Number

包括 int 和 double，int 最大范围为64位，

```dart
// String -> int
var one = int.parse('1');

// String -> double
var onePointOne = double.parse('1.1');

// int -> String
String oneAsString = 1.toString();

// double -> String 保留两位小数
String piAsString = 3.14159.toStringAsFixed(2);

//位移、按位与、按位或
assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 >> 1) == 1); // 0011 >> 1 == 0001
assert((3 | 4) == 7); // 0011 | 0100 == 0111
```

### String

Dart 字符串是一组 UTF-16 单元序列。 字符串通过单引号或者双引号创建，字符串可以通过 `${`*`expression`*`}` 的方式内嵌表达式。

```dart
//可以使用 + 运算符来把多个字符串连接为一个，也可以把多个字面量字符串写在一起来实现字符串连接
var s1 = 'String '
    'concatenation'
    " works even over line breaks.";
var s2 = 'The + operator ' + 'works, as well.';
//使用连续三个单引号或者三个双引号实现多行字符串对象的创建
var s1 = '''
You can create
multi-line strings like this one.
''';
//使用 r 前缀，可以创建 “原始 raw” 字符串：
var s = r"In a raw string, even \n isn't special.";

```

## Boolean

Dart 使用 `bool` 类型表示布尔值。 Dart 只有字面量 `true` and `false` 是布尔类型， 这两个对象都是编译时常量。

Dart 的类型安全意味着不能使用 `if (nonbooleanValue)` 或者 `assert (nonbooleanValue)`。 而是应该像下面这样，明确的进行值检查：

```dart
// 检查空字符串。
var fullName = '';
assert(fullName.isEmpty);

// 检查 0 值。
var hitPoints = 0;
assert(hitPoints <= 0);

// 检查 null 值。
var unicorn;
assert(unicorn == null);

// 检查 NaN 。
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);
```

### List (也被称为 Array)

Lists 的下标索引从 0 开始，第一个元素的索引是 0。 list.length - 1 是最后一个元素的索引

```dart
//在 List 字面量之前添加 const 关键字，可以定义 List 类型的编译时常量：
var constantList = const [1, 2, 3];
// constantList[1] = 1; // 取消注释会引起错误。
```

###  Set

在 Dart 中 Set 是一个元素唯一且无需的集合。 Dart 为 Set 提供了 Set 字面量和 [Set](https://api.dartlang.org/stable/dart-core/Set-class.html) 类型.

```dart
//下面是通过字面量创建 Set 的一个简单示例：
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

//要创建一个空集，使用前面带有类型参数的 {} ，或者将 {} 赋值给 Set 类型的变量：
var names = <String>{};
// Set<String> names = {}; // 这样也是可以的。
// var names = {}; // 这样会创建一个 Map ，而不是 Set 。
//是 Set 还是 Map ？ Map 字面量语法同 Set 字面量语法非常相似。 因为先有的 Map 字母量语法，所以 {} 默认是 Map 类型。   如果忘记在 {} 上注释类型或赋值到一个未声明类型的变量上，   那么 Dart 会创建一个类型为 Map<dynamic, dynamic> 的对象。

//使用 add() 或 addAll() 为已有的 Set 添加元素：
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);

//使用 .length 来获取 Set 中元素的个数：
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
assert(elements.length == 5);

//在 Set 字面量前增加 const ，来创建一个编译时 Set 常量：
final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // Uncommenting this causes an error.
```

### Map

下面是使用 Map 字面量的两个简单例子：

```dart
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};
```

**提示：** Dart 会将 `gifts` 的类型推断为 `Map`， `nobleGases` 的类型推断为 `Map` 。 如果尝试在上面的 map 中添加错误类型，那么分析器或者运行时会引发错误。 有关更多信息，请阅读[类型推断。](https://www.dartcn.com/guides/language/sound-dart#type-inference)。

以上 Map 对象也可以使用 Map 构造函数创建：

```dart
var gifts = Map();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

**提示:** 这里为什么只有 `Map()` ，而不是使用 `new Map()`。 因为在 Dart 2 中，`new` 关键字是可选的。 有关更多信息，参考 [构造函数的使用](https://www.dartcn.com/guides/language/language-tour#使用构造函数)。

### Rune

在 Dart 中， Rune 用来表示字符串中的 UTF-32 编码字符

### Symbol

一个 Symbol 对象表示 Dart 程序中声明的运算符或者标识符。 你也许永远都不需要使用 Symbol ，但要按名称引用标识符的 API 时， Symbol 就非常有用了。 因为代码压缩后会改变标识符的名称，但不会改变标识符的符号。 通过字面量 Symbol ，也就是标识符前面添加一个 `#` 号，来获取标识符的 Symbol 。

```dart
#radix
#bar
```



以下只列出知识点，照抄dart文档啰嗦，忘记的点击链接去回忆

[dart中文网](https://www.dartcn.com/guides/language/language-tour)



## 函数

只有一个表达式的情况下可以使用箭头 代替 ’  => ‘  例如：main() => run(myApp());

位置可选参数

命名可选参数

默认参数值

下面是设置可选参数默认值示例：

```dart
/// 设置 [bold] 和 [hidden] 标志 ...
void enableFlags({bool bold = false, bool hidden = false}) {...}

// bold 值为 true; hidden 值为 false.
enableFlags(bold: true);
```

List 和 Map 也可以作为参数

```dart
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
```

