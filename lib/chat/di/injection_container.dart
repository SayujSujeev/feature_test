import 'package:get_it/get_it.dart';
import 'package:feature_integration/chat/data/mock_chat_data_source.dart';
import 'package:feature_integration/chat/domain/usecases/fetch_chats_usecase.dart';

final sl = GetIt.instance;

Future<void> initChatDependencies() async {
  sl.registerLazySingleton<MockChatDataSource>(
    () => MockChatDataSource(),
  );

  sl.registerLazySingleton<FetchChatsUseCase>(
    () => FetchChatsUseCase(sl()),
  );
} 