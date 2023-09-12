import 'package:flutter/material.dart';
import 'package:luyencode/chanle/checkumber.dart';




class MyText extends StatefulWidget {
  const MyText({super.key});

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  
    final NumberBloc _numberBloc = NumberBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              onChanged: (text) {
                _numberBloc.onTextFileChanged(text); // Truyền giá trị từ TextField vào hàm
              },
            ),
            TextField(
              onChanged: (text) {
                _numberBloc.onTextFileChanged(text); // Truyền giá trị từ TextField vào hàm
              },
            ),
            StreamBuilder<String?>(
                stream: _numberBloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  if (snapshot.hasData) {
                    return Text(snapshot.data ?? '');
                  } else {
                    return const Text('Ban chua nhap gi');
                  }
                }),
                TextButton(
                  onPressed: (){
                    _numberBloc.counter(0);
                  }, 
                child: const Icon(Icons.add),
                ),
               
          ],
        ),
      ),
    );
  }
}

