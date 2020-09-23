import 'dart:ui';

enum Classification{
  Freshmem,
  Sophomore, 
  Junior,
  Senior,
  Graduate,

}
enum Major{
  CS,
  SE,
  Other,

}
enum Language{
  Dart,
  Java,
  CPP,
}
class Profile{
  String name;
  int age;
  Classification classification;
  Major major;
  Map languages = {
    Language.Dart: false ,
    Language.Java: false,
    Language.CPP: false,
  };
  Profile({
    this.name="",
    this.age=0,
    this.classification = Classification.Freshmem,
    this.major = Major.CS,
  });

}