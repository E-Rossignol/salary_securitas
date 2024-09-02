import 'package:flutter/material.dart';
import 'package:salary_securitas/views/main_page.dart';

class HumantechPage extends StatefulWidget {
  const HumantechPage({Key? key}) : super(key: key);

  @override
  _HumantechPageState createState() => _HumantechPageState();
}

class _HumantechPageState extends State<HumantechPage> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;

  void _calculate() {
    double? inputValue = double.tryParse(_controller.text);
    if (inputValue != null) {
      setState(() {
        _result = (inputValue * 21.30240963855421).roundToDouble();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Humantech Page'),
        leading: IconButton(
          icon: const Icon(Icons.home_outlined),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
          })
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Center(child: const Text('Enter your Humantech Hours')),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
            Text('Humantech Salary: $_result'),
          ],
        ),
      ),
    );
  }
}