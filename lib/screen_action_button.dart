import 'package:flutter/material.dart';

import 'search_bloc.dart';

class ScreenActionButton extends StatefulWidget {
  const ScreenActionButton({super.key});

  @override
  State<ScreenActionButton> createState() => _ScreenActionButtonState();
}

class _ScreenActionButtonState extends State<ScreenActionButton> {
  final TextEditingController _textController = TextEditingController();

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
              // height: 180,
              // width: 380,
              // color: Colors.grey,
              margin: const EdgeInsets.only(top: 200, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('${_likeBloc.likeCount}k'),
                      ),
                      const Text('200 comments'),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      const Text('129 shares'),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      const Text('980 views'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            TextButton(
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
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          TextButton(
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
                        ],
                      ),
                      Stack(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.share_outlined,
                                ),
                                Text(
                                  'Shares',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text(
                                  'Views',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Enter text',
                      hintText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
