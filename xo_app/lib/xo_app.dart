import 'package:flutter/material.dart';

class XoApp extends StatefulWidget {
  const XoApp({super.key});

  @override
  State<XoApp> createState() => _XoAppState();
}

class _XoAppState extends State<XoApp> {
  bool oTurn = true;
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5D9E9F),
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: _body(),
        ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      foregroundColor: Colors.white,
      title: const Text(
        'Tic Tac Toe App',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green[600],
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [_resultsBanner(), _board()],
    );
  }

  Widget _resultsBanner() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Player X',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  xScore.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Player O',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text(
                  oScore.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _board() {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          _boardRow(
            indxStart: 0
          ),
          _boardRow(
            indxStart: 3
          ),
          _boardRow(last: true,
          indxStart: 6
          )
        ],
      ));
  }

  Widget _boardRow({
    bool last = false,
    required int indxStart
  }) {
    return Row(
      children: [
        _boardBox(
          bottomBorder: !last,
          indx: indxStart
        ),
        _boardBox(
          bottomBorder: !last,
          indx: indxStart + 1
        ),
        _boardBox(
          endBorder: false,
          bottomBorder: !last,
          indx: indxStart + 2
          ),
      ],
    );
  }

  Expanded _boardBox({
    bool endBorder = true,
    bool bottomBorder = true,
    required int indx
  }) {
    return Expanded(child: InkWell(
      onTap: () {
        setState(() {
          //! play role
          if(displayElement[indx].isEmpty) {
            displayElement[indx] = oTurn? 'O': "X";
            filledBoxes++;
             //! change turn
            oTurn = !oTurn;
             //! check winner
          _checkWinner();
          }
        
        });
      },
      child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: BorderDirectional(
              end: endBorder? const BorderSide(color: Colors.orange, width: 4): BorderSide.none,
              bottom: bottomBorder? const BorderSide(color: Colors.orange, width: 4): BorderSide.none,
            )
          ),
          child: Text(displayElement[indx], style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: displayElement[indx] == 'O'? const Color(0xff0B575B) : Colors.white),),
        ),
    ));
  }

    void _checkWinner() {

    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

    void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // foreground
                ),
                child: Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // foreground
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'),
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
  }
}



