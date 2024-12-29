import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;
  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(var i=0;i<chosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correctAnswer':questions[i].answers[0],
        'user_answer':chosenAnswers[i], 
      });
    }
    return summary;
  }

   @override
   Widget build(BuildContext context){
      final summaryData = getSummaryData();
      final numTotalQuestions = questions.length;
      final numCorrectQuestions = summaryData.where((data){
        return data['user_answer'] == data['correctAnswer'];
      }).length;
      return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style:GoogleFonts.lato(
              color: Colors.white,
              fontSize:20,
              
            ), 
            ),
            const SizedBox(
              height:30
            ),
            QuestionsSummary(summaryData),
            const SizedBox(height:30),
            TextButton.icon(
              onPressed: onRestart,
              icon: Icon(
                Icons.autorenew_sharp,
                color: Colors.white,
                ),
                 label: Text(
                'Restart Quiz',
                 style: TextStyle(
                  color: Colors.white,
                 ),
              )
            )
          ],
        ),
      ),
    );
  }
}