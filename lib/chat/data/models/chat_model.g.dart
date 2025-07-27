// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => _ChatModel(
  id: json['id'] as String,
  name: json['name'] as String,
  lastMessage: json['lastMessage'] as String,
  timestamp: json['timestamp'] as String,
  avatarUrl: json['avatarUrl'] as String,
  isOnline: json['isOnline'] as bool,
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
  chatType: $enumDecode(_$ChatTypeEnumMap, json['chatType']),
);

Map<String, dynamic> _$ChatModelToJson(_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastMessage': instance.lastMessage,
      'timestamp': instance.timestamp,
      'avatarUrl': instance.avatarUrl,
      'isOnline': instance.isOnline,
      'unreadCount': instance.unreadCount,
      'chatType': _$ChatTypeEnumMap[instance.chatType]!,
    };

const _$ChatTypeEnumMap = {
  ChatType.direct: 'direct',
  ChatType.group: 'group',
  ChatType.public: 'public',
};
