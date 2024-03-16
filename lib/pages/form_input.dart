import 'package:flutter/material.dart';
import 'package:quiz_4king/pages/home.dart';

class FormInput extends StatefulWidget {
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final TextEditingController _controller = TextEditingController();
  List<String> names = [];//เก็บชื่อคนที่ป้อนเข้ามา
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('หมวกคัดสรรเลือกบ้าน', style: TextStyle(color: Colors.white))),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/4king_backgroud.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/โลโก้.png', width: 200, height: 200),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('ป้อนจำนวนคน'),
                ],
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'ป้อนจำนวนคน',
                ),
                onChanged: (value) {
                  setState(() {
                    number = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('ป้อนชื่อ'),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: number,
                  itemBuilder: (context, index) {
                    return TextField(
                      onChanged: (value) {
                        setState(() {
                          if (names.length <= index) {
                            names.add(value);
                          } else {
                            names[index] = value;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'ป้อนชื่อคนที่ ${index + 1}',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home(names: names)),
                    );
                  },
                  child: Text('บันทึก', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

