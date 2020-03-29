import 'package:flutter/material.dart';

class MultipleSelectorWidget extends StatefulWidget {

  final List<MultipleSelectorOption> options;
  final void Function(List<MultipleSelectorOption>) onChanged;

  MultipleSelectorWidget({this.options, this.onChanged});

  @override
  _MultipleSelectorWidgetState createState() => _MultipleSelectorWidgetState(options: this.options, onChanged: this.onChanged);
}

class _MultipleSelectorWidgetState extends State<MultipleSelectorWidget> {

  final List<MultipleSelectorOption> options;
  final void Function(List<MultipleSelectorOption>) onChanged;

  _MultipleSelectorWidgetState({this.options, this.onChanged});

  List<bool> _valuesList = List();
  final List<MultipleSelectorOption> optionsMarked = List();

  @override
  Widget build(BuildContext context) {

    if (options.length == 0)
      return Container();

    for (int i = 0; i < options.length; i++) {
      _valuesList.add(false);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: this.options.length,
      itemBuilder: (BuildContext builderContext, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Checkbox(
                activeColor: Color(0XFF113D52),
                value: _valuesList.elementAt(index),
                onChanged: (bool value) {
                  setState(() {
                    
                    _valuesList[index] = value;

                    if (value) {

                      var checkIfTheElementExists = optionsMarked.firstWhere(
                        (MultipleSelectorOption option) {
                          if (option.name == options.elementAt(index).name)
                            return true;
                          else
                            return false;
                        },
                        orElse: () {
                          return null;
                        } 
                      );

                      if (checkIfTheElementExists == null)
                        optionsMarked.add(options.elementAt(index));
                    }
                    else {

                      var checkIfTheElementExists = optionsMarked.firstWhere(
                        (MultipleSelectorOption option) {
                          if (option.name == options.elementAt(index).name)
                            return true;
                          else
                            return false;
                        },
                        orElse: () {
                          return null;
                        } 
                      );

                      if (checkIfTheElementExists != null) {
                        optionsMarked.removeWhere(
                          (MultipleSelectorOption option) {
                            if (option.name == options.elementAt(index).name)
                              return true;
                            else
                              return false;
                          }
                        );
                      }                        

                    }
                    onChanged(optionsMarked);
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  this.options.elementAt(index).name,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Color(0XFF113D52),
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}

class MultipleSelectorOption {

  String name;

  MultipleSelectorOption({this.name});

}