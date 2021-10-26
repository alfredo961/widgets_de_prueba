
import 'package:get/get.dart';

class StepperController extends GetxController{
  RxInt currentStep = 0.obs;
  RxBool complete = false.obs;

  stepContinue(int maxstep){
    if(currentStep.value < maxstep -1){
      go(1);
    }else{
      currentStep.value = maxstep-1;
      complete.value = true;
    }
  }

  stepCancel() {
    if(currentStep.value != 0){
      go(-1);
    }else{
      currentStep.value = 0;
    }
  }

  stepSelected(step) {
    currentStep.value = step;
  }

  go(int step){
    currentStep.value = currentStep.value + step;
  }

}