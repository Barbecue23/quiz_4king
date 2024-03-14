import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> names;

  Home({required this.names});

  @override
  Widget build(BuildContext context) {
    // แบ่งชื่อออกเป็น 4 กลุ่ม
    List<List<String>> dividedNames = _divideNames(names, 4);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text('ข้อมูลที่รับมา:'),
              SizedBox(height: 10),
              // แสดงชื่อแต่ละบ้าน
              Column(
                children: dividedNames.asMap().entries.map((entry) {
                  int houseIndex = entry.key + 1;
                  List<String> houseNames = entry.value;
                  String houseName = '';
                  switch (houseIndex) {
                    case 1:
                      houseName = 'ประชาชื่น';
                      break;
                    case 2:
                      houseName = 'อินทร';
                      break;
                    case 3:
                      houseName = 'กนกอาชีวะ';
                      break;
                    case 4:
                      houseName = 'บูรณพล';
                      break;
                    default:
                      houseName = 'บ้านที่ $houseIndex';
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(houseName),
                          SizedBox(width: 10),
                          Icon(Icons.home),
                        ],
                      ),
                      Card(
                        child: Column(
                          children: houseNames.map((name) {
                            return ListTile(
                              title: Text(name),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // เมทอดสำหรับแบ่ง List ออกเป็นกลุ่มๆ
  List<List<String>> _divideNames(List<String> names, int numOfGroups) {
    List<List<String>> dividedList = [];
    int numOfNamesInGroup = (names.length / numOfGroups).ceil();
    int start = 0;

    for (int i = 0; i < numOfGroups; i++) {
      int end = start + numOfNamesInGroup;
      if (end > names.length) {
        end = names.length;
      }
      dividedList.add(names.sublist(start, end));
      start = end;
    }

    return dividedList;
  }
}
