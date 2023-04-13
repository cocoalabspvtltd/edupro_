import 'package:pgs_edupro/presentation/ui/home/misc/icon_switch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:time/time.dart';

class SchoolMenuSwitch extends HookWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SchoolMenuSwitch(this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context) {
    final uncompletedSwitchState = useState(
      const IconSwitchData(
          toggle: false,
          icon: Icon(
            Icons.menu,
            // color: Colors.white,
            size: 32,
          )),
    );

    return InkResponse(
      onTap: () {
        scaffoldKey.currentState!.openDrawer();
        // final s = uncompletedSwitchState;
        // s.value = s.value.copyWith(toggle: !s.value.toggle);
        // s.value = s.value.toggle
        //     ? s.value.copyWith(
        //         icon: Icon(
        //         Icons.check_box_outline_blank,
        //         key: const Key('outline'),
        //       ))
        //     : s.value.copyWith(
        //         icon: Icon(
        //         Icons.indeterminate_check_box,
        //         key: const Key('indeterminate'),
        //       ));
        // performAction(context, uncompleted: s.value.toggle);
      },
      child: AnimatedSwitcher(
        duration: 100.milliseconds,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: uncompletedSwitchState.value.icon,
      ),
    ).padding(horizontal: 5);
  }

// void performAction(BuildContext context, {@required bool uncompleted}) {
//   context.bloc<NoteWatcherBloc>().add(
//         uncompleted
//             ? const NoteWatcherEvent.watchUncompletedStarted()
//             : const NoteWatcherEvent.watchAllStarted(),
//       );
// }
}
