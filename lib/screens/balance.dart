import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  static const id = 'Balance_screen';

  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  String bankaccount = '', ifsc = '';
  double balance = 0;
  String url = "https://revpay-smrv.onrender.com/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Balance'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          children: <Widget>[
            Hero(tag:'logo', child: Container(
              height: 200.0,
              child: Image.asset('image/rev.png'),
            ),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (value) {
                bankaccount = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your account no.',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onChanged: (value) {
                ifsc = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your IFSC',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {});

                      try {
                        Map<String, dynamic> requestBody = {
                          'bankaccount': bankaccount,
                          'ifsc': ifsc,
                        };

                        final response = await http.post(
                          Uri.parse(url),
                          headers: {"Content-Type": "application/json"},
                          body: json.encode(requestBody),
                        );

                        if (response.statusCode == 200) {
                          var responseData = json.decode(response.body);
                          setState(() {
                            balance = (responseData['balance'] as num).toDouble();
                          });
                          print('Current balance: ${responseData['balance']}');
                        }

                        print(response.body);
                      } catch (e) {
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Get Balance',
                    ),
                  ),
                )),
            Row(
              children: <Widget>[
                Text("Current Balance in Rs: "),
                Container(
                  child: Text('$balance'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
