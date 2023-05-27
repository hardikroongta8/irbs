import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irbs/src/store/room_list_store.dart';
import '../globals/colors.dart';

import 'package:provider/provider.dart';
class RoomTile extends StatefulWidget {
  final String room;
  final bool pinned;
    const RoomTile({Key? key, required this.room,required this.pinned}) : super(key: key);

  @override
  State<RoomTile> createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  @override
  Widget build(BuildContext context) {
    final roomListProvider = Provider.of<RoomListProvider>(context);
    return Container(
      height: 48,
      margin: const EdgeInsets.only(left: 16,right: 16,bottom: 6),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Themes.tileColor,
        borderRadius: BorderRadius.circular(8), // Set the radius here
      ),
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 9,horizontal: 16),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4), // Set the radius here
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 16),
                child: Text(widget.room,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily:'Montserrat',
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
          Row(
            children:  [
              widget.pinned? IconButton(
                icon: SvgPicture.asset("packages/irbs/assets/images/pinned.svg",height: 24,width: 24,),
                onPressed: () {
                  roomListProvider.modifyPinnedRooms(widget.room);
                },
              ):IconButton(
                icon: SvgPicture.asset("packages/irbs/assets/images/unpinned.svg",height: 24,width: 24,),
                onPressed: () {
                  roomListProvider.modifyPinnedRooms(widget.room);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 19,),
                child: IconButton(
                  icon: const Icon(Icons.more_vert,color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ],
          )
        ],


      ),


    );;
  }
}
class RoomDisplay extends StatefulWidget {
  final List<String> type;
  final bool pinned;
  RoomDisplay({Key? key, required this.type, required this.pinned}) : super(key: key);

  @override
  State<RoomDisplay> createState() => _RoomDisplayState();
}

class _RoomDisplayState extends State<RoomDisplay> {
  @override
  Widget build(BuildContext context) {
    widget.type.sort();
    return widget.type.isEmpty ? const SizedBox():ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.type.length,
        itemBuilder: (context,index){
          return RoomTile(room: widget.type[index], pinned: widget.pinned);
        }
    );
  }
}