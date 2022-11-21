//shared preference in flutter
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScreen();
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  String myText = "";
  int _counter = 0;
   
  @override
  void initState() {
    super.initState();
    getcolor();
    _loadCounter();   
    //getcounter();
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Shared Preferences'),
          ),
          body: Container(
            color: myText == "green"  ? Colors.green : myText == "red"? Colors.red : Colors.blue,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Fill the From:-',
                    style: TextStyle(fontSize: 30),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Name'),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Email'),
                      ),
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        print(name.text);
                        print(email.text);
                      },
                      child: const Text('save the from')),

                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('submit and clear form')),

                  ElevatedButton(
                      onPressed: () {
                        //_SaveData();
                        storecolor("green");
                      },
                      child: const Text('Green')),

                  ElevatedButton(
                      onPressed: () {
                        // _GetData();
                        storecolor("blue");
                      },
                      child: const Text('Blue')),

                  ElevatedButton(
                      onPressed: () {
                        //_RemoveData();
                        storecolor("red");
                      },
                      child: const Text('Red')),

                  Text(
                    myText,
                    style: const TextStyle(fontSize: 25),
                  ),

                  ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add)),

                  Text(
                    _counter.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),


                ],
              ),
            ),
          )),
    );
  }

/*void _SaveData() async{
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 20);
    setState(() {
    myText = "";
    });
}*/

/*void _GetData()async
{
    var prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    setState(() {
    myText = "--Blue Is Selected--"; 
    });

}

void _RemoveData()async
{
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('counter');
    setState(() {
    myText = "--Red Is Selected--"; 
    });
} */

  void storecolor(String color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('color', '$color');
    getcolor();
    setState(() {});
  }

  void getcolor() async {
    final prefs = await SharedPreferences.getInstance();
    myText = prefs.getString('color') ?? "";
    print(myText);
  }
}

  //void Pratik() async {
    //final prefs = await SharedPreferences.getInstance();
    //await prefs.setInt('counter', _counter);
    //setState(() {
      
    //});
 // }

  //void getcounter() async {
   // final prefs = await SharedPreferences.getInstance();
   // counter = prefs.getInt('conter') ?? 0;
   // setState(() {});
 // }
//}
//#FF0000 red
//#00FF00 green 
//#0000FF blue