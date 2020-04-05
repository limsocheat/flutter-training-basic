import 'package:angkordev/models/article_model.dart';
import 'package:angkordev/models/category_model.dart';

class Config {
  static final List<CategoryModel> categories = [
    CategoryModel(
      title: 'ព័ត៌ជាតិ',
      articleCount: 5,
    ),
    CategoryModel(
      title: 'ព័ត៌មានអន្តរជាតិ',
      articleCount: 3,
    ),
    CategoryModel(
      title: 'ព័ត៌មានកីឡា',
      articleCount: 4,
    ),
    CategoryModel(
      title: 'ព័ត៌មានស្នេហា',
      articleCount: 999,
    ),
  ];

  static final List<ArticleModel> articles = [
    ArticleModel(
      1,
      'https://ylecaster.files.wordpress.com/2019/08/blackpink.jpg',
      'Blankpink in your area',
      '24th, March 2020',
    ),
    ArticleModel(
      2,
      'https://1409791524.rsc.cdn77.org/data/images/full/538679/blackpink-leave-yg.png',
      'new ablumn blackpink',
      '25th, March 2020',
    ),
    ArticleModel(
      3,
      'https://as2.ftcdn.net/jpg/02/04/51/07/500_F_204510747_bQTjvCY5gC0X4JzeNU14dllfWPEav5XM.jpg',
      'new ablumn blackpink',
      '25th, March 2020',
    ),
    ArticleModel(
      3,
      'https://st2.depositphotos.com/2100659/10094/v/950/depositphotos_100946362-stock-illustration-lion-head-vector-sign-concept.jpg',
      'new ablumn blackpink',
      '25th, March 2020',
    ),
    ArticleModel(
      3,
      'https://i.pinimg.com/originals/c1/09/73/c10973a2554dcebd540db0bd62066c62.jpg',
      'new ablumn blackpink',
      '25th, March 2020',
    ),
    ArticleModel(
      3,
      'https://i.pinimg.com/originals/33/b8/69/33b869f90619e81763dbf1fccc896d8d.jpg',
      'new ablumn blackpink',
      '25th, March 2020',
    ),
  ];
}
