import 'package:bloc/bloc.dart';
import 'package:chinagram/bloc/post/post_list_bloc/post_list_event.dart';
import 'package:chinagram/bloc/post/post_list_bloc/post_list_state.dart';
import '../../../network/api.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final ApiCalls apiCalls;

  PostListBloc({required this.apiCalls}) : super(PostListInitial()) {
    on<GetPostListEvent>(_onGetPostList);
  }

    void _onGetPostList(GetPostListEvent event, Emitter <PostListState> emit) async {
        emit(GetPostListStateLoading());
        
        var response = await apiCalls.getAllPosts();
        if(response.statusCode == 200){
          emit(GetPostListStateSuccess(response: response));
          return;
        }
        emit(GetPostListStateFailure(response: response));
  }
}
