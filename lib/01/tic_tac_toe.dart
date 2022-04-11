import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<List<List<int>>> combinations = <List<List<int>>>[
    <List<int>>[
      <int>[0, 0],
      <int>[0, 1],
      <int>[0, 2],
    ],
    <List<int>>[
      <int>[1, 0],
      <int>[1, 1],
      <int>[1, 2],
    ],
    <List<int>>[
      <int>[2, 0],
      <int>[2, 1],
      <int>[2, 2],
    ],
    <List<int>>[
      <int>[0, 0],
      <int>[1, 0],
      <int>[2, 0],
    ],
    <List<int>>[
      <int>[0, 1],
      <int>[1, 1],
      <int>[2, 1],
    ],
    <List<int>>[
      <int>[0, 2],
      <int>[1, 2],
      <int>[2, 2],
    ],
    <List<int>>[
      <int>[0, 0],
      <int>[1, 1],
      <int>[2, 2],
    ],
    <List<int>>[
      <int>[0, 2],
      <int>[1, 1],
      <int>[2, 0],
    ],
  ];
  List<List<int>> board = <List<int>>[
    <int>[0, 0, 0],
    <int>[0, 0, 0],
    <int>[0, 0, 0]
  ];
  bool isPlayer1 = true;
  bool gameOver = false;

  void _checkWinner() {
    for (int i = 0; i < combinations.length; i++) {
      final List<List<int>> possibility = combinations[i];
      final List<int> first = possibility[0];
      final List<int> second = possibility[1];
      final List<int> third = possibility[2];

      if (board[first[0]][first[1]] != 0 &&
          board[first[0]][first[1]] == board[second[0]][second[1]] &&
          board[second[0]][second[1]] == board[third[0]][third[1]]) {
        setState(() {
          final int winner = board[first[0]][first[1]];
          _reset();
          board[first[0]][first[1]] = winner;
          board[second[0]][second[1]] = winner;
          board[third[0]][third[1]] = winner;
          isPlayer1 = true;
          gameOver = true;
        });

        return;
      }
    }

    gameOver = true;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == 0) {
          setState(() {
            gameOver = false;
          });
          return;
        }
      }
    }
  }

  void _reset() {
    board = <List<int>>[
      <int>[0, 0, 0],
      <int>[0, 0, 0],
      <int>[0, 0, 0]
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double boardSize = MediaQuery.of(context).size.width;
    final double squareSize = boardSize / 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'tic-tac-toe',
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: boardSize,
              height: boardSize,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[0][0] == 0) {
                            board[0][0] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[0][0].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[0][1] == 0) {
                            board[0][1] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[0][1].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[0][2] == 0) {
                            board[0][2] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[0][2].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[1][0] == 0) {
                            board[1][0] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[1][0].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[1][1] == 0) {
                            board[1][1] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[1][1].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[1][2] == 0) {
                            board[1][2] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[1][2].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[2][0] == 0) {
                            board[2][0] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[2][0].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[2][1] == 0) {
                            board[2][1] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[2][1].toDouble(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (board[2][2] == 0) {
                            board[2][2] = isPlayer1 ? 1 : 2;
                            isPlayer1 = !isPlayer1;
                          }
                          _checkWinner();
                        });
                      },
                      child: Square(
                        squareSize: squareSize,
                        value: board[2][2].toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (gameOver)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _reset();
                    gameOver = false;
                  });
                },
                child: const Text('Play again!'),
              ),
          ],
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  const Square({
    Key? key,
    required this.squareSize,
    required this.value,
  }) : super(key: key);

  final double squareSize;
  final double value;

  Color? _getColor() {
    if (value == 1) {
      return Colors.red;
    } else if (value == 2) {
      return Colors.green;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: squareSize,
      height: squareSize,
      decoration: BoxDecoration(
        color: _getColor(),
        border: Border.all(width: 0.0),
      ),
    );
  }
}
