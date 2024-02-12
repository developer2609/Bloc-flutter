part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}

class HomeSucces extends HomeState{
  List<Product> productlist;
  HomeSucces({required this.productlist});
}

class HomeError extends HomeState{}