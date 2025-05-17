import 'dart:io';

import 'game_board.dart';

class TicTacGame {
  int playerX = 1;
  int playerO = 2;

  // list of value to check it ..

  List<List<GameBoard>> gameBordList = [
    [
      GameBoard(title: '[]', index: 1),
      GameBoard(title: '[]', index: 2),
      GameBoard(title: '[]', index: 3),
    ],
    [
      GameBoard(title: '[]', index: 4),
      GameBoard(title: '[]', index: 5),
      GameBoard(title: '[]', index: 6),
    ],
    [
      GameBoard(title: '[]', index: 7),
      GameBoard(title: '[]', index: 8),
      GameBoard(title: '[]', index: 9),
    ],
  ];

  //ai player function
  void aiPlayer() {
    print('Something went wrong... plz try 2 player');
  }

  //two player function
  void towPlayer() {
    int player1 = playerX;
    int player2 = playerO;
    print('choose Player 1:  1."X" Or 2."O" :');
    int? player1Choose = int.tryParse(stdin.readLineSync() ?? "");
    if (player1Choose == 1 || player1Choose == 2) {
      player1 = player1Choose == 1 ? playerX : playerO;
      player2 = player1Choose == 2 ? playerX : playerO;
      drawBoard();
      try {
        int moves = 0;
        while (moves < 9) {
          if (moves % 2 == 0) {
            print('Player One :');
            int? indexNumberOne = int.tryParse(stdin.readLineSync() ?? '');
            if (indexNumberOne == null ||
                indexNumberOne < 1 ||
                indexNumberOne > 9) {
              print('Invalid input. Try again.');
              continue;
            }
            if (!isCellAvailable(indexNumberOne)) {
              print('Cell already taken. Try another.');
              continue;
            }
            if (isCellAvailable(indexNumberOne)) {
              for (int m = 0; m < gameBordList.length; m++) {
                for (int j = 0; j < gameBordList[m].length; j++) {
                  if (indexNumberOne == gameBordList[m][j].index) {
                    gameBordList[m][j].title = player1 == 1 ? 'X' : 'O';
                  }
                }
              }
              moves++;
            } else {
              print('try another cell');
            }
          } else {
            print('Player Tow :');
            int? indexNumberTow = int.tryParse(stdin.readLineSync() ?? '');

            if (indexNumberTow == null ||
                indexNumberTow < 1 ||
                indexNumberTow > 9) {
              print('Invalid input. Enter a number between 1 and 9:');
              continue;
            }
            if (isCellAvailable(indexNumberTow)) {
              for (int i = 0; i < gameBordList.length; i++) {
                for (int j = 0; j < gameBordList[i].length; j++) {
                  if (indexNumberTow == gameBordList[i][j].index) {
                    gameBordList[i][j].title = player2 == 1 ? 'X' : 'O';
                  }
                }
              }
              moves++;
            } else {
              print('try another cell');
            }
          }
          drawBoard();
          if (getResult != 'Draw') {
            print('The Winner Is $getResult');
            resetBoard();
            break;
          }
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('Invalid input, please enter 1 or 2:');
    }
  }

  //check cell is available or not
  bool isCellAvailable(int index) {
    for (var row in gameBordList) {
      for (var cell in row) {
        if (cell.index == index) {
          return cell.title == '[]';
        }
      }
    }
    return false;
  }

  //this function to draw Bord
  void drawBoard() {
    for (int i = 0; i < gameBordList.length; i++) {
      for (int j = 0; j < gameBordList[i].length; j++) {
        stdout.write('${gameBordList[i][j].title}     ');
      }
      print('');
    }
  }

  // get the Result  =>
  /*
    1  2  3
    4  5  6
    7  8  9
   */
  String get getResult {
    if (gameBordList[0][0].title != '[]' &&
        gameBordList[0][0].title == gameBordList[0][1].title &&
        gameBordList[0][1].title == gameBordList[0][2].title) {
      return gameBordList[0][0].title;
    } else if (gameBordList[1][0].title != '[]' &&
        gameBordList[1][0].title == gameBordList[1][1].title &&
        gameBordList[1][1].title == gameBordList[1][2].title) {
      return gameBordList[1][0].title;
    } else if (gameBordList[2][0].title != '[]' &&
        gameBordList[2][0].title == gameBordList[2][1].title &&
        gameBordList[2][1].title == gameBordList[2][2].title) {
      return gameBordList[2][0].title;
    }
    // Column
    else if (gameBordList[0][0].title != '[]' &&
        gameBordList[0][0].title == gameBordList[1][0].title &&
        gameBordList[1][0].title == gameBordList[2][0].title) {
      return gameBordList[0][0].title;
    } else if (gameBordList[0][1].title != '[]' &&
        gameBordList[0][1].title == gameBordList[1][1].title &&
        gameBordList[1][1].title == gameBordList[2][1].title) {
      return gameBordList[0][1].title;
    } else if (gameBordList[0][2].title != '[]' &&
        gameBordList[0][2].title == gameBordList[1][2].title &&
        gameBordList[1][2].title == gameBordList[2][2].title) {
      return gameBordList[0][2].title;
    }
    // Primary
    else if (gameBordList[0][0].title != '[]' &&
        gameBordList[0][0].title == gameBordList[1][1].title &&
        gameBordList[1][1].title == gameBordList[2][2].title) {
      return gameBordList[0][0].title;
    }

    // O>>
    else if (gameBordList[0][2].title != '[]' &&
        gameBordList[0][2].title == gameBordList[1][1].title &&
        gameBordList[1][1].title == gameBordList[2][0].title) {
      return gameBordList[0][2].title;
    }
    return 'Draw';
  }

  // Reset List Value to play another ..

  void resetBoard() {
    int index = 1;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        gameBordList[i][j] = GameBoard(title: '[]', index: index++);
      }
    }
  }
}
