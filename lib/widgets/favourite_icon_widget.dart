import 'package:angkordev/controllers/favourite_controller.dart';
import 'package:flutter/material.dart';

class FavouriteIconWidget extends StatefulWidget {
  final int postId;
  final bool overrideValue;
  static bool isFavourite = false;

  const FavouriteIconWidget({
    Key key,
    this.postId,
    this.overrideValue,
  }) : super(key: key);

  @override
  _FavouriteIconWidgetState createState() => _FavouriteIconWidgetState();
}

class _FavouriteIconWidgetState extends State<FavouriteIconWidget> {
  bool isFavourite = false;

  @override
  void didUpdateWidget(FavouriteIconWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.overrideValue == null) {
      FavouriteController.isFavourite(widget.postId).then((result) {
        if (mounted) {
          setState(() {
            isFavourite = result;
          });
          FavouriteIconWidget.isFavourite = result;
        }
      });
    } else {
      setState(() {
        isFavourite = widget.overrideValue;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.overrideValue == null) {
      FavouriteController.isFavourite(widget.postId).then((result) {
        if (mounted) {
          setState(() {
            isFavourite = result;
          });
          FavouriteIconWidget.isFavourite = result;
        }
      });
    } else {
      setState(() {
        isFavourite = widget.overrideValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isFavourite ? Icon(Icons.star) : Icon(Icons.star_border),
      onPressed: () {
        if (isFavourite) {
          FavouriteController.remove(widget.postId);
          setState(() {
            isFavourite = false;
          });
          FavouriteIconWidget.isFavourite = false;
        } else {
          FavouriteController.add(widget.postId);
          setState(() {
            isFavourite = true;
          });
          FavouriteIconWidget.isFavourite = true;
        }
      },
    );
  }
}
