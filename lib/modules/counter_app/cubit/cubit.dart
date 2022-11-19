
import 'package:abdallah_mansour/modules/counter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// يتم كتابة كل logic داخل ال bloc ما بنقرب على ui

/// cubit لازم تاخد class
class CounterCubit extends Cubit<CounterState>{
  ///هذه الكلاس عملت إمبليمنتس من cubit وهي سوبر كلاس ويوجد بها constractor يحتاج إلى قيمة ، نحن هنا قمنا بإستدعاء CONSTRACTOR ة قمنا بإعطائه قيمة
  CounterCubit() : super(CounterInitialState());


  /// تقوم بإنشاء object من نفس ال class
  /// to be more easily when use this cubit in many place
  /// قمنا بتعريفه على أنه ستاتيك حتى نصل له من أي مكان
  static CounterCubit get(context) => BlocProvider.of(context);


  int counter = 1;


  void minus(){
    counter--;

    /// تقوم بتغيير الستيت
    emit(CounterMinusState(counter));
  }

  void plus (){
    counter++;
    emit(CounterPluseState(counter));
  }



}