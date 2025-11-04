#include "calculatorservice.h"
#include <QJSEngine>
#include <QJSValue>
#include <QDebug>
#include <stack>

CalculatorService::CalculatorService(QObject *parent) : QObject(parent) {}

QString CalculatorService::evaluate(const QString &expression)
{
    std::stack<double> numbers;
    char ops = '\0';

    QString numberBuffer;

    for (int i = 0; i < expression.size(); ++i) {
        QChar it = expression[i];

        if (i == 0 && it == '-') {
            numberBuffer += it;
            continue;
        }

        if (it == '/' || it == '*' || it == '-' || it == '+') {
            ops = it.toLatin1();

            if (!numberBuffer.isEmpty()) {
                numbers.push(numberBuffer.toDouble());
                numberBuffer.clear();
            }
        }
        else {
            numberBuffer += it;
        }
    }

    if (!numberBuffer.isEmpty()) {
        numbers.push(numberBuffer.toDouble());
    }

    if (numbers.size() < 2) {
        return expression;
    }

    if (ops == '\0') {
        return expression;
    }

    double result;

    double num2 = numbers.top(); numbers.pop();
    double num1 = numbers.top(); numbers.pop();

    switch(ops) {
        case '/' : {
            result = num1 / num2;
            break;
        }
        case '*' : {

            result = num1 * num2;
            break;
        }
        case '+' : {
            result = num1 + num2;
            break;
        }
        case '-' : {
            result = num1 - num2;
            break;
        }
    }

    return QString::number(result, 'g', 6);
}
