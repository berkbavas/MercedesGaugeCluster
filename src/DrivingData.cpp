#include "DrivingData.h"

#include <cmath>

DrivingData::DrivingData(QObject *parent)
    : QObject{parent}
{}

DEFINE_SET_METHOD(DrivingData, double, Speed)
DEFINE_SET_METHOD(DrivingData, double, Throttle)
DEFINE_SET_METHOD(DrivingData, double, Temperature)
DEFINE_SET_METHOD(DrivingData, double, FuelTank)

DEFINE_SET_METHOD_BOOL(DrivingData, bool, Lamp)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, Battery)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, Wiper)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, BatteryLow)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, OilCup)

DEFINE_SET_METHOD_BOOL(DrivingData, bool, Headlight)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, Abs)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, Park)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, ShelterBelt)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, Caution)

DEFINE_SET_METHOD_BOOL(DrivingData, bool, LeftSignal)
DEFINE_SET_METHOD_BOOL(DrivingData, bool, RightSignal)
