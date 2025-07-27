import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
abstract class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    required String name,
    required String lastMessage,
    required String timestamp,
    required String avatarUrl,
    required bool isOnline,
    @Default(0) int unreadCount,
    required ChatType chatType,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}

enum ChatType {
  @JsonValue('direct')
  direct,
  @JsonValue('group')
  group,
  @JsonValue('public')
  public,
} 