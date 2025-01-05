import 'package:equatable/equatable.dart';
import 'package:stroll/models/bonfire/bonfire.dart';
import 'package:stroll/utils/async_value.dart';

enum TabState { home, bonfire, chat, profile }

class HomeState extends Equatable {
  final TabState activeTab;
  final AsyncValue<List<Bonfire>> bonfire;
  final Map<String, String> selectedOptions;
  final Map<String, bool> isSendingResponse;
  final bool hasUnseenBonfires;
  final int currentBonfirePageIndex;

  const HomeState({
    required this.activeTab,
    this.bonfire = const AsyncValue.loading(),
    this.selectedOptions = const {},
    this.isSendingResponse = const {},
    this.hasUnseenBonfires = true,
    this.currentBonfirePageIndex = 0,
  });

  factory HomeState.initial() {
    return const HomeState(activeTab: TabState.home);
  }

  @override
  List<Object?> get props => [
        activeTab,
        bonfire,
        selectedOptions,
        isSendingResponse,
        hasUnseenBonfires,
        currentBonfirePageIndex,
      ];

  HomeState copyWith({
    TabState? activeTab,
    AsyncValue<List<Bonfire>>? bonfire,
    Map<String, String>? selectedOptions,
    bool? hasUnseenBonfires,
    Map<String, bool>? isSendingResponse,
    int? currentBonfirePageIndex,
  }) {
    return HomeState(
      activeTab: activeTab ?? this.activeTab,
      bonfire: bonfire ?? this.bonfire,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      hasUnseenBonfires: hasUnseenBonfires ?? this.hasUnseenBonfires,
      isSendingResponse: isSendingResponse ?? this.isSendingResponse,
      currentBonfirePageIndex:
          currentBonfirePageIndex ?? this.currentBonfirePageIndex,
    );
  }
}
