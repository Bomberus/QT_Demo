#ifndef PROFILE_H
#define PROFILE_H
#include <QObject>

class Profile : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
public:
    explicit Profile();
    ~Profile();
    QString name() const;
    void setName(QString);
signals:
    void nameChanged();
private:
    QString m_name;
};

#endif // PROFILE_H
