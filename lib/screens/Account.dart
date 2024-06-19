import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  static const id = 'Account_screen';

  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String username = '', bankaccount = '', ifsc = '', status = 'ACTIVE';
  bool allowcredit = true, allowdebit = true;
  String url = "https://revpay-smrv.onrender.com/account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 215.0,
                  child: Image.asset('image/rev.png'),
                ),
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                username = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your username',
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
              height: 5.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
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
              height: 5.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                ifsc = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your IFSC code',
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
              height: 5.0,
            ),
            DropdownButton<String>(
              value: status,
              items: [
                DropdownMenuItem(
                  child: Text('Active'),
                  value: 'ACTIVE',
                ),
                DropdownMenuItem(
                  child: Text('Inactive'),
                  value: 'INACTIVE',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  if(value==null)
                    {
                      status='ACTIVE';
                    }
                  else
                  status = value;
                });
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            DropdownButton<String>(
              value: allowdebit.toString(),
              items: [
                DropdownMenuItem(
                  child: Text('Debit allowed'),
                  value: 'true',
                ),
                DropdownMenuItem(
                  child: Text('Debit Not allowed'),
                  value: 'false',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  allowdebit = value == 'true';
                });
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            DropdownButton<String>(
              value: allowcredit.toString(),
              items: [
                DropdownMenuItem(
                  child: Text('Credit allowed'),
                  value: 'true',
                ),
                DropdownMenuItem(
                  child: Text('Credit Not allowed'),
                  value: 'false',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  allowcredit = value == 'true';
                });
              },
            ),
            SizedBox(
              height: 2.0,
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
                      // Prepare request body
                      Map<String, dynamic> requestBody = {
                        'username': username,
                        'bankaccount': bankaccount,
                        'ifsc': ifsc,
                        'status': status,
                        'allowcredit': allowcredit,
                        'allowdebit': allowdebit,
                      };
                      print(requestBody);
                      // Send POST request with credentials
                      final response = await http.post(
                        Uri.parse(url),
                        body: json.encode(requestBody),
                      );

                      if (response.statusCode == 200) {
                        var responseData = json.decode(response.body);
                        setState(() {
                          // Update state with response data if needed
                        });
                        print('Response: ${responseData}');
                      }

                      print(response.body);
                    } catch (e) {
                      print(e);
                    }
                  },
                  minWidth: 200.0,
                  height: 10.0,
                  child: Text(
                    'Create',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
