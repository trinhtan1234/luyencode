import 'package:flutter/material.dart';
import 'search_bloc.dart';

class ScreenActionButton extends StatefulWidget {
  const ScreenActionButton({super.key});

  @override
  State<ScreenActionButton> createState() => _ScreenActionButtonState();
}

class _ScreenActionButtonState extends State<ScreenActionButton> {
final LikBloc _likBloc = LikBloc();
int likeCount = 0;


  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (likeCount ==0) {
        likeCount = 1;
      } else {
        likeCount = 0;
      }
    });
  }

@override
void dispose(){
  _likBloc.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          IconButton(
            onPressed: toggleLike,
            icon: Icon(
              Icons.thumb_up,
              color: isLiked ? Colors.blue : Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10),
            child: TextButton(
              onPressed: toggleLike,
              child: Text(
                'Like',
                style: TextStyle(
                    color: isLiked ? Colors.blue : Colors.black, fontSize: 16),
              ),
            ),
          ),
        ]
          )
        
      ),
    );
  }
}
