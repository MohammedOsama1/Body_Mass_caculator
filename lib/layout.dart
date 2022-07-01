import 'dart:math';
import 'package:body_mass_calculator/result.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  bool isMale = false;
  int height = 100;
  int age = 20;
  int weight = 50;
  double getResult() {
    var result = (weight / pow(height / 100, 2));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI', style: Theme.of(context).textTheme.bodyText1),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: screenPart1(
                              icon: Icons.male,
                              txt: 'Male',
                              color: isMale ? Colors.teal : Colors.blueGrey)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: screenPart1(
                              icon: Icons.female,
                              txt: 'Female',
                              color: isMale ? Colors.blueGrey : Colors.teal)),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Height',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          ' CM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Slider(
                        min: 12,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        })
                  ],
                ),
              ),
              Row(
                children: [
                  screenPart2(txt: 'Weight', type: '$weight'),
                  screenPart2(txt: 'Age', type: '$age')
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 15,
                child: TextButton(
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                isMale: isMale,
                                result: getResult(),
                                age: age)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget screenPart1(
      {required IconData icon, required String txt, required Color color}) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.2,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 90,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            txt,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget screenPart2({required String txt, required String type}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                txt,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.bodyText2!,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.small(
                    onPressed: () {
                      setState(() => txt == 'Age' ? age++ : weight++);
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      setState(() => txt == 'Age' ? age-- : weight--);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.minimize,
                          size: 25,
                        ),
                        Spacer()
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
