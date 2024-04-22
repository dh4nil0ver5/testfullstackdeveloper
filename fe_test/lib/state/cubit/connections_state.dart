part of 'connections_cubit.dart';

abstract class ConnectionsState extends Equatable {
  const ConnectionsState();

  @override
  List<Object?> get props => [];
}

class ConnectionsInitial extends ConnectionsState {}

class ConnectionsConnected extends ConnectionsState {}
