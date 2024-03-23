import 'package:bloc/bloc.dart';

class TabsCubit extends Cubit<int> {
  TabsCubit() : super(0);

  void update(int value) {
    emit(value);
  }
}
