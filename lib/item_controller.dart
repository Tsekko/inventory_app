import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/item_state.dart';

final itemControllerProvider = StateNotifierProvider<ItemController, ItemState>((ref) {
  return ItemController(const ItemState());
});

class ItemController extends StateNotifier<ItemState> {
  ItemController(ItemState state) : super(state);

  void updateQty(int qty) {
    state = state.copyWith(qty: qty);
  }

  void updateTitle(String title) {
    state = state.copyWith(name: title);
  }

  @override
  void dispose() {
    super.dispose();
  }
}