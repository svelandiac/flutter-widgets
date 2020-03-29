import 'package:flutter/material.dart';
import 'package:jhonatan_help/common-widgets/multiple_selector_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jhonatan help',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<MultipleSelectorOption> options = [
    MultipleSelectorOption(name: 'First'),
    MultipleSelectorOption(name: 'Second option'),
    MultipleSelectorOption(name: 'Third Option'),
    MultipleSelectorOption(name: 'Fourth option')
  ];

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context); 

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Jhonatan\'s Widgets',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  'Multiple Selector Widget'
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  width: queryData.size.width,
                  child: MultipleSelectorWidget(
                    options: this.options, 
                    onChanged: (List<MultipleSelectorOption> optionsMarked) {
                      print('OPTIONS MARKED');
                      for(MultipleSelectorOption option in optionsMarked) {
                        print(option.name);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}