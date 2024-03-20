import 'package:flutter/material.dart';
import 'dart:math';

class ReactionProvider extends ChangeNotifier {
  int likeCounter = 0;
  int loveCounter = 0;
  int unlikeCounter = 0;

  void increaseLike() {
    likeCounter++;
    notifyListeners();
  }

  void increaseLove() {
    loveCounter += Random().nextInt(5); // 0..4
    notifyListeners();
  }

  void increaseUnlike() {
    unlikeCounter += Random().nextInt(20); // 0..19
    notifyListeners();
  }
}
