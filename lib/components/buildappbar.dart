import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget getAppBar(double viabilityScore) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))),
    // color: Colors.white,
    height: 140.0,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 120.0,
                height: 110.0,
                child: Expanded(
                  child: getRadialGauge(viabilityScore),
                ),
              ),
              const Expanded(
                child: SizedBox(width: 100),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getRadialGauge(double viabilityScore) {
  return SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 1000,
        startAngle: 135,
        endAngle: 45,
        showTicks: false,
        showLabels: false,
        axisLineStyle: const AxisLineStyle(
          // cornerStyle: CornerStyle.startCurve,
          thickness: 5.0,
        ),
        pointers: <GaugePointer>[
          RangePointer(
            enableAnimation: true,
            cornerStyle: CornerStyle.bothCurve,
            value: viabilityScore,
            width: 0.3,
            pointerOffset: -0.09,
            sizeUnit: GaugeSizeUnit.factor,
            gradient: const SweepGradient(
              colors: <Color>[
                Color(0xFFCC2B5E),
                Color(0xFF753A88),
              ],
              // stops: <double>[0.25, 0.75],
            ),
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Column(
                children: <Widget>[
                  Container(
                      width: 70.00,
                      height: 70.00,
                      decoration: const BoxDecoration()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Text(
                      viabilityScore.round().toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  )
                ],
              ),
              angle: 270,
              positionFactor: 0.8)
        ],
      ),
    ],
  );
}