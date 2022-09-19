import 'dart:math';
import 'dart:typed_data';

void main() {
  print(efCompress(values));
}

var values = [2, 3, 5, 7, 11, 13, 24];

efCompress(List<int> input) {
  //sort list in ascending order
  input.sort();

  //check for negative numbers
  if (input[0].isNegative) {
    return ("EF encoding does not support negative values");
  }

  //calculate length of EF dictionary
  var encodeBits = (log(values[(values.length - 1)]) / (log(2))).ceil();

  //calculate the number of upper bits
  var upperBits = (log(values.length) / log(2)).ceil();

  //calculate the number of lower bits
  var lowerBits = encodeBits - upperBits;

  //create lower bits
  String lowerBitsList = '';

  for (int i = 0; i < values.length; i++) {
    String allBits = input[i].toRadixString(2);
    String lowBits = allBits.substring(allBits.length - lowerBits);
    lowerBitsList += lowBits;
  }

  return lowerBitsList;
}
