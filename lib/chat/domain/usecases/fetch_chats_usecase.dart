import 'package:dartz/dartz.dart';
import 'package:feature_integration/chat/data/models/chat_model.dart';
import 'package:feature_integration/chat/data/mock_chat_data_source.dart';

class FetchChatsUseCase {
  final MockChatDataSource _dataSource;

  FetchChatsUseCase(this._dataSource);

  Future<Either<String, List<ChatModel>>> call() async {
    try {
      final chats = await _dataSource.fetchAllChats();
      return Right(chats);
    } catch (e) {
      return Left(e.toString());
    }
  }
} 