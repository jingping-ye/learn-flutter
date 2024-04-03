import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'I Am rich',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: const Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image(
                  image: NetworkImage(
                      'https://img.zcool.cn/community/01239058b7e6dfa801219c77b5b9d3.jpg@1280w_1l_2o_100sh.jpg'),
                  // width: 200.00,
                  height: 200.00,
                ),
              ),
              Expanded(
                child: Image(
                  image: AssetImage('images/diamond.png'),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
