import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController dateInput = TextEditingController();
  String? _timeString;

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
    // Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 0), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('yyyy-MM-dd \n   h:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "احسب عمرك ",
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            children: [Icon(Icons.delete_forever)],
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.all(5)),
            Text("🕖  تاريخ اليوم "),
            SizedBox(height: 10),
            Container(
                width: 350,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _timeString.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
            SizedBox(height: 10),
            Text("أدخل تاريخ ميلادك"),
            TextField(
              style: TextStyle(height: 0.1),
              textAlign: TextAlign.center,
              controller: dateInput,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: " تاريخ ميلادك "),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2050));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            SizedBox(height: 10),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 95, 166, 144),
                    borderRadius: BorderRadius.circular(10)),
                width: 350,
                height: 40,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.calculate),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "احسب العمر",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ])),
            SizedBox(
              height: 10,
            ),
            Text(" العمر الكلي"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("السنوات"),
                        Text("الاشهر"),
                        Text("الايام"),
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('--'),
                        Text("--"),
                        Text("--"),
                      ]),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text("🎈 يوم الميلاد القادم"),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ايام "),
                        Text("اشهر"),
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("--"),
                        Text("--"),
                      ]),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text("مجموع الحياه "),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 150,
              color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("مجموع السنوات "),
                        Text("------"),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("مجموع الاشهر "),
                        Text("------"),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("مجموع الاسابيع "),
                        Text("------"),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("مجموع الايام "),
                        Text("------"),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("مجموع الساعات "),
                        Text("------"),
                      ]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
