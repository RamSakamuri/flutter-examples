import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final _formKey = GlobalKey<FormState>();



  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void _calculateBMI() {
    print("CalcuateBMI got invoked ");
    //Resourse 1: https://www.bcbst.com/providers/MPMTools/BMICalculator.shtm
    //Resource 2:  http://www.epic4health.com/bmiformula.html

//
//    BMI	Weight Status
//    Below 18.5	Underweight
//    18.5 – 24.9	Normal
//    25.0 – 29.9	Overweight
//    30.0 and Above	Obese

    setState(() {
      int age =
      _ageController.text.isNotEmpty ? int.parse(_ageController.text) : 0;

      double height = _heightController.text.isNotEmpty
          ? double.parse(_heightController.text)
          : 0.0;
      inches = height * 12;

      double weight = _weightController.text.isNotEmpty
          ? double.parse(_weightController.text)
          : 0.0;

      if ((age > 0) && ((inches > 0) && (weight > 0))) {
        result = weight / (inches * inches) * 703; // our BMI

        double bmiRounded = double.parse(result.toStringAsFixed(1));

        //Do the reading
        if (bmiRounded < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);
        } else if (bmiRounded >= 18.5 && result < 25) {
          _resultReading = "Normal!";
          print(_resultReading);
        } else if (bmiRounded >= 25.0 && result < 30) {
          _resultReading = "Overweight";
        } else if (bmiRounded >= 30.0) {
          _resultReading = "Obese";
        }
      } else {
        result = 0.0;
        _resultReading = "";
        print("result $result");
      }
    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Form(
        key: _formKey,
        //alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              '/images/bmilogo.png',
              height: 185.0,
              width: 175.0,
              color: Colors.limeAccent,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 315.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  renderAgeTextField(),
                  renderHeightTextField(),
                  renderWeightTextField(),
                  new Padding(padding: new EdgeInsets.all(10.6)),
                  renderCalculateButton(),
                ],
              ),
            ),
            renderBMI(),
          ],
        ),
      ),
    );
  }

  Widget renderAgeTextField() {
    return TextFormField(
      controller: _ageController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter age";
        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      decoration: new InputDecoration(
          labelText: 'Age',
          hintText: 'e.g: 34',
          icon: new Icon(Icons.person_outline)),
    );
  }

  Widget renderHeightTextField() {
    return new TextFormField(
        controller: _heightController,
        enabled: true,
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter Height in feet";
          }
        },
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            labelText: 'Height in feet',
            hintText: 'e.g 6.5',
            icon: new Icon(Icons.insert_chart)));
  }

  Widget renderWeightTextField() {
    return new TextFormField(
        controller: _weightController,
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter Weight in lbs";
          }
        },
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
            labelText: 'Weight in lbs',
            hintText: 'e.g 180',
            icon: new Icon(Icons.line_weight)));
  }

  Widget renderCalculateButton() {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _calculateBMI();
          } else {
            print("invalid form state encountered ");
            setState(() {
              _finalResult = "";
              _resultReading = "";
            });
          }
        },
        color: Colors.pinkAccent,
        child: Text('Calculate'),
        textColor: Colors.white,
      ),
    );
  }

  Widget renderBMI() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "$_finalResult ",
          style: new TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 19.9),
        ),
        new Padding(padding: const EdgeInsets.all(5.0)),
        new Text(
          "$_resultReading ",
          style: new TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 19.9),
        )
      ],
    );
  }
}