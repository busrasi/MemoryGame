import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';
import 'package:memory_game/models/TileModel.dart';

void main() => runApp(MyApp());
    //main page components and functions
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
// stateful functions
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart();
  }
  void reStart() {

    settedNumbers = getNumberList();
    settedNumbers.shuffle();

    gridViewTiles = settedNumbers;
    Future.delayed(const Duration(seconds: 5), () {
// Here you can write your code
      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        questionPairs = getNumberList();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              points != 800 ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$points/800",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Points",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ) : Container(),
              SizedBox(
                height: 20,
              ),
              points != 800 ? GridView(
                shrinkWrap: true,
                //physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                children: List.generate(gridViewTiles.length, (index) {
                  return Tile(
                    number: gridViewTiles[index].getNumber(),
                    tileIndex: index,
                    parent: this,
                  );
                }),
              ) : Container(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          points = 0;
                          reStart();
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Replay", style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                       // TODO
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Rate Us", style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}



class Tile extends StatefulWidget {
 // String imagePathUrl;
  String number;
  int tileIndex;
  _HomeState parent;

  Tile({this.number, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            settedNumbers[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile == settedNumbers[widget.tileIndex].getNumber()) {
              print("add point");
              points = points + 100;
              print(selectedTile + " thishis : seçtiğimizi yazıyoruz : number : " + widget.number);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              // Future.delayed(const Duration(seconds: 2), () {
              //   tileModel.setImageAssetPath("");
              //   myPairs[widget.tileIndex] = tileModel;
              //   print(selectedIndex);
              //   settedNumbers[selectedIndex] = tileModel;
              //   this.widget.parent.setState(() {});
              //   setState(() {
              //     selected = false;
              //   });
              //   selectedTile = "";
              // });
            } else {
              print(selectedTile +
                  " thishis " +
                  settedNumbers[widget.tileIndex].getNumber());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  settedNumbers[widget.tileIndex].setIsSelected(false);
                  settedNumbers[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = settedNumbers[widget.tileIndex].getNumber();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: settedNumbers[widget.tileIndex].getNumber() != null
            ? (settedNumbers[widget.tileIndex].getIsSelected()
                ? settedNumbers[widget.tileIndex].getNumber()
                : widget.number)
            : Container(
                color: Colors.white,
                child: Text(widget.number),
              ),
      ),
    );
  }
}
