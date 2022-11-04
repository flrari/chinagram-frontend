import 'package:http/http.dart';

class PostListState {}

class PostListInitial extends PostListState {}

class GetPostListStateLoading extends PostListState {}

class GetPostListStateSuccess extends PostListState {
  final Response response;

  GetPostListStateSuccess({required this.response,});
}

class GetPostListStateFailure extends PostListState {
  final Response response;

  GetPostListStateFailure({required this.response,});
}
