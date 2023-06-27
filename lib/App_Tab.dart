import 'package:flutter/material.dart';

class App_Tab extends StatefulWidget {
  final String the_text;
  final String img;
  final TabController? controller;
  final int? index;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? imgColorSelected;
  final Color? imgColorUnselected;
  final bool tab;

  App_Tab({
    required this.img,
    required this.the_text,
    this.controller,
    this.index,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.white,
    this. imgColorSelected=Colors.white,
    this.imgColorUnselected=Colors.black,
    required this.tab ,
    Key? key,
  }) : super(key: key);

  @override
  _App_TabState createState() => _App_TabState();
}

class _App_TabState extends State<App_Tab> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    // Initialize the selected state based on the current index
    selected = widget.index == widget.controller?.index;
    // Add a listener to the TabController
    widget.controller?.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleTabSelection);
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      selected = widget.index == widget.controller?.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: selected? 8:2,
      borderRadius: BorderRadius.circular(22),
      child:AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      // curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected && widget.tab ? widget.selectedColor : widget.unselectedColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0,right: 24,top: 24,bottom: 10),
            child: Image(
              image: AssetImage(widget.img),
              width: 45,
              fit: BoxFit.scaleDown,
              color: selected && widget.tab? widget.imgColorSelected : widget.imgColorUnselected,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(widget.the_text,style: TextStyle(fontSize:15,color: selected && widget.tab? widget.imgColorSelected : widget.imgColorUnselected,),),
          ),
        ],
      ),
      ),
    );
  }
}
