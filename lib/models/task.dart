class Task {
  String name;
  bool ischeck;
  Task({required this.name, this.ischeck = false});

  void chandeStatu() {
    ischeck = !ischeck;
  }
}
