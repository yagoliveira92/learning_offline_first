part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageCarregando extends HomePageState {}

class HomePageCarregado extends HomePageState {}

class HomePageErro extends HomePageState {}

class HomePageClienteDeletado extends HomePageState {}
