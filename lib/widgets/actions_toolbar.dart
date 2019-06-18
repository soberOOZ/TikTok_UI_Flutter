import 'package:flutter/material.dart';
import 'package:tik_tok_ui/tik_tok_icons_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActionsToolbar extends StatelessWidget {

  //Full dimentions of an action
  static const double ActionWidgetSize = 60.0;

  //The size of the icon shown for social Action
  static const double ActionIconSize = 35.0;

  //The size of the share social icon
  static const double ShareActionIconSize = 25.0;

  //The size of the profile image in the follow action
  static const double ProfileImageSize = 50.0;

  //The size of the plus icon under the profile image in the follow action
  static const double PlusIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getFollowAction(),
                    _getSocialAction(icon: TikTokIcons.heart, title: '3.2m'),
                    _getSocialAction(icon: TikTokIcons.chat_bubble, title: '16.4k'),
                    _getSocialAction(icon: TikTokIcons.reply, title: 'Share', isShare: true),
                    _getMusicPlayerAction()
                  ]),
              );
  }

  Widget _getSocialAction({
    String title,
    IconData icon,
    bool isShare = false
  }) {
    return Container(
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(children: <Widget>[
        Icon(icon, size: isShare ? ShareActionIconSize : ActionIconSize, color: Colors.grey[300],),
        Padding(padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
        child: Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),),
        
      ],),
    );
  }

  Widget _getFollowAction() {
    return Container(
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Stack(
        children: [
          _getProfilePicture(),
          _getPlusIcon()
        ],
      ),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
      left: (ActionWidgetSize/2) - (ProfileImageSize/2),
      child: Container(
      height: ProfileImageSize,
      width: ProfileImageSize,
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ProfileImageSize/2),
      ),
      child: CachedNetworkImage(
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/e/e4/Virat..Kohli.jpg",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),),);
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: (ActionWidgetSize/2) - (PlusIconSize/2),
      child: Container(
        width: PlusIconSize,
        height: PlusIconSize,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 43, 84),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  LinearGradient get musicGradient => LinearGradient(
    colors: [
      Colors.grey[800],
      Colors.grey[900],
      Colors.grey[900],
      Colors.grey[800]
      ],
      stops: [0.0, 0.4, 0.6, 1.0],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  Widget _getMusicPlayerAction() {
    return Container(
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(11.0),
          height: ProfileImageSize,
          width: ProfileImageSize,
          decoration: BoxDecoration(
            gradient: musicGradient,
            borderRadius: BorderRadius.circular(ProfileImageSize/2)
          ),
          child: CachedNetworkImage(
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/e/e4/Virat..Kohli.jpg",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),)
      ],),
    );
  }
}