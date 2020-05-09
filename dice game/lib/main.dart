import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(child: Text('Roll Dice',style: TextStyle(fontSize: 25),)),
          backgroundColor: Colors.blue
        ),
        
        body: Container(
          decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
          end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(116, 107, 209,1),
                      Color.fromRGBO(134, 206, 231,1),
                      Color.fromRGBO(95, 251, 241,1),
                    ]
                  )
                ),
          child: DicePage()),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
    int leftDiceNumber  = 1;
    int rightDiceNumber = 1;
    int scoreLeft = 0;
    int scoreRight = 0;
    int totalScore = 0;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,           
              children: <Widget>[

              //-----Player names-----------
                 playerNamesRow(),

                //---------DICEE SCREEN----------
                diceRow(context),
                 //-----------SCORE BOARD -------------
               ScoreBoardRow(scoreLeft: scoreLeft, scoreRight: scoreRight),
              ],
            ),
          ),
    );
  }

  Row playerNamesRow() {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   
   children: <Widget>[
       Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PLAYER 1',
              style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),
              ),
          ),
  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('PLAYER 2',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
          ),

    ],
  );
  }

  Row diceRow(BuildContext context) {
    return Row(
              children: <Widget>[
              Expanded(
                child: FlatButton(
                onPressed: (){
                  setState(() {
                   leftDiceNumber = Random().nextInt(6)+1;
                   scoreLeft += leftDiceNumber;
                   checkScore("PLAYER 1",scoreLeft,context);
                   print(totalScore);
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
                )
                ),
              Expanded(
                child: FlatButton(
                onPressed: (){
                   setState(() {
                   rightDiceNumber = Random().nextInt(6)+1;
                    scoreRight += rightDiceNumber;
                    checkScore("PLAYER 2",scoreRight,context);
                    print(totalScore);
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png')
                )
                ),
      ],
      );
  }

void resetGame(){
  leftDiceNumber = 1;
  rightDiceNumber = 1;
  scoreLeft = 0;
  scoreRight = 0; 
}
void checkScore(String player,int score,BuildContext context){

  if(score >= 30)
  {
  resetGame();
  showAlertDialog(context,player);

  }
}    

showAlertDialog(BuildContext context,String player){

  Widget okButton = FlatButton(
    
    child: Text('DONE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),onPressed: (){
   Navigator.of(context).pop();
  },
  );
  AlertDialog alert = AlertDialog(
  
    title: Text(
      "GAME OVER!",
      style: TextStyle(fontSize: 25),
      ), 
    content: Text('$player WON THE GAME',style: TextStyle(fontSize: 20)),
    actions: <Widget>[
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
  
}

}


class ScoreBoardRow extends StatelessWidget {
  const ScoreBoardRow({
    Key key,
    @required this.scoreLeft,
    @required this.scoreRight,
  }) : super(key: key);

  final int scoreLeft;
  final int scoreRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     
     children: <Widget>[
          Card(
            
            margin: EdgeInsets.all(10),
            child: Container(
              color: Colors.lightGreenAccent,
           alignment: Alignment.center,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               'SCORE : $scoreLeft',
               style: TextStyle(fontSize: 30),
               ),
           ),
         ),
     ),
       Card(margin: EdgeInsets.all(10),
            child: Container(
           color: Colors.lightGreenAccent,
           child:  Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('SCORE : $scoreRight',style: TextStyle(fontSize: 30),),
           ),
           
         ),
       ),

      ],
    );
  }





}
