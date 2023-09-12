import 'dart:async';

class LikeBloc {
  int _likeCount = 0;

  final _likeController = StreamController<int>.broadcast();
  Stream<int> get likeStream => _likeController.stream;

  int get likeCount => _likeCount;

  void toggleLike() {
    _likeCount = _likeCount == 0 ? 1 : 0;
    _likeController.sink.add(_likeCount);
  }

  void dispose() {
    _likeController.close();
  }
}
