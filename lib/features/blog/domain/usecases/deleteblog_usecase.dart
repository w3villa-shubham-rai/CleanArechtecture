import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteBlogUseCase implements UseCase<void, DeleteBlogParams> {
  final BlogRepository repository;

  DeleteBlogUseCase(this.repository);

  @override
  @override
Future<Either<Failure, void>> call(DeleteBlogParams params) async {
  try {
    await repository.deleteBlog(blogId: params.blogId);
    
    return const Right(null);
  } catch (e) {
    return Left(Failure('Failed to delete the blog: $e'));
  }
}

}

class DeleteBlogParams {
  final String blogId;
  DeleteBlogParams({required this.blogId});
}
