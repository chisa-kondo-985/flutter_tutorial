import 'package:flutter_tutorial/user_model.dart';

enum SortOption {
  byIdAsc,
  byIdDesc,
  byNameAsc,
  byNameDesc,
  byUsernameAsc,
  byUsernameDesc;

  List<UserModel> sort(List<UserModel> userDataList) {
    List<UserModel> sortedList = userDataList;
    switch (this) {
      case SortOption.byIdAsc:
        sortedList.sort((a, b) => a.id.compareTo(b.id));
        break;
      case SortOption.byIdDesc:
        sortedList.sort((a, b) => b.id.compareTo(a.id));
        break;
      case SortOption.byNameAsc:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOption.byNameDesc:
        sortedList.sort((a, b) => b.name.compareTo(a.name));
        break;
      case SortOption.byUsernameAsc:
        sortedList.sort((a, b) => a.userName.compareTo(b.userName));
        break;
      case SortOption.byUsernameDesc:
        sortedList.sort((a, b) => b.userName.compareTo(a.userName));
        break;
    }
    return sortedList;
  }
}
