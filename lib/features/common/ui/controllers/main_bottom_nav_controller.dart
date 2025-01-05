import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int _selectedIndex =0;

  int get selectedIndex=>_selectedIndex;

  void changeIndex (int index){
   if(index==_selectedIndex){
    return;
   }
    _selectedIndex=index;

    update();//worker as setstate
  
  
  }

  void backToHome(){
    changeIndex(0);
  }
  void moveToCategoty(){
    changeIndex(1);
  }
}