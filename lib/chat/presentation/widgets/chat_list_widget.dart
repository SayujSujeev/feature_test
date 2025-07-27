import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_bloc.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_event.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_state.dart';
import 'package:feature_integration/chat/data/models/chat_model.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatListBloc()..add(const ChatListEvent.fetchAllChats()),
      child: const ChatListView(),
    );
  }
}

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 220, 1),
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 158, 4, 1),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 239, 205, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(60),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Lounge',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(42, 157, 143, 1),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                            border: Border.all(
                              color: Color.fromRGBO(255, 248, 220, 1),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '+Chat',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 248, 220, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(253, 217, 145, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(42, 157, 143, 1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 5,
                          bottom: 5,
                          right: 10,
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search for chats and people...  ',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(42, 157, 143, 1),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(42, 157, 143, 1),
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (query) {
                            // Search functionality removed for simplicity
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/bg_image.png',
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 243, 220, 0.5),
                    ),
                    child: BlocBuilder<ChatListBloc, ChatListState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case ChatListStatus.initial:
                            return const Center(child: Text('Initial'));

                          case ChatListStatus.loading:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case ChatListStatus.success:
                            return ListView.builder(
                              itemCount: state.chats.length,
                              itemBuilder: (context, index) {
                                final chat = state.chats[index];
                                return _buildChatTile(chat);
                              },
                            );

                          case ChatListStatus.failure:
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error,
                                    size: 64,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: 16),
                                  Text('Error: ${state.errorMessage}'),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<ChatListBloc>().add(
                                        const ChatListEvent.fetchAllChats(),
                                      );
                                    },
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(ChatModel chat) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 239, 205, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
        border: Border.all(color: Color.fromRGBO(114, 214, 198, 1), width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(chat.avatarUrl),
                      radius: 25,
                    ),
                    if (chat.isOnline)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // Timestamp and unread count
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chat.timestamp,
                      style: TextStyle(
                        color: Color.fromRGBO(74, 111, 106, 1),
                        fontSize: 12,
                      ),
                    ),
                    if (chat.unreadCount > 0) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(42, 157, 143, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          chat.unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
