class myStack<T> {
  List<T>? _data;

  myStack() {
    _data = [];
  }

  bool get isEmpty => _data!.isEmpty;

  int get length => _data!.length;

  void push(T element) {
    _data!.add(element);
  }

  T pop() {
    if (isEmpty) {
      throw Exception("Stack is empty");
    }
    return _data!.removeLast();
  }

  T peek() {
    if (isEmpty) {
      throw Exception("Stack is empty");
    }
    return _data!.last;
  }

  void clear() {
    _data!.clear();
  }
}
