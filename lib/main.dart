import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/home/screens/main_shell.dart';
import 'features/home/screens/lobby_screen.dart';
import 'features/home/screens/party_home_screen.dart';
import 'features/profile/screens/profile_screen.dart';
import 'features/profile/screens/profile_edit_screen.dart';
import 'features/profile/screens/my_profile_screen.dart';
import 'features/profile/screens/my_bag_screen.dart';
import 'features/profile/screens/medal_screen.dart';
import 'features/profile/screens/title_screen.dart';
import 'features/profile/screens/points_screen.dart';
import 'features/room/screens/audio_room_screen.dart';
import 'features/room/screens/room_settings_screen.dart';
import 'features/room/screens/big_voice_room_screen.dart';
import 'features/room/screens/kkchat_room_screen.dart';
import 'features/tasks/screens/tasks_screen.dart';
import 'features/agency/screens/agency_dashboard_screen.dart';
import 'features/leaderboard/screens/leaderboard_screen.dart';
import 'features/leaderboard/screens/charm_leaderboard_screen.dart';
import 'features/leaderboard/screens/ranking_rules_popup_screen.dart';
import 'features/vip/screens/vip_screen.dart';
import 'features/topup/screens/topup_recharge_screen.dart';
import 'features/pk/screens/pk_battle_screen.dart';
import 'features/notifications/screens/notifications_screen.dart';
import 'features/game/screens/game_rankings_screen.dart';
import 'features/game/screens/game_center_screen.dart';
import 'features/game/screens/game_level_screen.dart';
import 'features/game/screens/room_game_loading_screen.dart';
import 'features/club/screens/club_rankings_screen.dart';
import 'features/club/screens/club_reward_screen.dart';
import 'features/club/screens/club_center_screen.dart';
import 'features/club/screens/club_reward_weekly_screen.dart';
import 'features/wealth/screens/wealth_tabs_screen.dart';
import 'features/wallet/screens/get_diamonds_screen.dart';
import 'features/wallet/screens/wallet_diamonds_screen.dart';
import 'features/cp/screens/cp_rankings_screen.dart';
import 'features/cp/screens/cp_couple_home_screen.dart';
import 'features/feed/screens/moment_feed_screen.dart';
import 'features/messages/screens/chat_screen.dart';
import 'features/messages/screens/message_search_screen.dart';
import 'features/friends/screens/add_friend_screen.dart';
import 'features/search/screens/search_screen.dart';
import 'features/search/screens/search_by_id_screen.dart';
import 'features/settings/screens/settings_screen.dart';
import 'features/shop/screens/mall_store_screen.dart';
import 'features/rewards/screens/invitation_rewards_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const VoiceRoomApp());
}

class VoiceRoomApp extends StatelessWidget {
  const VoiceRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoiceRoom',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthScreen(
              onLogin: () =>
                  Navigator.pushReplacementNamed(context, '/main'),
            ),
        '/main': (context) => const MainShell(),
        '/lobby': (context) => const LobbyScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/profile-edit': (context) => const ProfileEditScreen(),
        '/my-profile': (context) => const MyProfileScreen(),
        '/my-bag': (context) => const MyBagScreen(),
        '/medals': (context) => const MedalScreen(),
        '/titles': (context) => const TitleScreen(),
        '/points': (context) => const PointsScreen(),
        '/room': (context) => const AudioRoomScreen(),
        '/room-settings': (context) => const RoomSettingsScreen(),
        '/big-voice-room': (context) => const BigVoiceRoomScreen(),
        '/kkchat-room': (context) => const KkchatRoomScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/agency': (context) => const AgencyDashboardScreen(),
        '/leaderboard': (context) => const LeaderboardScreen(),
        '/charm-leaderboard': (context) => const CharmLeaderboardScreen(),
        '/ranking-rules': (context) => const RankingRulesPopupScreen(),
        '/vip': (context) => const VipScreen(),
        '/topup': (context) => const TopupRechargeScreen(),
        '/pk-battle': (context) => const PkBattleScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/game-rankings': (context) => const GameRankingsScreen(),
        '/game-center': (context) => const GameCenterScreen(),
        '/game-level': (context) => const GameLevelScreen(),
        '/game-loading': (context) => const RoomGameLoadingScreen(),
        '/club-rankings': (context) => const ClubRankingsScreen(),
        '/club-rewards': (context) => const ClubRewardScreen(),
        '/club-center': (context) => const ClubCenterScreen(),
        '/club-reward-weekly': (context) => const ClubRewardWeeklyScreen(),
        '/wealth': (context) => const WealthTabsScreen(),
        '/get-diamonds': (context) => const GetDiamondsScreen(),
        '/wallet': (context) => const WalletDiamondsScreen(),
        '/cp-rankings': (context) => const CpRankingsScreen(),
        '/cp-home': (context) => const CpCoupleHomeScreen(),
        '/moments': (context) => const MomentFeedScreen(),
        '/chat': (context) => const ChatScreen(),
        '/message-search': (context) => const MessageSearchScreen(),
        '/add-friend': (context) => const AddFriendScreen(),
        '/search': (context) => const SearchScreen(),
        '/search-by-id': (context) => const SearchByIdScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/mall': (context) => const MallStoreScreen(),
        '/invitation-rewards': (context) => const InvitationRewardsScreen(),
        '/party-home': (context) => const PartyHomeScreen(),
      },
    );
  }
}
