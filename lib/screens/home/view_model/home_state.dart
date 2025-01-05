import 'package:equatable/equatable.dart';
import 'package:stroll/models/bonfire/bonfire.dart';
import 'package:stroll/utils/async_value.dart';

enum TabState { home, bonfire, chat, profile }

class HomeState extends Equatable {
  final TabState activeTab;
  final AsyncValue<List<Bonfire>> bonfire;
  final Map<String, String> selectedOptions;

  const HomeState({
    required this.activeTab,
    this.bonfire = const AsyncValue.loading(),
    this.selectedOptions = const {},
  });

  factory HomeState.initial() {
    return const HomeState(activeTab: TabState.home);
  }

  @override
  List<Object?> get props => [activeTab, bonfire, selectedOptions];

  HomeState copyWith({
    TabState? activeTab,
    AsyncValue<List<Bonfire>>? bonfire,
    Map<String, String>? selectedOptions,
  }) {
    return HomeState(
      activeTab: activeTab ?? this.activeTab,
      bonfire: bonfire ?? this.bonfire,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }
}
