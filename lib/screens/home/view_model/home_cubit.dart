import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll/core/injection_container.dart';
import 'package:stroll/repository/bonfire_repository.dart';
import 'package:stroll/screens/home/view_model/home_state.dart';
import 'package:stroll/utils/async_value.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeState.initial());
  final BonfireRepository _bonfireRepository = sl.get<BonfireRepository>();
  void updateTab(int index) {
    emit(
      state.copyWith(activeTab: TabState.values[index]),
    );
    switch (TabState.values[index]) {
      case TabState.bonfire:
        initializeBonfire();
        break;
      default:
    }
  }

  Future initializeBonfire() async {
    try {
      if (state.bonfire.data != null) {
        return;
      }
      if (state.bonfire.error != null) {
        emit(state.copyWith(bonfire: const AsyncValue.loading()));
      }
      final bonfire = await _bonfireRepository.getBonfires();
      emit(state.copyWith(
        bonfire: AsyncValue.data(bonfire),
        hasUnseenBonfires: false,
      ));
    } catch (e) {
      emit(state.copyWith(bonfire: AsyncValue.error(e.toString())));
    }
  }

  void selectOption(String bonfireId, String optionId) {
    final newOptions = {...state.selectedOptions};
    newOptions[bonfireId] = optionId;
    emit(state.copyWith(selectedOptions: newOptions));
  }

  Future submitAnswer(
      String bonfireId, Future Function() dismissTrigger) async {
    if (state.isSendingResponse[bonfireId] == true ||
        state.selectedOptions[bonfireId] == null) {
      return;
    }
    emit(state.copyWith(
      isSendingResponse: {...state.isSendingResponse, bonfireId: true},
    ));
    await _bonfireRepository.submitResponse(
        bonfireId, state.selectedOptions[bonfireId]!);
    await dismissTrigger();
    final newOptions = {...state.selectedOptions};
    final newBonfireList = [...state.bonfire.data!];
    newOptions.remove(bonfireId);
    newBonfireList.removeWhere((item) => item.id == bonfireId);
    emit(state.copyWith(
      bonfire: AsyncValue.data(newBonfireList),
      selectedOptions: newOptions,
      isSendingResponse: {...state.isSendingResponse, bonfireId: false},
    ));
  }
}
