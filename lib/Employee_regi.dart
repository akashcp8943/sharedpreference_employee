import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  String gender= 'male';

  final formkey=GlobalKey<FormState>();
  var name=TextEditingController();
  var dob=TextEditingController();
  var phone=TextEditingController();
  var address=TextEditingController();
  var username=TextEditingController();
  var password=TextEditingController();
  var email=TextEditingController();

  String dropdownvalue = 'Sslc';
  var qualification = ['Sslc',
    'HigherSecondary',
        'UG',
        'PG'];
  String employmentstatus='employment';

  Future<void>registration_form()async{
    var register = await SharedPreferences.getInstance();
    register.setString("name", name.text);
    register.setString("dob", dob.text);
    register.setString("phone", phone.text);
    register.setString("address", address.text);
    register.setString("username", username.text);
    register.setString("password", password.text);
    register.setString("email", email.text);

    register1();
    register2();
    register3();
    register4();
    register5();
    register6();
    register7();
  }
  Future<void>register1()async{
    final register = await SharedPreferences.getInstance();
    var reg1 = register.getString("name");
    print(reg1);
  }
  Future<void>register2()async {
    final register = await SharedPreferences.getInstance();
    var reg2 = register.getString("dob");
    print(reg2);
  }
  Future<void>register3()async {
    final register = await SharedPreferences.getInstance();
    var reg3 = register.getString("phone");
    print(reg3);
  }
  Future<void>register4()async {
    final register = await SharedPreferences.getInstance();
    var reg4 = register.getString("address");
    print(reg4);
  }
  Future<void>register5()async {
    final register = await SharedPreferences.getInstance();
    var reg5 = register.getString("username");
    print(reg5);
  }
  Future<void>register6()async {
    final register = await SharedPreferences.getInstance();
    var reg6 = register.getString("password");
    print(reg6);
  }
  Future<void>register7()async {
    final register = await SharedPreferences.getInstance();
    var reg7 = register.getString("email");
    print(reg7);
  }


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Registration form",style: TextStyle(fontSize: 30),))),
      body: Form(
        child: ListView(
          children: [Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(validator:(value){
                  if(value==null||value.isEmpty){
                    return 'enter the name';
                  }
                  return null;
                },controller: name,
                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: ("name")),
                ),
              ),
             Padding(
               padding: const EdgeInsets.only(right: 900,top:10,bottom: 10),
               child: TextButton(onPressed: ()async{
                 var date= await showDatePicker(context: context,
                     initialDate: DateTime.now(),
                     firstDate: DateTime(2002-01-01),
                     lastDate: DateTime(2040-01-01));
                 if(date!=null){
                   print(DateFormat('dd-mm-yyyy').format(date));
                 }
               },
                   child: Text("Date of Birth")),
             ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator:  (value) {
                    RegExp regex =
                    RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                   if(value==0){
                   return 'please enter mobile number';}
                   else if(!regex.hasMatch(value!)){
                     return 'please enter valid number';
                   }
                   return null;
                  },
                  controller: phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: ("phone number")),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(validator: (value){
                  if(value==null||value.isEmpty){
                    return 'enter the address';
                  }
                  return null;
                },
                  controller: address,
                  decoration: InputDecoration(border: OutlineInputBorder(),labelText: ("address"),),
                  maxLines: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 850),
                child: Text("qualification"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 800),
                child: DropdownButton(value: dropdownvalue,
                    items: qualification.map((String qualification){
                      return DropdownMenuItem(value:qualification,
                          child: Text(qualification));
                    }).toList(),
                    onChanged: (String?newValue){
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator:  (value) {
                    RegExp regex =
                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?)(?=.*?[!@#\$&*~]).{15,}$');
                    if (value==null) {
                      return 'Please enter username';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid username';
                      } else {
                        return null;
                      }}},

                  controller: username,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: ("username")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator:  (value) {
                    RegExp regex =
                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value==null) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }}},
                  controller: password,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: ("Password")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:900,top: 7),
                child: Text("gender",style: TextStyle(fontSize:18)),
              ),
              RadioListTile(title:Text("male"),
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value){
                setState(() {gender=value.toString();
                });
                  },),
              RadioListTile(title: Text("female"),
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value){
                setState(() {gender=value.toString();
                });
                  }),
              RadioListTile(title: Text("other"),
                  value: 'other',
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {gender=value.toString();
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "The field is required";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid password ';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: ("Email")),
                ),
              ),
              RadioListTile(title: Text("Employee"),
                  value:"Employee",
                  groupValue: employmentstatus,
                  onChanged: (value){
                setState(() {
                  employmentstatus=value.toString();
                });
                  }),
              RadioListTile(title: Text("Unemployee"),
                  value:"Unemployee",
                  groupValue: employmentstatus,
                  onChanged: (value){
                    setState(() {
                      employmentstatus=value.toString();
                    });
                  }),
              RadioListTile(title: Text("part-time"),
                  value:"part-time",
                  groupValue: employmentstatus,
                  onChanged: (value){
                    setState(() {
                      employmentstatus=value.toString();
                    });
                  }),
              RadioListTile(title: Text("Other"),
                  value:"Other",
                  groupValue: employmentstatus,
                  onChanged: (value){
                    setState(() {
                      employmentstatus=value.toString();
                    });
                  }),
              ElevatedButton(onPressed: (){
                registration_form();
                }, child: Text("Submit"))
            ],
          ),]
        ),
      ),
    );
  }
}
