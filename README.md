[![Build Status](https://travis-ci.org/WennderSantos/turtlechallange.svg?branch=master)](https://travis-ci.org/WennderSantos/turtlechallange)

# Tutle Challenge
Turtle challenge is a board game simulation which, by reading settings in two files, a turtle should walk through a board trying to get to the exit point without hitting any mine.

## File settings
### gameSettings

```
{
  "boardSize": {"x": 6, "y": 6},
  "exitPoint": {"x": 5, "y": 1},
  "mines": [{"x": 0, "y": 0}, {"x": 0, "y": 3}, {"x": 1, "y": 3}, {"x": 2, "y": 1}, {"x": 2, "y": 2}, {"x": 3, "y": 2}, {"x": 3, "y": 3}],
  "turtle": {
    "position": {"x": 0, "y": 1},
    "faceDirection": "East"
  }
}
```
This file contains all the configuration needed to construct a board and start the game.

A **board** has a **boardSize** which is described by an `x y` point indicating its last square. In the example above, the positions inside the board go from `x: 0 y: 0` to `x:5 y: 5`.

The **exitPoint** also uses a point `x y ` to describe the exit of the board.

**mines** describe all the positions in the board containing a mine.

**turtle** describes the position of a turtle and to where its face is turned.

**faceDirection** is an enumerator that can contain the following values: `East - West - South - North`.

### moves

```
["Move", "Rotate", "Move", "Rotate", "Rotate", "Rotate", "Move", "Move", "Move", "Move", "Rotate", "Rotate", "Rotate", "Move"]
```

This file contains the instructions to the turtle. The moves objective is to get the turtle to the **exitPoint** without hit any **mine**.

**Move** move one point to the front, which will depend on where the turtles face is facing (**faceDirection**). Example: a turtle in a point `x: 1 y: 1` with its face facing to the `West` will result in a position `x: 0 y: 1` after a move.

**Rotate** rotate the turtle by 90 degrees without changing its position in the board. Example: A turtle facing to the `North` will result in a turtle facing to the `East` after a rotate.

# The stack
The language I've chosen was Haskell, a strongly typed functional language. Haskell has one of the most powerful type system I know and also a very helpful pattern matching. As I already had written Haskell (in my studies) some time ago, I decided to use it here because of these two features I mentioned before.

The project is using Stack as a build tool and package manager.

HSpec is the test Framework. http://hackage.haskell.org/package/hspec

Besides the config files to run the game, I am not using anything to maintain state.

## Getting Started

After clone the project, the instructions bellow will get you a copy of the project up and running on your local machine for development and testing purposes.

### Setting up the Stack environment

What things you need to install the software and how to install them

Stack

```
curl -sSL https://get.haskellstack.org/ | sh
```
This is generally enough, but you can also find more information about stack on its website https://docs.haskellstack.org/en/stable/README/


### Setup the compiler
In the project root, run
```
stack setup
```

### Running tests
This will run all tests in `/test`
```
stack test
```

### Running the application from the source code
This command will install an executable binary of the app in `.stack-work/install/{name/version_of_your_so}/lts-12.12/{compiler_version}/bin`

```
stack build
```

To run the app, you have to call the executable generated passing the config files. There are two files ready to use in `/file-samples`. Follow an example of the command to run the app (in my machine).
```
.stack-work/install/x86_64-osx/lts-12.12/8.4.3/bin/turtleChallange-exe /file-samples/gameSettings /file-samples/moves
```
or, you can also run
```
stack exec turtleChallange-exe /file-samples/gameSettings /file-samples/moves
```
Both commands will print the same output.

Follow an example of the result after run the application using the setting files in `/file-samples`.
![Sequences log](/file-samples/game-result.png)

# Code and design decisions
As this is a small exercise, I decided to put all the types needed in one file `Board` just to simplify.

All the code that "do something" is in the files `Action` and `Turtle` each of them dealing with things related to their names. The code in `GameResult` file is responsible to create the result of the actions which will be sequentially printed on the screen.

I am very new to functional programming and I am very excited to learn about code designs using it.

As I already said before, I choose Haskell because of its type system and its pattern matching, which when I read the exercise I knew that I could have benefits using it even if I had to learn something.

During the code, I had to assume one business decision. The project will always stop and print the log when:
* Turtle hits a mine
* Turtle gets to the exit point
* Turtle moves outside the board

In a real project, this is a decision that should be talked to business people, I just wanted to show that.