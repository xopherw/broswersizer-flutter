import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Broswer Sizer: check your pixels',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Broswer Sizer - A tool to check your device pixels'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Browser Sizer'),
        leading: GestureDetector(
          onTap: () {
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Infomation"),
                  content: Container(
                    width: 300,
                    height: 120,
                    child: Text(
                      'This site is to reference your pixel width and height. '
                      'It is used to create better vision of how your web placement work. '
                      'I hope this tool has been helpful for you as it has done for me.\nEnjoy!',
                      softWrap: true,
                      style: TextStyle(height: 1),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.info_rounded),
        ),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.greenAccent,
            ),
            width: screensize.width * 0.35,
            height: screensize.height * 0.35,
            child: Center(
              child: Text(
                '${screensize.width} W X ${screensize.height} H',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
