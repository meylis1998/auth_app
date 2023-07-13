import 'package:auth_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  MyButton({Key? key, this.onDisabled, this.color, this.isDisabled = false, this.onTap, this.inProgress, this.padding, this.text, this.height, this.indicatorSize, this.textSpan}) : super(key: key);

  final void Function()? onTap;
  final EdgeInsets? padding;
  final String? text;
  final bool? inProgress;
  final double? height;
  final Widget? textSpan;
  final bool isDisabled;
  final void Function()? onDisabled;
  final Color? color;
  final double? indicatorSize;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Color? _backColor;
    Color? _color;

    if (widget.color != null) {
      bool isDark = Theme.of(context).brightness == Brightness.dark;
      _color = isDark ? widget.color : Theme.of(context).textTheme.button?.color;
      _backColor = isDark ? Theme.of(context).buttonColor : widget.color;
    } else {
      _color = Theme.of(context).textTheme.button?.color;
      _backColor = Theme.of(context).buttonColor;
    }

    return Opacity(
      opacity: widget.isDisabled ? 0.5 : 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: _backColor,
          child: InkWell(
            onTap: () {
              if (!(widget.inProgress ?? false) && widget.onTap != null && !widget.isDisabled) {
                widget.onTap!();
              } else if (widget.isDisabled && widget.onDisabled != null) {}
            },
            child: Container(
              height: widget.height,
              width: double.infinity,
              padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    widget.textSpan == null
                        ? Text(
                            '${widget.text}',
                            style: GoogleFonts.rubik(
                              textStyle: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                                    color: AppConstants.whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          )
                        : widget.textSpan!
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
