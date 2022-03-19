import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'libgit2_generated_bindings.dart';

class LibGit2 {
  String libPath;
  LibGit2([this.libPath = '/usr/lib/x86_64-linux-gnu/libgit2.so']);

  String version() {
    final git2 = libgit2(DynamicLibrary.open(libPath));

    final majorPtr = calloc<Int32>();
    final minorPtr = calloc<Int32>();
    final revPtr = calloc<Int32>();

    final result = git2.git_libgit2_version(majorPtr, minorPtr, revPtr);
    if (result != 0) {
      throw Exception('failed gettin libgit2 version');
    } else {
      return '${majorPtr.value}.${minorPtr.value}.${revPtr.value}.';
    }
  }
}
