import 'dart:math';
import 'dart:typed_data';

void main() {
  print(upperBits);
}

var values = [2, 3, 5, 7, 11, 13, 24];
var encodeBits = (log(values[(values.length - 1)]) / (log(2))).ceil();
var upperBits = (log(values.length) / log(2)).ceil();
var lowerBits = encodeBits - upperBits;

efCompress() {
  //sort list in ascending order
}
