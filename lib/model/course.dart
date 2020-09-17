class Course {
  String number;
  String title;
  String prereq;
  String imageUrl;
  bool selected;
  Course(
      {this.imageUrl,
      this.number,
      this.prereq,
      this.title,
      this.selected = false});
}

var courseList = [
  Course(
    number: 'CMSC 1613',
    title: 'Programming I',
    prereq: 'CMSC 1513',
    imageUrl: 'https://m.media-amazon.com/images/I/41iNYFT2syL._AC_UL320_.jpg',
  ),
  Course(
    number: 'CMSC 2613',
    title: 'Programming II',
    prereq: 'CMSC 1613',
    imageUrl: 'https://m.media-amazon.com/images/I/61O3ETDDNEL._AC_UL320_.jpg',
  ),
  Course(
    number: 'CMSC 3613',
    title: 'Data Structures',
    prereq: 'CMSC 2613',
    imageUrl: 'https://m.media-amazon.com/images/I/81jMGG8Rp8L._AC_UL320_.jpg',
  ),
  Course(
    number: 'CMSC 4323',
    title: 'Copmuter & Network Security',
    prereq: 'CMSC 3613',
    imageUrl: 'https://m.media-amazon.com/images/I/71exZLKmUNL._AC_UY218_.jpg',
  ),
  Course(
    number: 'CMSC 4513',
    title: 'Software Design & Development',
    prereq: 'CMSC 4323',
    imageUrl: 'https://m.media-amazon.com/images/I/51837I6FOCL._AC_UL320_.jpg',
  ),
];
