#ifndef DRIVINGDATA_H
#define DRIVINGDATA_H

#include <QObject>

#include "Macros.h"

class DrivingData : public QObject
{
    Q_OBJECT
public:
    explicit DrivingData(QObject *parent = nullptr);

signals:
    void SpeedChanged();
    void ThrottleChanged();
    void TemperatureChanged();
    void FuelTankChanged();

    void LampChanged();
    void BatteryChanged();
    void WiperChanged();
    void BatteryLowChanged();
    void OilCupChanged();

    void HeadlightChanged();
    void AbsChanged();
    void ParkChanged();
    void ShelterBeltChanged();
    void CautionChanged();

    void LeftSignalChanged();
    void RightSignalChanged();

    DECLARE_MEMBER(double, Speed);
    DECLARE_MEMBER(double, Throttle);
    DECLARE_MEMBER(double, Temperature);
    DECLARE_MEMBER(double, FuelTank);

    DECLARE_MEMBER(bool, Lamp);
    DECLARE_MEMBER(bool, Battery);
    DECLARE_MEMBER(bool, Wiper);
    DECLARE_MEMBER(bool, BatteryLow);
    DECLARE_MEMBER(bool, OilCup);

    DECLARE_MEMBER(bool, Headlight);
    DECLARE_MEMBER(bool, Abs);
    DECLARE_MEMBER(bool, Park);
    DECLARE_MEMBER(bool, ShelterBelt);
    DECLARE_MEMBER(bool, Caution);

    DECLARE_MEMBER(bool, LeftSignal);
    DECLARE_MEMBER(bool, RightSignal);

    Q_PROPERTY(double speed READ GetSpeed NOTIFY SpeedChanged)
    Q_PROPERTY(double throttle READ GetThrottle NOTIFY ThrottleChanged)
    Q_PROPERTY(double temperature READ GetTemperature NOTIFY TemperatureChanged)
    Q_PROPERTY(double fuelTank READ GetFuelTank NOTIFY FuelTankChanged)

    Q_PROPERTY(bool lamp READ GetLamp WRITE SetLamp NOTIFY LampChanged)
    Q_PROPERTY(bool battery READ GetBattery WRITE SetBattery NOTIFY BatteryChanged)
    Q_PROPERTY(bool wiper READ GetWiper WRITE SetWiper NOTIFY WiperChanged)
    Q_PROPERTY(bool batteryLow READ GetBatteryLow WRITE SetBatteryLow NOTIFY BatteryLowChanged)
    Q_PROPERTY(bool oilCup READ GetOilCup WRITE SetOilCup NOTIFY OilCupChanged)

    Q_PROPERTY(bool headlight READ GetHeadlight WRITE SetHeadlight NOTIFY HeadlightChanged)
    Q_PROPERTY(bool abs READ GetAbs WRITE SetAbs NOTIFY AbsChanged)
    Q_PROPERTY(bool park READ GetPark WRITE SetPark NOTIFY ParkChanged)
    Q_PROPERTY(bool shelterBelt READ GetShelterBelt WRITE SetShelterBelt NOTIFY ShelterBeltChanged)
    Q_PROPERTY(bool caution READ GetCaution WRITE SetCaution NOTIFY CautionChanged)

    Q_PROPERTY(bool leftSignal READ GetLeftSignal NOTIFY LeftSignalChanged)
    Q_PROPERTY(bool rightSignal READ GetRightSignal NOTIFY RightSignalChanged)
};

#endif // DRIVINGDATA_H
