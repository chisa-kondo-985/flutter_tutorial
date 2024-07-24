enum BreakfastMain {
  bread,
  rice,
  noodle,
  potato,
  none;

  String get description {
    switch (this) {
      case BreakfastMain.bread:
        return 'パン派';
      case BreakfastMain.rice:
        return 'ご飯派';
      case BreakfastMain.noodle:
        return '麺派';
      case BreakfastMain.potato:
        return '芋派';
      case BreakfastMain.none:
        return '食べない派';
    }
  }

  String get link {
    switch (this) {
      case BreakfastMain.bread:
        return 'https://jsonplaceholder.typicode.com/posts';
      case BreakfastMain.rice:
        return 'https://jsonplaceholder.typicode.com/comments';
      case BreakfastMain.noodle:
        return 'https://jsonplaceholder.typicode.com/albums';
      case BreakfastMain.potato:
        return 'https://jsonplaceholder.typicode.com/todos';
      case BreakfastMain.none:
        return 'https://jsonplaceholder.typicode.com/users';
    }
  }
}
