import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ScrollableListApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter(int value) {
    setState(() {
      _counter += value;
    });
  }

  void _decrementCounter(int value) {
    setState(() {
      _counter -= value;
    });
  }

  void _clearCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.blueGrey,
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => _incrementCounter(2),
                    child: Text('+2'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => _incrementCounter(4),
                    child: Text('+4'),

                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => _decrementCounter(2),
                    child: Text('-2'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => _decrementCounter(4),
                    child: Text('-4'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearCounter,
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

/*task 2*/

class DataListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataListPage(),
    );
  }
}

class DataListPage extends StatelessWidget {
  final Map<String, IconData> dataList = {
    'Exit': Icons.exit_to_app,
    'Play': Icons.play_arrow,
    'Pause': Icons.pause,
    'Stop': Icons.stop,
    'Close': Icons.close_rounded,
    'Delete': Icons.delete,
    'Email': Icons.email,

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(child: Text('Data List App')),
      ),
      body: Column(
        children: dataList.entries.map((entry) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.key,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  entry.value,
                  color: Colors.black,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

/*task 3*/

class IconsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Icons App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IconsPage(),
    );
  }
}

class IconsPage extends StatelessWidget {
  final List<List<IconData>> icons = [
    [
      Icons.add,
      Icons.adjust_rounded,
      Icons.chevron_left_rounded,
      Icons.chevron_right_rounded,
      Icons.alarm,
    ],
    [
      Icons.security,
      Icons.account_circle,
      Icons.restart_alt,
      Icons.queue_music,
      Icons.play_arrow_outlined,
    ],
    [
      Icons.add_photo_alternate,
      Icons.airline_seat_flat,
      Icons.airplanemode_active,
      Icons.album,
      Icons.alarm,
    ],
    [
      Icons.android,
      Icons.archive,
      Icons.assignment,
      Icons.attach_file,
      Icons.audiotrack,
    ],
    [
      Icons.dangerous,
      Icons.upcoming_sharp,
      Icons.more_vert,
      Icons.search_rounded,
      Icons.three_g_mobiledata,


    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemGrey,
        title: Text('Icons App'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: List.generate(5, (rowIndex) {
            return Row(
              children: icons[rowIndex % icons.length].map((icon) {
                return Container(
                  width: 115,
                  height: 115,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.blueGrey,
                    size: 80,
                  ),
                );
              }).toList(),
            );
          }),
        ),
      ),
    );
  }
}

/*task 4*/

class ScrollableListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrollable List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollableListPage(),
    );
  }
}

class ScrollableListPage extends StatefulWidget {
  @override
  _ScrollableListPageState createState() => _ScrollableListPageState();
}

class _ScrollableListPageState extends State<ScrollableListPage> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  void addItem() {
    int newItem = numbers.length + 1;
    setState(() {
      numbers.add(newItem);
    });
  }

  void deleteItem() {
    if (numbers.isNotEmpty) {
      setState(() {
        numbers.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: numbers.map((number) {
            final isOdd = number % 2 != 0;
            final boxColor = isOdd ? Colors.lightBlue : Colors.blue;

            return Container(
              height: 100,
              margin: EdgeInsets.all(8),
              color: boxColor,
              child: Center(
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addItem,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: deleteItem,
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

/*task 5*/

class ColorIconSelectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Color & Icon Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorIconSelectorPage(),
    );
  }
}

class ColorIconSelectorPage extends StatefulWidget {
  @override
  _ColorIconSelectorPageState createState() => _ColorIconSelectorPageState();
}

class _ColorIconSelectorPageState extends State<ColorIconSelectorPage> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  List<IconData> icons = [
    Icons.favorite,
    Icons.star,
    Icons.thumb_up,
    Icons.thumb_down,
    Icons.chat_bubble,
    Icons.check_circle,
    Icons.person,
  ];

  Color selectedColor = Colors.blue;
  IconData selectedIcon = Icons.star;

  Widget buildColorBox(Color color, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(
            color: Colors.black,
            width: 2,
          )
              : null,
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = icon;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(
            color: Colors.black,
            width: 2,
          )
              : null,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color & Icon Selector'),
        backgroundColor: CupertinoColors.systemGrey2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select a color:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: colors.map((color) {
                final isSelected = color == selectedColor;
                return buildColorBox(color, isSelected);
              }).toList(),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select an icon:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: icons.map((icon) {
                final isSelected = icon == selectedIcon;
                return buildIconButton(icon, isSelected);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
