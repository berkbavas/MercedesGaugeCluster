#include "Animation.h"

#include <QDateTime>
#include <QDebug>

#include <cmath>

#define M_PI 3.14159265358979323846
#define M_PI_2 1.57079632679

Animation::Animation(QObject *parent)
    : QObject(parent)
    , mTime(0.0)
{
    connect(&mTimer, &QTimer::timeout, this, &Animation::Update);
}

void Animation::Update()
{
    mTime += ANIMATION_SPEED * (TICK_INTERVAL_MS / 1000.0);

    mData->SetSpeed(240 * sin(mTime) * sin(mTime));
    mData->SetThrottle(75 * std::abs(sin(6 * mTime)));
    mData->SetFuelTank(95 * std::abs(cos(mTime)));
    mData->SetTemperature(80 + 40 * sin(mTime));

    if (mBlink) {
        double signal = getSignal(1);

        mData->SetHeadlight(0 / 11.0 < signal && signal <= 2 / 11.0);
        mData->SetBattery(1 / 11.0 < signal && signal <= 3 / 11.0);
        mData->SetWiper(2 / 11.0 < signal && signal <= 4 / 11.0);
        mData->SetBatteryLow(3 / 11.0 < signal && signal <= 5 / 11.0);
        mData->SetOilCup(4 / 11.0 < signal && signal <= 6 / 11.0);

        mData->SetLamp(5 / 11.0 < signal && signal <= 7 / 11.0);
        mData->SetAbs(6 / 11.0 < signal && signal <= 8 / 11.0);
        mData->SetPark(7 / 11.0 < signal && signal <= 9 / 11.0);
        mData->SetShelterBelt(8 / 11.0 < signal && signal <= 10 / 11.0);
        mData->SetCaution(9 / 11.0 < signal && signal <= 11 / 11.0);
    }

    double signal = getSignal(4);

    mData->SetLeftSignal(signal < 0.5);
    mData->SetRightSignal(signal < 0.5);
}

void Animation::Init()
{
    mTimer.start(TICK_INTERVAL_MS);
}

double Animation::getSignal(double speed)
{
    double integral = 0;
    const double fractional = std::modf(speed * mTime, &integral);
    return ((int) integral % 2 == 0) ? fractional : 1 - fractional;
}
