import 'package:kids_dictionary/common/state/search_state.dart';
import 'package:redux/redux.dart';
class ReduxService{
  static Store<StateController> _store;

  static void dispatch(dynamic action){
    _store.dispatch(action);
  }

  static Store getStore(){
    _store = Store<StateController>(
      reducer,
      initialState: StateController.init(),
    );
    return _store;
  }
}

StateController reducer(StateController stateController, action){
  return StateController(
    searchState: searchStateReducer(stateController.searchState, action),
  );
}

class StateController{
  SearchState searchState;
  StateController({this.searchState});

  factory StateController.init()=>
      StateController(
        searchState: SearchState(),
      );
}