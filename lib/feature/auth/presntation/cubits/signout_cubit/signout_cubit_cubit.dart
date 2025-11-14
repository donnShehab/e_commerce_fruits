import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signout_cubit_state.dart';

class SignoutCubitCubit extends Cubit<SignoutCubitState> {
  SignoutCubitCubit() : super(SignoutCubitInitial());


  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      // Clear local data (e.g., SharedPreferences)
        
      // await Prefs.clear();  // Assuming you have a Prefs class for SharedPreferences
      

      emit(SignoutSuccess());
        
    } catch (e) {
      emit(SignoutError(message: e.toString()));
    }
  }      
}
