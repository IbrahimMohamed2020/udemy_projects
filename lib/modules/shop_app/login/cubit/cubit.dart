import 'package:abdallah_mansour/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{

  /// عند إنشاء أي cubit فأننا لازم نستدعي constructor الخاص به و نعطيه القيمة initial ونقوم بوضعه داخل constructor class
  ShopLoginCubit() : super(ShopLoginInitialState());


  /// هنا قمنا بإنشاء object من cubit حتى نستدعيه من أي مكان نريه
  static ShopLoginCubit get(context) => BlocProvider.of(context);
}