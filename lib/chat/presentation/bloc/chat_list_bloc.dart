import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_integration/chat/di/injection_container.dart';
import 'package:feature_integration/chat/domain/usecases/fetch_chats_usecase.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_event.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final FetchChatsUseCase _fetchChatsUseCase;

  ChatListBloc()
      : _fetchChatsUseCase = sl<FetchChatsUseCase>(),
        super(const ChatListState()) {
    on<FetchAllChats>(_onFetchAllChats);
  }

  Future<void> _onFetchAllChats(
    FetchAllChats event,
    Emitter<ChatListState> emit,
  ) async {
    emit(state.copyWith(status: ChatListStatus.loading));

    final result = await _fetchChatsUseCase();

    result.fold(
      (failure) => emit(state.copyWith(
        status: ChatListStatus.failure,
        errorMessage: failure,
      )),
      (chats) => emit(state.copyWith(
        status: ChatListStatus.success,
        chats: chats,
      )),
    );
  }
} 