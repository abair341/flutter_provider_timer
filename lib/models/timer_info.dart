import 'package:flutter/foundation.dart';


class TimerInfo extends ChangeNotifier{
  
  int a = 60;

	 int getA() => a;

	 setA() {
		a--;
    notifyListeners();
    
	}
 
  

}