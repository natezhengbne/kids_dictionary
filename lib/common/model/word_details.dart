
import 'package:floor/floor.dart';

@Entity(tableName: 'WordDetails', indices: [Index(value: ['headWord'])])
class WordDetails  {
  @primaryKey
  final String id;
  final String headWord;
  final String pronunciation;
  final String spillingAdvice;
  final String partOfSpeech;
  final String definition;
  final String wordBuilding;
  final String extraInformation;
  final String sup;
  final String endingOfWordChanged;

  WordDetails(this.id, this.headWord, this.pronunciation, this.spillingAdvice,
      this.partOfSpeech, this.definition, this.wordBuilding,
      this.extraInformation, this.sup, this.endingOfWordChanged);

}