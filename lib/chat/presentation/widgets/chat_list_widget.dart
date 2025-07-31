import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_bloc.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_event.dart';
import 'package:feature_integration/chat/presentation/bloc/chat_list_state.dart';
import 'package:feature_integration/chat/data/models/chat_model.dart';
import 'package:feature_integration/core/core.dart';

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
    StatusBarConfig.setSecondaryStatusBar();
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: AppSizes.headerHeight,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: AppSpacing.headerPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppSizes.loungeContainerWidth,
                          height: AppSizes.loungeContainerHeight,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: AppSizes.loungeContainerWidth,
                                  height: AppSizes.loungeContainerHeight,
                                  decoration: const ShapeDecoration(
                                    color: AppColors.secondaryLight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(AppSizes.borderRadiusMedium),
                                        topRight: Radius.circular(AppSizes.borderRadiusXXL),
                                        bottomLeft: Radius.circular(AppSizes.borderRadiusMedium),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 17,
                                top: 17,
                                child: Text(
                                  AppConstants.loungeText,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.headingLarge,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: AppSizes.addChatButtonWidth,
                          height: AppSizes.addChatButtonHeight,
                          padding: const EdgeInsets.only(
                            top: 6,
                            left: 16,
                            right: 16,
                            bottom: 20,
                          ),
                          decoration: const ShapeDecoration(
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: AppSizes.borderWidthThin,
                                color: AppColors.primaryLight,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(AppSizes.borderRadiusXL),
                                bottomRight: Radius.circular(AppSizes.borderRadiusXL),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: AppColors.shadowPrimary,
                                blurRadius: AppSizes.shadowBlurRadius,
                                offset: Offset(0, AppSizes.shadowOffsetY),
                                spreadRadius: AppSizes.shadowSpreadRadius,
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppConstants.addChatText,
                                style: AppTextStyles.buttonPrimary,
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
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(AppSizes.borderRadiusXXXL),
                                  ),
                                  border: Border(
                                    top: BorderSide(
                                      color: AppColors.borderPrimary,
                                      width: AppSizes.borderWidthMedium,
                                    ),
                                    left: BorderSide(
                                      color: AppColors.borderPrimary,
                                      width: AppSizes.borderWidthThick,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.borderPrimary,
                                      width: AppSizes.borderWidthMedium,
                                    ),
                                    right: BorderSide(
                                      color: AppColors.borderPrimary,
                                      width: AppSizes.borderWidthMedium,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.shadowTertiary,
                                    ),
                                    BoxShadow(
                                      color: Color(0xFFFDD991),
                                      spreadRadius: AppSizes.shadowSpreadRadiusMedium,
                                      blurRadius: AppSizes.shadowBlurRadiusMedium,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: AppConstants.searchHintText,
                                    hintStyle: AppTextStyles.searchHint,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Container(
                                        width: AppSizes.searchIconSize,
                                        height: AppSizes.searchIconSize,
                                        margin: const EdgeInsets.only(
                                          left: 20,
                                          right: 0,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          AppConstants.searchIconPath,
                                          width: AppSizes.searchIconSize,
                                          height: AppSizes.searchIconSize,
                                          color: AppColors.textTertiary,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: AppSpacing.searchPadding,
                                  ),
                                  style: AppTextStyles.searchInput,
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

            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      AppConstants.backgroundImagePath,
                      width: AppSizes.backgroundImageWidth,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: AppSpacing.chatListPadding,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundLight,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(AppSizes.borderRadiusXXL),
                          bottomLeft: Radius.circular(AppSizes.borderRadiusXXL),
                        ),
                      ),
                      child: BlocBuilder<ChatListBloc, ChatListState>(
                        builder: (context, state) {
                          switch (state.status) {
                            case ChatListStatus.initial:
                              return const Center(child: Text(AppConstants.initialText));

                            case ChatListStatus.loading:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ChatListStatus.success:
                              return ListView.builder(
                                itemCount: state.chats.length,
                                shrinkWrap: true,
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
                                      size: AppSizes.errorIconSize,
                                      color: Colors.red,
                                    ),
                                    AppSpacing.spaceM,
                                    Text('${AppConstants.errorPrefix}${state.errorMessage}'),
                                    AppSpacing.spaceM,
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<ChatListBloc>().add(
                                          const ChatListEvent.fetchAllChats(),
                                        );
                                      },
                                      child: const Text(AppConstants.retryText),
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
      ),
    );
  }

  Widget _buildChatTile(BuildContext context, ChatModel chat) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.borderRadiusLarge),
              bottomLeft: Radius.circular(AppSizes.borderRadiusLarge),
            ),
            border: Border.all(
              color: AppColors.primaryLight,
              width: AppSizes.borderWidthExtraThick,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSecondary,
                spreadRadius: AppSizes.shadowSpreadRadiusSmall,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
              onTap: () {},
              child: Padding(
                padding: AppSpacing.chatTilePadding,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: AppSizes.avatarSize,
                          height: AppSizes.avatarSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.borderPrimary),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.shadowSecondary,
                                spreadRadius: AppSizes.shadowSpreadRadiusSmall,
                                blurRadius: AppSizes.shadowBlurRadiusSmall,
                                offset: Offset(0, AppSizes.shadowOffsetYSmall),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(chat.avatarUrl),
                            radius: AppSizes.avatarRadius,
                          ),
                        ),
                        if (chat.isOnline)
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: Container(
                              width: AppSizes.onlineIndicatorSize,
                              height: AppSizes.onlineIndicatorSize,
                              decoration: BoxDecoration(
                                color: AppColors.online,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.onlineBorder,
                                  width: AppSizes.borderWidthThin,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    AppSpacing.spaceHorizontalS,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chat.name,
                                style: AppTextStyles.chatName,
                              ),

                              Text(
                                chat.timestamp,
                                style: AppTextStyles.chatTimestamp,
                              ),
                            ],
                          ),
                          AppSpacing.spaceXS,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chat.lastMessage,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.chatLastMessage,
                              ),

                              if (chat.unreadCount > 0) ...[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.unreadBadgePadding,
                                    vertical: AppSizes.unreadBadgePadding,
                                  ),
                                  width: AppSizes.unreadBadgeSize,
                                  height: AppSizes.unreadBadgeSize,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      chat.unreadCount.toString(),
                                      style: AppTextStyles.unreadCount,
                                    ),
                                  ),
                                ),
                              ],
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
        ),

        AppSpacing.spaceM,
      ],
    );
  }
}
