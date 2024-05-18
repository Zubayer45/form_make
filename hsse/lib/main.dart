// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.grey,
      home: const HsseForm(),
    );
  }
}

class HsseForm extends StatefulWidget {
  const HsseForm({Key? key}) : super(key: key);

  @override
  State<HsseForm> createState() => _HsseFormState();
}

class _HsseFormState extends State<HsseForm> {
  bool _furtherActionRequired = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _siteNameController = TextEditingController();

  int? _selectedCheckbox;
  // int? _selectedDate;
  // TextEditingController datePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            // Add functionality to navigate back
          },
        ),
        title: const Text(
          'HSSE FORM',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ), // Changed the title here
        actions: [
          Text(
            'Online',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // Add functionality for online save
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HSSE FORM ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_upward_rounded)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Site Name"),
                      Text(':'),
                      Text('KBSRssDDF'),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Location "),
                      Text(':'),
                      Text('3 block no d \nroad-5'),
                    ],
                  ),

                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location Details"),
                    ],
                  ),
                  Divider(),

                  SizedBox(height: 10), // added SizedBox
                  Container(
                    color: Colors.white,
                    // Wrapped TextFormField with Container
                    height: 50, // Set a fixed height
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter data',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.edit),
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Type of observation',
                    textAlign: TextAlign.start,
                  ),
                  Divider(),
                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        title: Text('Unsafe condition'),
                        value: _selectedCheckbox == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedCheckbox = value! ? 1 : null;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CheckboxListTile(
                        title: Text('Unsafe Act'),
                        value: _selectedCheckbox == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedCheckbox = value! ? 2 : null;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CheckboxListTile(
                        title: Text('Near Miss'),
                        value: _selectedCheckbox == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedCheckbox = value! ? 3 : null;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CheckboxListTile(
                        title: Text('Accident'),
                        value: _selectedCheckbox == 4,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedCheckbox = value! ? 4 : null;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CheckboxListTile(
                        title: Text('No observation'),
                        value: _selectedCheckbox == 5,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedCheckbox = value! ? 5 : null;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Descrive your ovservation'),
                  Divider(),
                  Container(
                    color: Colors.white,
                    // Wrapped TextFormField with Container
                    height: 100, // Set a fixed height
                    child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: 'Enter data',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.edit),
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Did you take anyaction to remediate the hezard'),
                  Divider(),
                  ListTile(
                    // title: Text(
                    //   'Further Action Required?',
                    //   style: TextStyle(fontSize: 18, color: Colors.black),
                    // ),
                    subtitle: Row(
                      children: <Widget>[
                        Radio(
                          value: true,
                          groupValue: _furtherActionRequired,
                          onChanged: (bool? value) {
                            setState(() {
                              _furtherActionRequired = value ?? false;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        Text(
                          'YES',
                          // style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Radio(
                          value: false,
                          groupValue: _furtherActionRequired,
                          onChanged: (bool? value) {
                            setState(() {
                              _furtherActionRequired = value ?? false;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        Text(
                          'NO',
                          // style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Text('Urgency of situation'),
                  Divider(),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: Text(
                            'Low',
                            style: TextStyle(color: Colors.green),
                          ),
                          value: _selectedCheckbox == 1,
                          onChanged: (bool? value) {
                            setState(() {
                              _selectedCheckbox = value! ? 1 : null;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text('Medium',
                              style: TextStyle(color: Colors.red[200])),
                          value: _selectedCheckbox == 2,
                          onChanged: (bool? value) {
                            setState(() {
                              _selectedCheckbox = value! ? 2 : null;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        CheckboxListTile(
                          title:
                              Text('High', style: TextStyle(color: Colors.red)),
                          value: _selectedCheckbox == 3,
                          onChanged: (bool? value) {
                            setState(() {
                              _selectedCheckbox = value! ? 3 : null;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Who should this be repoted to "),
                    ],
                  ),
                  Divider(),

                  SizedBox(height: 10), // added SizedBox
                  Container(
                    color: Colors.white,
                    // Wrapped TextFormField with Container
                    height: 50, // Set a fixed height
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter data',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.edit),
                          fillColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Further action to be required? "),
                  Divider(),
                  ListTile(
                    // title: Text(
                    //   'Further Action Required?',
                    //   style: TextStyle(fontSize: 18, color: Colors.black),
                    // ),
                    subtitle: Row(
                      children: <Widget>[
                        Radio(
                          value: true,
                          groupValue: _furtherActionRequired,
                          onChanged: (bool? value) {
                            setState(() {
                              _furtherActionRequired = value ?? false;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        Text(
                          'YES',
                          // style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Radio(
                          value: false,
                          groupValue: _furtherActionRequired,
                          onChanged: (bool? value) {
                            setState(() {
                              _furtherActionRequired = value ?? false;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        Text(
                          'NO',
                          // style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name "),
                      Text(':'),
                      Text('KSJFHF'),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Employee ID "),
                      Text(':'),
                      Text('95104001005'),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Contact No"),
                      Text(':'),
                      Text('017873477453'),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date of time "),
                      Text(':'),
                      // TextField(
                      //   controller: datePicker,
                      // ),

                      // Text('Select Date: ${_selectedDate.Year}-${_selectedDate.month}-${_selectedDate.day}',),
                    ],
                  ),
                  Divider(),
                  Text('Pictures'),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
//Picture
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Unsafe Condition'),
                      Text('ppe Pic'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(Icons.image_outlined),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(Icons.image_outlined),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

/////////////Button
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
