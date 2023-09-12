import 'dart:async';

class NumberBloc {
int _currentNumber = 0;

  final StreamController<String?> _controller = StreamController<String?>(); // Đặt kiểu dữ liệu cho StreamController

  StreamSink<String?> get sink => _controller.sink;
  Stream<String?> get stream => _controller.stream;

  void onTextFileChanged(String text) {
    try {
      if (!_controller.isClosed) { // Kiểm tra trạng thái trước khi gọi add
        if (text.isEmpty) {
          sink.add(null);
        } else {
          int number = int.parse(text);
          if (number % 2 == 0) {
            sink.add('Số chẵn');
          } else {
            sink.add('Số lẻ');
          }
        }
      }
    } catch (e) {
      if (!_controller.isClosed) { // Kiểm tra trạng thái trước khi gọi addError
        sink.addError('Dữ liệu nhập không hợp lệ');
      }
    }
  }

  void counter(int number) {
    _currentNumber++;
    sink.add(_currentNumber.toString());
  }

  void dispose() {
    if (!_controller.isClosed) { // Kiểm tra trạng thái trước khi đóng
      _controller.close();
      
    }
  }
}
