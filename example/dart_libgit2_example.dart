import 'package:libgit2/libgit2.dart';

void main(List<String> args) {
  final v = LibGit2().version();
  print('version: $v');
}
