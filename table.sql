CREATE TABLE flightinfo (
        _year INTEGER,
        _month INTEGER,
        dayofmonth INTEGER,
        dayofweek INTEGER,
        deptime VARCHAR(4),
        crsdeptime INTEGER,
        arrtime VARCHAR(4),
        crsarrtime INTEGER,
        uniquecarrier VARCHAR(10),
        flightnum INTEGER,
        tailnum VARCHAR(7),
        actualelapsedtime VARCHAR(4),
        crselapsedtime VARCHAR(6),
        airtime VARCHAR(6),
        arrdelay VARCHAR(5),
        depdelay VARCHAR(5),
        origin VARCHAR(3),
        dest VARCHAR(3),
        distance VARCHAR(6),
        taxiin VARCHAR(6),
        taxiout VARCHAR(6),
        cancelled BOOLEAN,
        cancellationcode VARCHAR(2),
        diverted BOOLEAN,
        carrierdelay VARCHAR(6),
        weatherdelay VARCHAR(6),
        nasdelay VARCHAR(6),
        securitydelay VARCHAR(6),
        lateaircraftdelay VARCHAR(6)
);