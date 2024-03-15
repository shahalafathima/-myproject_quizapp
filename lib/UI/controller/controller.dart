import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:miniproject/UI/models/m.dart';
import 'package:miniproject/UI/score/score.dart';
class queController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  Animation<double> get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List data = [];

  getData()async{
    var ref = await FirebaseFirestore.instance.collection("questions").get();
    return ref.docs;
  }

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index']),
  )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswer = false;
  bool get isAnswer => _isAnswer;
  set isAnswer(bool value) {
    _isAnswer = value;
    update();
  }

  late int _correctanser;
  int get correctanswer => _correctanser;
  set correctanswer(int value) {
    _correctanser = value;
    update();
  }

  late int _selectedans;
  int get selectedans => this._selectedans;

  RxInt _Questionsnumber = 1.obs;
  RxInt get Questionnumber => this._Questionsnumber;

  late int _numbofcorrect;
  int get numberofcorrect => this._numbofcorrect;

  queController() {
    _correctanser = 0;
  }

  @override
  void onInit({int durationSeconds = 10}) {
    _animationController =
        AnimationController(duration: Duration(seconds: durationSeconds), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextquestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    isAnswer = true;
    correctanswer = question.answer;
    _selectedans = selectedIndex;
    if (_correctanser == _selectedans) _numbofcorrect++;
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextquestion();
    });
  }

  void nextquestion() {
     if (_Questionsnumber.value != questions.length) {
      _isAnswer = false;

      _pageController.nextPage(duration: Duration(microseconds: 150), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextquestion);
    }
    else{
      Get.to(Scoree());
    }
  }

  void updatetheNumber(int index) {
    _Questionsnumber.value += 1;
  }
  void addQuestion(String text, List<String> list, int parse) {}
}

