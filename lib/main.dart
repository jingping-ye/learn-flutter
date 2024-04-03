import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Mi Card',
              style: TextStyle(color: Colors.white, fontFamily: 'SourceSans3'),
            ),
          ),
          backgroundColor: Colors.teal.shade700,
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/avatar.jpg'),
                ),
                const Text(
                  '王瑜昕',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontFamily: 'MaShanZheng',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Flutter 开发工程师",
                  style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 14.0,
                    fontFamily: 'NotoSansSC',
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 150.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      size: 20.0,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+86 13479823232',
                      style: TextStyle(
                        fontFamily: 'SourceSans3',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      size: 20.0,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'wangyuxi@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSans3',
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
