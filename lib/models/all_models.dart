import 'package:age/age.dart';

class CurrentAge {
  int years = 0, months = 0, day = 0;
  @override
  String toString() {
    return "Age : $years - $months - $day";
  }
}

class NextBirth {
  int months = 0, day = 0;
  @override
  String toString() {
    return "NAge : $months - $day";
  }
}

class AgeCalculator {
  CurrentAge calculateAge(DateTime birthDate, DateTime todayDate) {
    AgeDuration age;


    age = Age.dateDifference(
        fromDate: birthDate, toDate: todayDate, includeToDate: false);

    CurrentAge currentAge = CurrentAge();
    currentAge.years = age.years;
    currentAge.months = age.months;
    currentAge.day = age.days;
    return currentAge;
  }

  NextBirth calculateNextBirth(DateTime birthDate, DateTime todayDate) {
    DateTime tempDate =
        DateTime(todayDate.year, birthDate.month, birthDate.day);
    DateTime nextBirthdayDate = tempDate.isBefore(todayDate)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration =
        Age.dateDifference(fromDate: todayDate, toDate: nextBirthdayDate);

    NextBirth birth = NextBirth();
    birth.months = nextBirthdayDuration.months;
    birth.day = nextBirthdayDuration.days;
    return birth;
  }
}
