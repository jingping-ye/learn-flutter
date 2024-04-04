// 负责抽题和组成
import 'dart:math';
import 'package:quizzler/poem_lib.dart';

class CompQuestion {
  String title = ''; // 标题
  String author = ''; // 作者
  String contentText = ''; // 内容：纯文本形式
  List<String> contentList = []; // 内容：形成数组的内容
  List<String> cleanContentList = []; // 内容：经过处理过的干净内容
  int hideIndex = 0; // 要隐藏内容项
  String answer = ''; // 答案
  List<String> choose = []; // 可供选择项
  CompQuestion(
      {required this.title,
      required this.author,
      required this.contentText,
      required this.contentList,
      required this.cleanContentList,
      required this.hideIndex,
      required this.answer,
      required this.choose});
}

class QuestionBrain {
  int questionNumByRound = 10; // 一回合抽取诗词数量
  Set<int> extractPoemIndexSet = {}; // 已经抽取的题目索引集合
  Map currentPoem = {}; // 当前抽取的诗词
  List<String> allPoemItems = []; // 所有诗词条目
  int extractCount = 0; // 抽题次数；

  QuestionBrain({int? questionNumByRound}) {
    if (questionNumByRound != null) {
      this.questionNumByRound = questionNumByRound;
    }

    // 获取所有诗词条
    getAllPoemItems();
  }

  // 重置回合
  resetRound() {
    extractPoemIndexSet = {};
    extractCount = 0;
  }

  // 去除空格，去除末尾[，。]的诗词条
  String getCleanPoemItem(String poemItem) {
    String clearnPoemItem = poemItem.replaceAll(RegExp(r'。|，|\s'), '');
    return clearnPoemItem;
  }

  getAllPoemItems() {
    for (var poem in poemLib) {
      String poemContent = poem['content']!;
      List<String> poemContentList = poemContent.split('\\n');
      for (int i = 0; i < poemContentList.length; i++) {
        poemContentList[i] = getCleanPoemItem(poemContentList[i]);
      }
      allPoemItems.addAll(poemContentList);
    }
  }

  // 抽取一首诗
  void extractPeom() {
    extractCount++;
    if (!isEnd()) {
      int questionIndex = Random().nextInt(poemLib.length);
      while (extractPoemIndexSet.contains(questionIndex)) {
        questionIndex = Random().nextInt(poemLib.length);
      }
      extractPoemIndexSet.add(questionIndex);
      currentPoem = poemLib[questionIndex];
    }
  }

  // 组成问题+选项+答案
  CompQuestion getCompoQuestion() {
    extractPeom();
    List<String> contentList = currentPoem['content'].split('\\n');
    int contentLength = contentList.length;

    List<String> cleanContentList = [];
    for (int i = 0; i < contentLength; i++) {
      cleanContentList.add(getCleanPoemItem(contentList[i]));
    }

    int hideLineIndex = Random().nextInt(contentLength); // 随机抽取一行隐藏

    String answer = cleanContentList[hideLineIndex]; // 答案

    List<String> chooseList = formChoose(cleanContentList, answer);
    CompQuestion compQuestion = CompQuestion(
        title: currentPoem['title'],
        author: currentPoem['author'],
        contentText: currentPoem['content'],
        contentList: contentList,
        cleanContentList: cleanContentList,
        hideIndex: hideLineIndex,
        answer: answer,
        choose: chooseList);
    String title = compQuestion.title;
    return compQuestion;
  }

  // 组成选项列表
  List<String> formChoose(List<String> cleanContentList, String answer) {
    // 相同内容，继续抽取一项
    String mixedAnswer = '无不同内容项......';
    if (poemLib.length >= 2) {
      mixedAnswer = getMixedPoemItem();
      while (cleanContentList.contains(mixedAnswer)) {
        mixedAnswer = getMixedPoemItem();
      }
    }

    List<String> chooseList = ['', ''];
    int randomIndex = Random().nextInt(2); // 在索引0和1之间抽取
    int anotherIndex = randomIndex ^ 1;
    chooseList[randomIndex] = answer;
    chooseList[anotherIndex] = mixedAnswer;
    return chooseList;
  }

  // 获取随机一项诗
  getMixedPoemItem() {
    int poemItemIndex = Random().nextInt(allPoemItems.length);
    return allPoemItems[poemItemIndex];
  }

  // 结束
  bool isEnd() {
    return extractCount > questionNumByRound;
  }

  bool isLastRound() {
    return extractPoemIndexSet.length == questionNumByRound;
  }
}
