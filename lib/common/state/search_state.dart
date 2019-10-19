import 'package:kids_dictionary/common/model/word_details.dart';
import 'package:redux/redux.dart';
class SearchState{
  List<WordDetails> wordDetailsList;
  SearchState({this.wordDetailsList});
}

final searchStateReducer = combineReducers<SearchState>([
  TypedReducer<SearchState, SearchOnResultAction>(_searchOnResult),
]);

SearchState _searchOnResult(SearchState searchState, SearchOnResultAction action){
  return SearchState(wordDetailsList: action.wordDetailsList);
}

class SearchOnResultAction{
  final List<WordDetails> wordDetailsList;
  SearchOnResultAction(this.wordDetailsList);
}