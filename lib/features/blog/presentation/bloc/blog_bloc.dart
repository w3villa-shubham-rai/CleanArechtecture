import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/blog/domain/usecases/fetchblog_usecase.dart';
import 'package:clean_archtecture/features/blog/domain/usecases/uploadBlog_usecase.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_Event.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlogUseCase uploadBlogUseCase;
  final FethchAllBlogsUseCase fethchAllBlogsUseCase;
  BlogBloc(this.uploadBlogUseCase, this.fethchAllBlogsUseCase)
      : super(BlogInitialStae()) {
    on<BlogUploadEvent>(_onUploadBlog);
    on<FetchallBlogEvent>(_fetchAllBlog);
  }

  void _onUploadBlog(BlogUploadEvent event, Emitter<BlogState> emit) async {
    try {
      emit((BlogLoadingState()));
      final res = await uploadBlogUseCase(UploadBlogParams(
          posterId: event.posterId,
          title: event.title,
          content: event.content,
          image: event.image,
          topics: event.topics));
      res.fold((error) => emit(BlogFailureState(error.toString())),
          (r) => emit(BlogSucessState()));
    } catch (e) {
      emit(BlogFailureState('An unexpected error occurred in Blog'));
      debugPrint("error in _onUploadBlog  function");
    }
  }

  void _fetchAllBlog(FetchallBlogEvent event, Emitter<BlogState> emit) async {
    try {
      emit((BlogLoadingState()));
       final res = await fethchAllBlogsUseCase(NoParams());
       res.fold(
      (l) => emit(BlogFailureState(l.toString())),
      (r) => emit(BlogDisplaySucessState(r)),
    );
    } catch (e) {
       emit(BlogFailureState('An unexpected error occurred in _fetchAllBlog $e'));
      debugPrint("error in _fetchAllBlog  function");
    
    }
  }
}
