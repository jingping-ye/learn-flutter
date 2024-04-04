import 'package:flutter/material.dart';
import 'package:quizzler/queation_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: QuizzlerPage(),
        ),
      ),
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({
    super.key,
  });

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  QuestionBrain questionBrain = QuestionBrain(questionNumByRound: 10);

  List<Icon> iconList = [];
  int yourGrade = 0;

  @override
  Widget build(BuildContext context) {
    CompQuestion compoQuestion = questionBrain.getCompoQuestion();
    Text getTextItem(title) {
      return Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 25.0, color: Colors.white, fontFamily: 'MaShanZheng'),
      );
    }

    // 生成有间隔的下划线
    Widget generateSpacedUnderLine(
        {required String title,
        bool ignoreLastWord = false,
        double wordWidth = 25.0,
        double wordHeight = 40.0,
        double actualWordWidth = 18.0,
        double underlineWidth = 1.0,
        Color underlineColor = Colors.white}) {
      int underlineNumber = title.length;
      // if (ignoreLastWord) {
      //   underlineNumber = underlineNumber - 1;
      // }
      List<SizedBox> underlineBox = [];

      for (int i = 0; i < underlineNumber; i++) {
        bool isLast = i == underlineNumber - 1;
        underlineBox.add(
          SizedBox(
            width: wordWidth,
            height: wordHeight,
            child: Center(
              child: SizedBox(
                width: actualWordWidth,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isLast && ignoreLastWord
                            ? Colors.transparent
                            : underlineColor,
                        width: underlineWidth, // Underline thickness
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }

      Widget spacedUnderline = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: underlineBox,
      );
      return spacedUnderline;
    }

    List<Widget> getTextList() {
      List<Widget> textList = [];
      textList.add(getTextItem(compoQuestion.title));
      textList.add(getTextItem(compoQuestion.author));
      textList.add(const SizedBox(
        height: 20,
      ));

      List<String> contentList = compoQuestion.contentList;
      for (int i = 0; i < contentList.length; i++) {
        if (i == compoQuestion.hideIndex) {
          //textList.add(getTextItem('__' * (contentList[i].length)));
          textList.add(
            Container(
              margin: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: generateSpacedUnderLine(
                  title: contentList[i],
                  ignoreLastWord: true,
                  wordHeight: 25.0),
            ),
          );
        } else {
          textList.add(getTextItem(contentList[i]));
        }
      }
      return textList;
    }

    // 选择是否开始下一轮
    void chooseNextRound() {
      if (questionBrain.isLastRound()) {
        int totalGrade = iconList.length;
        Alert alert = Alert(
          context: context,
          style: const AlertStyle(
            backgroundColor: Colors.black,
            titleStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'MaShanZheng',
            ),
            descStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'MaShanZheng',
            ),
          ),
          title: "您的得分：$yourGrade/$totalGrade",
          desc: "当前回合已经结束，是否开始下一回合？",
          buttons: [
            DialogButton(
              border: const Border.fromBorderSide(
                BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color(0xff0b0812),
              child: const Text(
                "否",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'MaShanZheng',
                ),
              ),
            ),
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  questionBrain.resetRound();
                  iconList = [];
                  yourGrade = 0;
                });
              },
              color: Colors.white,
              child: const Text(
                "是",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'MaShanZheng',
                ),
              ),
            )
          ],
        );
        alert.show();
      }
    }

    void judgeAnswer(choose) {
      if (!questionBrain.isEnd()) {
        if (choose == compoQuestion.answer) {
          yourGrade++;
          setState(() {
            iconList.add(
              const Icon(Icons.check, color: Colors.green),
            );
            // questionBrain.getCompoQuestion();
          });
        } else {
          setState(() {
            iconList.add(
              const Icon(Icons.close, color: Colors.red),
            );
          });
        }
        chooseNextRound();
      } else {
        chooseNextRound();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getTextList(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                side: const BorderSide(
                  // width: 3.0,
                  color: Colors.white,
                ),
              ),
              child: Text(
                compoQuestion.choose[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'MaShanZheng',
                ),
              ),
              onPressed: () {
                judgeAnswer(compoQuestion.choose[0]);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black45,
                side: const BorderSide(
                  // width: 3.0,
                  color: Colors.white,
                ),
              ),
              child: Text(
                compoQuestion.choose[1],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'MaShanZheng'),
              ),
              onPressed: () {
                judgeAnswer(compoQuestion.choose[1]);
              },
            ),
          ),
        ),
        Row(children: iconList)
      ],
    );
  }
}
