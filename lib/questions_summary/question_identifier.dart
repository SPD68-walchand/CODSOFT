import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.isCorrectAnswer,
       required this.questionIndex,
       super.key
    }
  );
  final int questionIndex;
  final bool isCorrectAnswer;
  
  Widget build(BuildContext context){
    final questionNumber = questionIndex + 1;
    return Container(
      height:35,
      width:35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
           color: isCorrectAnswer
               ? const Color.fromARGB(255,150,198,241)
               : const Color.fromARGB(255,249,133,241),  
        borderRadius: BorderRadius.circular(100),
      ),
      child:Text(
        questionNumber.toString(),
        style:const TextStyle(
          color:Color.fromARGB(255,22,2,56),
          fontWeight: FontWeight.bold,
        )
      )
    );
  }
}
