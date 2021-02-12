// v1: Version 1 of the paradox, without using mathematical calculation.

import 'dart:io';
import 'dart:math';

bool isLeap(int year) {
  if (year % 400 == 0) {
    return true;
  } else {
    if (year % 4 == 0 && year % 100 != 0) {
      return true;
    } else {
      return false;
    }
  }
}

List<DateTime> generateBirthdays() {
  List<DateTime> birthdays = new List<DateTime>();
  Random rand = new Random();
  //int YEAR = rand.nextInt(2022); Use a standard year.
  const int YEAR = 1987;
  const int NUM_MONTHS = 12;
  const int BIRTHDAYS_TO_GENERATE = 23;
  int randDay = 0;
  for (var i = 0; i < BIRTHDAYS_TO_GENERATE; i++) {
    int randMonth = rand.nextInt(NUM_MONTHS) + 1; //random number 1-12
    if (randMonth == 2) {
      if (isLeap(YEAR) == true) {
        randDay =
            rand.nextInt(29) + 1; //random number 1-29 if mounth = february

      } else {
        randDay = rand.nextInt(28) + 1; //random number 1-28
      }
    } else {
      randDay = rand.nextInt(30) +
          1; //random number 1-30, and by default every month outside February will have 30 days.
    }
    birthdays.add(new DateTime(YEAR, randMonth, randDay));
  }
  return birthdays;
}

//Return true if l has duplicate elements

bool constainsDuplicates(List l) {
  for (int i = 0; i < l.length; i++) {
    if (l.skip(i + 1).contains(l[i])) {
      return true;
    }
  }
  return false;
}

void main() {
  /* 
///Test 
 if (isLeap(1992) == true) {
    print("Leap");
  } else {
    print("NonLeap");
  }*/

  const int ITERATIONS = 10000;
  List<DateTime> birthdays;
  int matches = 0;

  for (int i = 0; i < ITERATIONS; i++) {
    birthdays = generateBirthdays(); //create new list of birthdays

    //print("${birthdays}\n"); view content

    if (constainsDuplicates(birthdays)) {
      matches++;
    }
  }
  print(
      "There were at least two people with the same birthday ${(matches / ITERATIONS) * 100}% of the time");
}
