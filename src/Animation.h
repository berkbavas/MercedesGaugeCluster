#pragma once

#include "DrivingData.h"

#include <QObject>
#include <QTimer>

class Animation : public QObject
{
    Q_OBJECT
public:
    explicit Animation(QObject *parent = nullptr);

    void SetData(DrivingData *Data) { mData = Data; }
    void SetBlinkIndicator(bool blink) { mBlink = blink; }

public slots:
    void Update();
    void Init();

private:
    double getSignal(double speed);

    QTimer mTimer;
    double mTime;
    DrivingData *mData{nullptr};
    bool mBlink{false};

    static constexpr double TICK_INTERVAL_MS = 10.0;
    static constexpr double ANIMATION_SPEED = 0.5;
};
