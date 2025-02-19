import 'package:clean_archtecture/features/aichat/data/dataSource/datasource_baser_repo.dart';
import 'package:clean_archtecture/features/aichat/domain/repository/google_ai_repository.dart';
import 'package:flutter/material.dart';

class GoogleApiImpl implements GoogleAiRepository {
  BaseRepoOfDataSource baseRepoOfDataSource;
  GoogleApiImpl(this.baseRepoOfDataSource);
  @override
  Future<String> aiCommunication({required String promptText}) async{
    var responsce=await baseRepoOfDataSource.fetchAiResponse(promptText: promptText);
    debugPrint("Ai Responsce in repo $responsce");
    return responsce;
  }
  
}