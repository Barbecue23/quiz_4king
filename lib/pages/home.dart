import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> names;

  Home({required this.names});

  @override
  Widget build(BuildContext context) {
    List<List<String>> dividedNames = _divideNames(names, 4);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroud.png'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ประชาชื่น.png', width: 100, height: 100),
                    SizedBox(width: 10),
                    Image.asset('assets/images/อินทร.png', width: 100, height: 100),
                    SizedBox(width: 10),
                    Image.asset('assets/images/กนก.png', width: 100, height: 100),
                    SizedBox(width: 10),
                    Image.asset('assets/images/บุรณพนธ์.png', width: 100, height: 100),
                  ],
                ),
                SizedBox(height: 20),
                Text('แบ่งได้บ้านดังนี้:'),
                SizedBox(height: 10),
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
                        houseName = 'บุรณพนธ์';
                        break;
                      default:
                        houseName = 'บ้านที่ $houseIndex';
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.home),
                            SizedBox(width: 10),
                            Text(houseName),
                          ],
                        ),
                        Card(
                          color: Colors.red[400],
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
      ),
    );
  }

  List<List<String>> _divideNames(List<String> names, int numOfGroups) {
    List<List<String>> dividedList = [];
    int numOfNamesInGroup = (names.length / numOfGroups).ceil();
    int numOfNamesInGroup2 = (names.length / numOfGroups).floor();
    if (names.length == 5 || names.length == 6) {
      numOfNamesInGroup = numOfNamesInGroup2;
    }
    int start = 0;

    for (int i = 0; i < numOfGroups; i++) {
      int end = start + numOfNamesInGroup;
      if (end > names.length) {
        end = names.length;
      }
      dividedList.add(names.sublist(start, end));
      start = end;
    }

    if (names.length == 5) {
      dividedList[0].add(names[4]);
    } else if (names.length == 6) {
      dividedList[0].add(names[4]);
      dividedList[1].add(names[5]);
    }
    return dividedList;
  }
}
