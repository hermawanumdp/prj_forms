import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String result = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name;
  String? religion;
  String? education;
  String? gender;
  bool? isChecked = false;
  List<String> religionOptions = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Kong Hu Cu'
  ];
  List<String> educationOptions = ['SD', 'SMP', 'SMA', 'S1', 'S2', 'S3'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        result =
            'Name: $name\nGender: $gender\nReligion: $religion\nEducation: $education\nSetuju : $isChecked';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Agama',
                ),
                value: religion,
                items: religionOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    religion = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Pendidikan',
                ),
                value: education,
                items: educationOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    education = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                "Jenis Kelamin",
                style: TextStyle(fontSize: 12),
              ),
              RadioListTile(
                title: Text("Laki-Laki"),
                value: "Laki-Laki",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Perempuan"),
                value: "Perempuan",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  Text('Setuju'),
                ],
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
              SizedBox(height: 20.0),
              Text(
                result,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
