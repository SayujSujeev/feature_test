import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:feature_integration/chat/data/models/chat_model.dart';

part 'chat_list_state.freezed.dart';

enum ChatListStatus { initial, loading, success, failure }

@freezed
abstract class ChatListState with _$ChatListState {
  const factory ChatListState({
    @Default(ChatListStatus.initial) ChatListStatus status,
    @Default([]) List<ChatModel> chats,
    String? errorMessage,
  }) = _ChatListState;
} 