#ifndef CALCULATORSERVICE_H
#define CALCULATORSERVICE_H
#include <QObject>
#include <QString>

class CalculatorService : public QObject
{
    Q_OBJECT
public:
    explicit CalculatorService(QObject *parent = nullptr);

    Q_INVOKABLE QString evaluate(const QString &expression);
};

#endif
