import 'package:clean_archtecture/features/blog/domain/usecases/uploadBlog_usecase.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_Event.dart';
import 'package:clean_archtecture/features/blog/presentation/bloc/blog_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogBloc extends Bloc<BlogUploadEvent, BlogState> {
  final UploadBlogUseCase uploadBlogUseCase;
  BlogBloc(this.uploadBlogUseCase) : super(BlogInitialStae()) {
    on<BlogUploadEvent>(_onUploadBlog);
  }

  void _onUploadBlog(BlogUploadEvent event, Emitter<BlogState> emit) async {
    try {
       emit((BlogLoadingState()));
       final res= await uploadBlogUseCase(UploadBlogParams(posterId: event.posterId, title: event.title, content: event.content, image: event.image, topics: event.topics));
     res.fold((error) => emit(BlogFailureState(error.toString())), (r) => emit(BlogSucessState()));
    } catch (e) {
        emit(BlogFailureState('An unexpected error occurred in Blog'));
    }
    
  }
}
