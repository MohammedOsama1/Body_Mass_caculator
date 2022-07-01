import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.isMale, required this.result, required this.age})
      : super(key: key);

  final bool isMale;
  final double result;
  final int age;

  String get resultTxt {
    String resultText = ' ';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'over-Weight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI', style: Theme.of(context).textTheme.bodyText1),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            textState('Gender : ${isMale ? 'Male' : 'Female'}', context),
            textState('Result : ${result.round()}', context),
            textState('Health-Case : $resultTxt', context),
            textState('Age : $age', context)
          ],
        ),
      )),
    );
  }
}

Widget textState(String txt, context) {
  return Text(txt, style: Theme.of(context).textTheme.bodyText1);
}
