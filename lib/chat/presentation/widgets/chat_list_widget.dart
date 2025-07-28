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
      backgroundColor: const Color.fromRGBO(255, 248, 220, 1),
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(
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
                          width: 138,
                          height: 60,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 138,
                                  height: 60,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFFFEECD),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(60),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 17,
                                top: 17,
                                child: Text(
                                  'Lounge',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    height: 1.10,
                                    fontFamily: 'Fraunces',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 85,
                          height: 44,
                          padding: const EdgeInsets.only(
                            top: 6,
                            left: 16,
                            right: 16,
                            bottom: 20,
                          ),
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2A9D8F),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF72D6C6),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(48),
                                bottomRight: Radius.circular(48),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '+Chat',
                                style: TextStyle(
                                  color: Color(0xFFFFF8DC),
                                  fontSize: 16,
                                  fontFamily: 'Fraunces',
                                  fontWeight: FontWeight.w600,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration:  BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(200)),
                                  border: const Border(
                                    top: BorderSide(color: Color(0xFF2A9D8F), width: 1.5),
                                    left: BorderSide(color: Color(0xFF2A9D8F), width: 1.5),
                                    bottom: BorderSide(color: Color(0xFF2A9D8F), width: 1.5),
                                    right: BorderSide(color: Color(0xFF2A9D8F), width: 1.5),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF2A9D8F).withOpacity(0.3),
                                    ),
                                    const BoxShadow(
                                      color: Color(0xFFFDD991),
                                      spreadRadius: -2.0,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search for chats and people...',
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF688682),
                                      fontSize: 16,
                                      fontFamily: 'Fraunces',
                                      fontWeight: FontWeight.w400,
                                      height: 1.20,
                                    ),
                                    prefixIcon: Container(
                                      width: 24,
                                      height: 24,
                                      margin: const EdgeInsets.only(left: 20, right: 12),
                                      child: Image.asset(
                                        'assets/search_icon.png',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xFF688682),
                                    fontSize: 16,
                                    fontFamily: 'Fraunces',
                                    fontWeight: FontWeight.w400,
                                    height: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                    decoration: const BoxDecoration(
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
                                return _buildChatTile(context, chat);
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

  Widget _buildChatTile(BuildContext context, ChatModel chat) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 239, 205, 1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
        border: Border.all(color: const Color.fromRGBO(114, 214, 198, 1), width: 3),
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
                          fontFamily: 'Fraunces',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontFamily: 'Fraunces',
                        ),
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
                      style: const TextStyle(
                        color: Color.fromRGBO(74, 111, 106, 1),
                        fontSize: 12,
                        fontFamily: 'Fraunces',
                      ),
                    ),
                    if (chat.unreadCount > 0) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(42, 157, 143, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          chat.unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Fraunces',
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
