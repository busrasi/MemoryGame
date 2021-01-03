import 'package:memory_game/models/TileModel.dart';

String selectedTile = "";
int selectedIndex ;
bool selected = true;
int points = 0;

List<TileModel> settedNumbers = new List<TileModel>();
List<bool> clicked = new List<bool>();

List<bool> getClicked(){

  List<bool> yoClicked = new List<bool>();
  List<TileModel> mypairs = new List<TileModel>();
  mypairs = getNumberList();
  for(int i=0;i<mypairs.length;i++){
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel>  getNumberList(){

  List<TileModel> numbers = new List<TileModel>();

  TileModel tileModel = new TileModel();

  //1
  tileModel.setNumber("1");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();

  //2
  tileModel.setNumber("2");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();

  //3
  tileModel.setNumber("3");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();

  //4
  tileModel.setNumber("4");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();
  //5
  tileModel.setNumber("5");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();

  //6
  tileModel.setNumber("6");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();

  //7
  tileModel.setNumber("7");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();
  //8
  tileModel.setNumber("8");
  tileModel.setIsSelected(false);
  numbers.add(tileModel);
  tileModel = new TileModel();

  return numbers;
}

// List<TileModel>  getQuestionPairs(){
//
//   List<TileModel> pairs = new List<TileModel>();
//
//   TileModel tileModel = new TileModel();
//
//   //1
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   //2
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   //3
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   //4
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//   //5
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   //6
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   //7
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   //8
//   tileModel.setImageAssetPath("assets/question.png");
//   tileModel.setIsSelected(false);
//   pairs.add(tileModel);
//   pairs.add(tileModel);
//   tileModel = new TileModel();
//
//   return pairs;
// }