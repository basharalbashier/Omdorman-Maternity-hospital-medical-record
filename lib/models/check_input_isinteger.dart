







  bool checkIfInt(String i) {
    var num = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
    ];
    bool isIt = false;
    for (int n = 0; n < num.length; n++) {
      if (i == num[n].toString()) {
        isIt = true;
      }
    }

    return isIt;
  }
