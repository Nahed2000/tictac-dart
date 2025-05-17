import 'dart:collection';
import 'dart:io';

import 'tictac_game.dart';

void main() {
  //object from TicTac class
  TicTacGame ticTacGame = TicTacGame();

  int userChose = 1;
  print('Welcome tic-tac Game\n*****');
  print('Choose Game: \n1.AI \n2.Tow Player:');
  try {
    // make user
    while (true) {
      userChose = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
      if (userChose == 1 || userChose == 2) {
        if (userChose == 1) {
          ticTacGame.aiPlayer();
        } else {
          ticTacGame.towPlayer();
        }
      } else {
        print('Choose Number 1 Or 2:');
        continue;
      }
    }
  } catch (e) {
//
  }

}
