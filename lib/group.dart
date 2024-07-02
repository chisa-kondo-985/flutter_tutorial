import 'member.dart';

class Group {
  String groupName;
  String groupImage;
  int yearFormed;
  List<Member> members;

  Group({required this.groupName, required this.groupImage, required this.yearFormed, required this.members});
}
