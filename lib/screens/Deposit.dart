import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  static const id='Deposit_screen';

  const Deposit({Key? key}) : super(key: key);

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  String bankaccount='',ifsc='',paymentmode='';
  double amount=0;
  double balance=0.0;
  String url = "https://revpay-smrv.onrender.com/deposit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(

          children: <Widget>[
            Flexible(
              child: Hero(tag:'logo', child: Container(
                height: 200.0,
                child: Image.asset('image/rev.png'),
              ),
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                bankaccount=value;
                //Do something with the user input.
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
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                ifsc=value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your ifsc',
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
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                amount=double.tryParse(value)!;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter the amount in Rs.',
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
                height: 10,
              ),
              DropdownButton <String> (items: [
                DropdownMenuItem(
                  child: Text('Debit'),
                  value: 'debit',
                ),
                DropdownMenuItem(
                  child: Text('Credit'),
                  value: 'credit',
                ),
              ], onChanged: (value){
                setState(() {
                  paymentmode = value.toString();
                });
              }),
              SizedBox(
                height: 10.0,
              ),
            Padding(padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async{
                      //when button is pressed spinner is started
                      setState(() {

                      });

                      try {
                        // Prepare request body
                        Map<String, dynamic> requestBody = {
                          'bankaccount': bankaccount,
                          'ifsc': ifsc,
                          'paymentmode': paymentmode,
                          'amount': amount,
                        };
                        print(requestBody);
                        // Send POST request with credentials
                        final response = await http.post(
                            Uri.parse(url),
                            body: json.encode(requestBody)
                        );

                        if (response.statusCode == 200) {
                          var responseData = json.decode(response.body);
                          setState(() {
                            balance = (responseData['currentbalance'] as num).toDouble();

                          });
                          print('Withdrawn amount: ${responseData['currentbalance']}');
                        }

                        print(response.body);
                        // Navigator.pushNamed(context, Payment.id);
                      }
                      catch(e)
                      {
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Deposit',
                    ),
                  ),
                )
            ),
            Row(
              children: <Widget>[
                Text("Curren Balance in Rs : "),
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
