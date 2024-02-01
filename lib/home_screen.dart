import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberOne = TextEditingController();
  final TextEditingController _numberTwo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberOne,
                validator: (String? text) {
                  String v = text ?? "";
                  if (v.isEmpty) {
                    return "Enter Number 1";
                    ///invalid
                  }
                  return null;
                  ///valid
                },
                decoration: const InputDecoration(
                  hintText: "Enter Number 1",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberTwo,
                validator: (String? value){
                  String v= value ?? "";
                  if(v.isEmpty){
                    return "Enter Number 2";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Number 2",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          double num1= double.tryParse(_numberOne.text.trim())?? 0;
                          double num2= double.tryParse(_numberTwo.text.trim())?? 0;
                          double addition= add(num1, num2);
                          _result= addition;
                          setState(() {});
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          double num1= double.tryParse(_numberOne.text.trim())?? 0;
                          double num2= double.tryParse(_numberTwo.text.trim())?? 0;
                          double subtract= sub(num1, num2);
                          _result= subtract;
                          setState(() {});
                        }
                      },
                      child: const Text("Sub"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          double num1= double.tryParse(_numberOne.text.trim())?? 0;
                          double num2= double.tryParse(_numberTwo.text.trim())?? 0;
                          double multiply= mul(num1, num2);
                          _result= multiply;
                          setState(() {});
                        }
                      },
                      child: const Text("Mul"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          double num1= double.tryParse(_numberOne.text.trim())?? 0;
                          double num2= double.tryParse(_numberTwo.text.trim())?? 0;
                          double divide= div(num1, num2);
                          _result= divide;
                          setState(() {});
                        }
                      },
                      child: const Text("Divide"),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  clear();
                }, child: const Text("Clear"),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Result= $_result",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///Method for addition
  double add(double num1, double num2) {
    return num1 + num2;
  }

  ///method for subtraction
  double sub(double num1, double num2) {
    return num1 - num2;
  }

  ///method for multiply
  double mul(double num1, double num2) {
    return num1 * num2;
  }

  ///method for divide
  double div(double num1, double num2) {
    return num1 / num2;
  }

  ///method for clearAll
  void clear() {
    _numberOne.clear();
    _numberTwo.clear();
    _result = 0;
    setState(() {});
  }
}
