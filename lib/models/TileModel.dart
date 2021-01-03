class TileModel{

  String number;
  bool isSelected;

  TileModel({this.number, this.isSelected});

  void setNumber(String getNumber){
    number = getNumber;
  }

  String getNumber(){
    return number;
  }

  void setIsSelected(bool getIsSelected){
    isSelected = getIsSelected;
  }

  bool getIsSelected(){
    return isSelected;
  }
}
