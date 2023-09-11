import 'package:flutter/material.dart';
import 'search_bloc.dart';

class ScreenActionButton extends StatefulWidget {
  const ScreenActionButton({super.key});

  @override
  State<ScreenActionButton> createState() => _ScreenActionButtonState();
}

class _ScreenActionButtonState extends State<ScreenActionButton> {
  final _likeBloc = LikeBloc();
  int likeCount = 0;

  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (likeCount == 0) {
        likeCount = 1;
      } else {
        likeCount = 0;
      }
    });
  }

  @override
  void dispose() {
    _likeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _likeBloc.likeStream,
          initialData: _likeBloc.likeCount,
          builder: (context, snapshot) {
            final isLikedFromStream = (snapshot.data ?? 0) == 1;
            return Container(
              margin: const EdgeInsets.only(top: 400, right: 100),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_likeBloc.likeCount}k',
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.blue,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 25),
                            child: TextButton(
                              onPressed: () {
                                _likeBloc.toggleLike();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    color: isLikedFromStream
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                  Text(
                                    'Like',
                                    style: TextStyle(
                                      color: _likeBloc.likeCount == 1
                                          ? Colors.blue
                                          : Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'k',
                      ),
                      const Divider(
                        color: Colors.blue,
                      ),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.transparent,
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 25),
                              child: TextButton(
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.message_outlined,
                                    ),
                                    Text(
                                      'Comments',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
