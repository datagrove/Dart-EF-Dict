import 'dart:math';
import 'dart:typed_data';
import 'package:bit_array/bit_array.dart';

void main() {
  print(efCompress(values));
  print(efCompress(values2));
}

var values = [2, 3, 5, 7, 11, 13, 24];
var values2 = [1, 2, 4, 16, 24, 89, 128];

efCompress(List<int> input) {
  //sort list in ascending order
  input.sort();

  //check for negative numbers
  if (input[0].isNegative) {
    return ("EF encoding does not support negative values");
  }
  //m = last integer in the array
  //n = length of the array
  //calculate bit length for encoding ints
  var encodeBits = (log(input[(input.length - 1)]) / (log(2)))
      .ceil(); //number of bits for encoding each integer log2m rounded up

  //calculate the number of upper bits
  var upperBits = (log(input.length) / log(2)).ceil(); //log2n

  //calculate the number of lower bits
  var lowerBits = encodeBits - upperBits;

  //create lower bits
  String lowerBitsList = '';

  for (int i = 0; i < input.length; i++) {
    String allBits = input[i].toRadixString(2).padLeft(encodeBits, '0');
    String lowBits = allBits.substring(allBits.length - lowerBits);
    lowerBitsList += lowBits;
  }

  //create higher bits
  var higherBitsList =
      BitArray((2 * input.length)); //length of the higher bits is = 2n

  for (int i = 0; i < input.length; i++) {
    var j = (input[i] >> lowerBits) +
        i; //Shift the binary version of the int in the list by the lowerbits and add the index location to determine which bit should be set for this int
    higherBitsList.setBit(j); //set the bit at location j to 1
  }

  String efList =
      higherBitsList.toBinaryString().substring(0, (2 * input.length)) +
          lowerBitsList;
  return [efList, lowerBits, input.length];
}

efExpand(List<String> higherLowerBits) {}
