import 'package:mythic_design/data/models/creator_model.dart';

abstract class CreatorRemoteRepository{
  Future<CreatorModel> getCreator(String id);
}