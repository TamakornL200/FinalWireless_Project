import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}
TextEditingController pillname_Controller = new TextEditingController();
TextEditingController pilldescription_Controller = new TextEditingController();
TextEditingController hourController = TextEditingController();
TextEditingController minuteController = TextEditingController();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pill reminder',
      //TODO 1:  Update Route Table HERE
      initialRoute: "/",

      routes:{
        // When n a vi g a ti n g t o the ” / ” r ou te ,
        // b uil d the F i r s t S c r e e n wid ge t .
        "/" : (context) => const FirstScreen(),
        // When n a vi g a ti n g t o the ” / sec ond ” r ou te ,
        // b uil d the Sec ondSc reen wid ge t .
        "/second" : (context) => const SecondScreen(),
        "/third" : (context) => const ThirdScreen(),

      },
    );
  }
}
//------------------------------------------------------------------------------------------------------------------------
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Pillbox reminder',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
               //child: MyStatefulWidget(),
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/lake.jpg'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 400,
            ),
            SizedBox(
              height: 10,
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");

              },
              child: const Text('Reminder setting'),
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third");

              },
              child: const Text('Add Pill Description'),
            ),
          ],
        ),
      ),
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: 'Repeat every hours?',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },

    );
  }
}

//-----------------------[SECOND SCREEN]---------------------------------------------------------------------------------------
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Reminder setting',
                style: TextStyle(fontSize: 40),
              ),

              SizedBox(
                  //child: MyStatefulWidget(),
              ),
              Text(
                'Time setting',
                style: TextStyle(fontSize: 20,color: Colors.blueAccent),
//child: MyStatefulWidget(),
              ),
              SizedBox(
                child: MyStatefulWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(11)),
                    child: Center(
                      child: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(11)),
                    child: Center(
                      child: TextField(
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create alarm',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    int hour;
                    int minutes;
                    hour = int.parse(hourController.text);
                    minutes = int.parse(minuteController.text);

                    // creating alarm after converting hour
                    // and minute into integer
                    FlutterAlarmClock.createAlarm(hour, minutes);
                  },
                ),
              ),
            ElevatedButton(
            onPressed: () {
              // show timers
              FlutterAlarmClock.showTimers();
            },
            child: Text(
              "Show Timers",
              style: TextStyle(fontSize: 17),
            ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  // TODO 3: Update code to return to FirstScreen Pop()
                  Navigator.pop(context);
                },
                child: const Text("Back to homepage"),
              ),
            ],
          )
      ),
    );
  }
}



//-----------------------[Third SCREEN]---------------------------------------------------------------------------------------
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Add pill description',
                style: TextStyle(fontSize: 40),
              ),
              TextFormField(
                controller: pillname_Controller,
                obscureText: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Your Pill Name is.....',
                ),
              ),
              TextFormField(
                controller: pilldescription_Controller,
                obscureText: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Your Pill descrption is....',

                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped.
                  // TODO 3: Update code to return to FirstScreen Pop()
                  Navigator.pop(context);
                },
                child: const Text("save and back to homepage"),
              ),
            ],
          )
      ),
    );
  }
}

/*
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Pillbox reminder',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Pillbox, reminder',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text('41'),
    ],
  ),
);



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],

    );
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'The motivation of project is based on the daily life, Sickness occur and need to be'
            'cure. For many people it is hard to memories the pill taken time which leads to forgot'
            'to taking he pill which can lead to danger sickness or lead to longer time for the body '
            'to be cured.' ,
        softWrap: true,
      ),
    );

    return MaterialApp(
      //title: 'Welcome to Flutter',
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          //title: const Text('Welcome to Flutter'),
          title: const Text('Flutter layout demo'),
        ),
        //body: const Center(
        //  child: Text('Hello World'),
        body: ListView(
          children: [
            Image.asset(
              'assets/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }


}//end

 */