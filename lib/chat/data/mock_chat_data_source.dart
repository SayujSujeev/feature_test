import 'package:feature_integration/chat/data/models/chat_model.dart';

class MockChatDataSource {
  Future<List<ChatModel>> fetchAllChats() async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      const ChatModel(
        id: '1',
        name: 'Koh Samui Ppl',
        lastMessage: 'Lorem ipsum dolor sit scing....',
        timestamp: '13:55',
        avatarUrl: 'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isOnline: true,
        unreadCount: 12,
        chatType: ChatType.group,
      ),
      const ChatModel(
        id: '2',
        name: 'Cristofer',
        lastMessage: 'Lorem ipsum dolor sit amet,',
        timestamp: '11:53',
        avatarUrl: 'https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isOnline: false,
        unreadCount: 0,
        chatType: ChatType.direct,
      ),
      const ChatModel(
        id: '3',
        name: 'Laurie',
        lastMessage: 'Lorem ipsum dolor sit amet,',
        timestamp: 'Yesterday',
        avatarUrl: 'https://plus.unsplash.com/premium_photo-1688350808212-4e6908a03925?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isOnline: true,
        unreadCount: 3,
        chatType: ChatType.direct,
      ),
      const ChatModel(
        id: '4',
        name: "Tommy's Hat",
        lastMessage: 'Lorem ipsum dolor sit amet,',
        timestamp: 'Yesterday',
        avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1064&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isOnline: false,
        unreadCount: 0,
        chatType: ChatType.group,
      ),
      const ChatModel(
        id: '5',
        name: 'Alexandrio F',
        lastMessage: 'Lorem ipsum dolor sit amet,',
        timestamp: 'Yesterday',
        avatarUrl: 'https://images.unsplash.com/photo-1625642123545-f0f68b1621e3?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isOnline: true,
        unreadCount: 0,
        chatType: ChatType.direct,
      ),
      const ChatModel(
        id: '6',
        name: 'Happy Friends',
        lastMessage: 'Lorem ipsum dolor sit amet,',
        timestamp: 'Yesterday',
        avatarUrl: 'https://images.unsplash.com/photo-1552234994-66ba234fd567?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        isOnline: false,
        unreadCount: 7,
        chatType: ChatType.public,
      ),
    ];
  }

  Future<List<ChatModel>> fetchDirectChats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allChats = await fetchAllChats();
    return allChats.where((chat) => chat.chatType == ChatType.direct).toList();
  }

  Future<List<ChatModel>> fetchGroupChats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allChats = await fetchAllChats();
    return allChats.where((chat) => chat.chatType == ChatType.group).toList();
  }

  Future<List<ChatModel>> fetchPublicChats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allChats = await fetchAllChats();
    return allChats.where((chat) => chat.chatType == ChatType.public).toList();
  }

  Future<List<ChatModel>> searchChats(String query) async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    final allChats = await fetchAllChats();
    return allChats
        .where((chat) => 
            chat.name.toLowerCase().contains(query.toLowerCase()) ||
            chat.lastMessage.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
} 