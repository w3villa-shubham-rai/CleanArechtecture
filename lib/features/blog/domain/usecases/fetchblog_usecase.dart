import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/blog/domain/entites/blog.dart';
import 'package:clean_archtecture/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/src/either.dart';

class FethchAllBlogsUseCase implements UseCase<List<Blog>, NoParams> {
   final BlogRepository blogRepository;
  FethchAllBlogsUseCase(this.blogRepository);
  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) {
     return blogRepository.fetchedAllBlogRepository();
  }
}
