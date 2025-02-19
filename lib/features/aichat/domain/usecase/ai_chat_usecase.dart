import 'package:clean_archtecture/core/error/failure.dart';
import 'package:clean_archtecture/core/usecase/usecase.dart';
import 'package:clean_archtecture/features/aichat/data/models/tokenType_models_params.dart';
import 'package:clean_archtecture/features/aichat/domain/repository/google_ai_repository.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';


class AiChatUseCases implements UseCase<String, AiParams> {
  GoogleAiRepository googleAiRepository;
  AiChatUseCases(this.googleAiRepository);
  @override
  Future<Either<Failure, String>> call(AiParams params) async {
    try {
      var res=await googleAiRepository.aiCommunication(promptText: params.promtMessage);
       debugPrint("Ai Responsce in usecase+++ $res");

      if (res.toString().isEmpty) {
        return Left(Failure("Invalid Input"));
      }
      // final response = "AI Response for: ${params}";
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
