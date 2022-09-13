import 'package:flutter/material.dart';

class mode3 extends StatefulWidget {
  const mode3({Key? key}) : super(key: key);

  @override
  State<mode3> createState() => _mode3State();
}

class _mode3State extends State<mode3> {

  bool oTurn = true;
  List disElement = ["","","","","","","","","",];

  int Xscore = 0;
  int Oscore = 0;
  int filledBoxes = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _clearscoreboard();
              },
              )
        ],
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Colors.grey[900],

      body: Column(
        children: [

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Player O",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white)),
                      SizedBox(height: 20,),
                      Text(Oscore.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Player X",style:  TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white)),
                      SizedBox(height: 20,),
                      Text(Xscore.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                    ],
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 20,),
          Expanded(
            flex: 3,
            child: Padding(
              padding:  EdgeInsets.only(left: 10,right: 10),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey )),
                        child: Center(
                          child: Text(
                              disElement[index],style:  TextStyle(fontSize: 40,
                              color: disElement[index] == 'X' ? Colors.white : Colors.red),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text(
                  oTurn ? 'Turn of O' : 'Turn of X',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )

        ],
      ),

    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && disElement[index] == '') {
        disElement[index] = 'O';
        filledBoxes++;
      }
      else if (!oTurn && disElement[index] == '') {
        disElement[index] = 'X';
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {

    //row checking
    if (
        disElement[0] == disElement[1] &&
        disElement[0] == disElement[2] &&
        disElement[0] != '') {
      _showWinDialog(disElement[0]);
    }
    
    else if (
        disElement[3] == disElement[4] &&
        disElement[3] == disElement[5] &&
        disElement[3] != '') {
      _showWinDialog(disElement[3]);
    }

    else if (
        disElement[6] == disElement[7] &&
        disElement[6] == disElement[8] &&
        disElement[6] != '') {
      _showWinDialog(disElement[6]);
    }

    //column cheking
    else if (
        disElement[0] == disElement[3] &&
        disElement[0] == disElement[6] &&
        disElement[0] != '') {
      _showWinDialog(disElement[0]);
    }

    else if (
        disElement[1] == disElement[4] &&
        disElement[1] == disElement[7] &&
        disElement[1] != '') {
      _showWinDialog(disElement[1]);
    }

    else if (
        disElement[2] == disElement[5] &&
        disElement[2] == disElement[8] &&
        disElement[2] != '') {
      _showWinDialog(disElement[2]);
    }

    //diagonal checking
    else if (
        disElement[0] == disElement[4] &&
        disElement[0] == disElement[8] &&
        disElement[0] != '') {
      _showWinDialog(disElement[0]);
    }

    else if (
        disElement[2] == disElement[4] &&
        disElement[2] == disElement[6] &&
        disElement[2] != '') {
      _showWinDialog(disElement[2]);
    }

    else if ( filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(" \" $winner \" is Winner!!!"),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Play again")),
            ],
          );
        });

    if (winner == 'O') {
      Oscore++;
    }
    else if (winner == 'X') {
      Xscore++;
    }

  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              TextButton(
                  onPressed: () {

                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Play again")),
            ],
          );
        });

  }

  void _clearBoard() {
    setState( () {
      for(int i = 0;i < 9;i++){
        disElement[i] = '';
      }
    });
    filledBoxes = 0;
    oTurn = true;
  }

  void _clearscoreboard() {
    setState( () {
      Xscore = 0;
      Oscore = 0;
      for(int i = 0;i < 9;i++){
        disElement[i] = '';
      }
    });
    filledBoxes = 0;
  }
}

