import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_presentations/shared/clippers.dart';
import 'package:mobile_flutter_merchant/features/groupon_dashboard/performance/performance_state.dart';
import 'package:mobile_flutter_merchant/features/groupon_dashboard/performance/performance_tiles.dart';
import 'package:mobile_flutter_merchant/features/groupon_dashboard/static_dashboard_tile.dart';
import 'package:mobile_flutter_merchant/features/groupon_dashboard/tutorial/tutorial_sections.dart';
import 'package:mobile_flutter_merchant/features/groupon_dashboard/voucher/voucher.dart';
import 'package:mobile_flutter_merchant/generated/i18n.dart';
import 'package:mobile_flutter_merchant/shared/l10n/l10n.dart';
import 'package:presentation/effects.dart';
import 'package:presentation/presentation.dart';

class TutorialGoal extends StatefulWidget {
  const TutorialGoal(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _TutorialGoalState createState() => _TutorialGoalState();
}

enum _TutorialStep {
  init,
  graph,
  tutorial,
  next,
}

class _TutorialGoalState extends State<TutorialGoal>
    with SingleTickerProviderStateMixin {
  PageStepper<_TutorialStep> _stateController;
  AnimationController _controller;
  bool _showTutorial = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_TutorialStep>(
      controller: widget.controller,
      steps: _TutorialStep.values,
    )
      ..add(
        fromStep: _TutorialStep.init,
        toStep: _TutorialStep.graph,
        forward: _controller.forward,
        reverse: _controller.reverse,
      )
      ..add(
        fromStep: _TutorialStep.graph,
        toStep: _TutorialStep.tutorial,
        forward: () => setState(() => _showTutorial = true),
        reverse: () => setState(() => _showTutorial = false),
      )
      ..add(
        fromStep: _TutorialStep.tutorial,
        toStep: _TutorialStep.next,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ParallaxWidget(
            child: Center(
              child: _showTutorial
                  ? Image.asset('assets/new.png')
                  : Text(
                      'Feature Reveal',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title,
                    ),
            ),
          ),
        ),
        Expanded(
          child: WrappedAnimatedBuilder<Rect>(
            animation: RectTween(
              begin: Rect.fromLTRB(0, 0, 1, 1),
              end: Rect.fromLTRB(0, 0.31, 1, 0.61),
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
            )),
            builder: (_, animation, child) {
              return ClipRect(
                clipper: ClipperRect(animation.value),
                child: child,
              );
            },
            child: Image.asset('assets/dashboard.png'),
          ),
        ),
      ],
    );
  }
}

class TutorialResult extends StatefulWidget {
  const TutorialResult(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _TutorialResultState createState() => _TutorialResultState();
}

enum _Step {
  init,
  image,
  graph,
  next,
}

class _TutorialResultState extends State<TutorialResult>
    with SingleTickerProviderStateMixin {
  PageStepper<_Step> _stateController;
  AnimationController _controller;
  bool _showImage = false;
  bool _showGraph = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _stateController = PageStepper<_Step>(
      controller: widget.controller,
      steps: _Step.values,
    )
      ..add(
        fromStep: _Step.init,
        toStep: _Step.image,
        forward: () => setState(() => _showImage = true),
        reverse: () => setState(() => _showImage = false),
      )
      ..add(
        fromStep: _Step.image,
        toStep: _Step.graph,
        forward: () => setState(() => _showGraph = true),
        reverse: () => setState(() => _showGraph = false),
      )
      ..add(
        fromStep: _Step.graph,
        toStep: _Step.next,
        forward: () => widget.controller.nextSlide(),
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: _showImage ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Image.asset(
                    'assets/performance.png',
                    width: 245,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _showGraph
                  ? AnimatedOpacity(
                      opacity: _showGraph ? 1 : 0,
                      duration: Duration(milliseconds: 100),
                      child: _GL10n(
                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Align(
                            child: _GPerformance(),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(0, 80),
          child: Row(
            children: [
              Expanded(
                child: AnimatedOpacity(
                  opacity: _showImage ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Text(
                    'Image',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: AnimatedOpacity(
                  opacity: _showGraph ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Text(
                    'Widget',
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GPerformance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClippedTutorialWidget(
      color: const Color.fromRGBO(223, 125, 119, 1.0),
      child: Transform.translate(
        offset: Offset(60, 60),
        child: OverflowBox(
          maxHeight: double.infinity,
          maxWidth: 500,
          alignment: Alignment.topLeft,
          child: TileWrapper(
            child: StaticDashboardTile(
              isLoaded: true,
              placeholder: SizedBox(),
              child: VoucherWidget(
                VoucherStats(
                  soldCount: 3528,
                  redeemedCount: 1900,
                  expiredCount: 200,
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GL10n extends StatelessWidget {
  const _GL10n({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CupertinoLocalizationsDelegate()
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: translationResolution(Locale('en', '')),
      home: child,
    );
  }
}
