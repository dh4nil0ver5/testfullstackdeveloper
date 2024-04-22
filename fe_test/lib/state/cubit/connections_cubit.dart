import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connections_state.dart';

class ConnectionsCubit extends Cubit<ConnectionsState> {
  ConnectionsCubit() : super(ConnectionsInitial());

  void checkConnection() { 
    emit(ConnectionsConnected());
  }
}
 