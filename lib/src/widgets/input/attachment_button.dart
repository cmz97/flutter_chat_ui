import 'package:flutter/material.dart';

import '../state/inherited_chat_theme.dart';
import '../state/inherited_l10n.dart';

/// A class that represents attachment button widget.
class AttachmentButton extends StatelessWidget {
  /// Creates attachment button widget.
  const AttachmentButton({
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.onUnPressed,
    this.padding = EdgeInsets.zero,
  });

  /// Show a loading indicator instead of the button.
  final bool isLoading;

  /// Callback for attachment button tap event.
  final VoidCallback? onPressed;
  final VoidCallback? onUnPressed;

  /// Padding around the button.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        margin: InheritedChatTheme.of(context).theme.attachmentButtonMargin ??
            const EdgeInsetsDirectional.fromSTEB(
              8,
              0,
              0,
              0,
            ),
        child: Padding(
          padding: padding,
          child: GestureDetector(
            onLongPress: isLoading ? null : onPressed,
            onLongPressUp: isLoading ? null : onUnPressed,
            child: SizedBox(
              height: 24,
              width: 24,
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          InheritedChatTheme.of(context).theme.inputTextColor,
                        ),
                      ),
                    )
                  : InheritedChatTheme.of(context).theme.attachmentButtonIcon ??
                      Icon(Icons.mic,
                          color: InheritedChatTheme.of(context)
                              .theme
                              .inputTextColor),
            ),
          ),
        ),
      );
}
