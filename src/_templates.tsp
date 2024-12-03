import "@ebusd/ebus-typespec";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

/** start counter */
scalar cntstarts extends BCD3;

/** operation minutes */
@unit("min")
scalar cntminutes extends BCD;

/** operation hours */
@unit("h")
scalar cnthours extends BCD3;

/** fuel quantity */
scalar cntfuel extends BCD4;

/** unit */
@values(Values_unit)
scalar unit extends UCH;

/** fuel type */
@values(Values_fueltype)
scalar fueltype extends UCH;

/** type of meter */
@values(Values_countertype)
scalar countertype extends UCH;

/** cyclic transmission */
@values(Values_opdatacyclic)
scalar opdatacyclic extends UCH;

/** data transmission */
@values(Values_opdatatransfer)
scalar opdatatransfer extends UCH;

/** heat request */
@values(Values_opdataheat)
scalar opdataheat extends UCH;

@values(Values_opdataaction)
scalar opdataaction extends UCH;

/** desired temperature */
@unit("°C")
scalar desiredtemp extends UCH;

/** outside temperature */
@unit("°C")
scalar outsidetemp extends SCH;

@unit("%")
scalar percent extends D2C;

@unit("%")
scalar percent0 extends UCH;

@unit("%")
scalar percent1 extends D1C;

@unit("%")
scalar percent2 extends D2B;

@unit("%")
scalar percents extends SCH;

/** temperature */
@unit("°C")
scalar temp extends D2C;

/** temperature */
@unit("°C")
scalar temp0 extends UCH;

/** temperature */
@unit("°C")
scalar temp1 extends D1C;

/** temperature */
@unit("°C")
scalar temp2 extends D2B;

/** pressure */
@unit("bar")
scalar press extends D2B;

/** time */
scalar btime extends BTI;

/** date */
scalar bdate extends BDA;

/** weekday */
scalar bday extends BDY;
// id,STR:5,device ID

/** version */
scalar version extends PIN;

@maxLength(1)
scalar skip extends IGN;

enum Values_unit {
  all: 0,
  l: 1,
  m3: 2,
}

enum Values_fueltype {
  any: 0,
  oil: 1,
  gas: 2,
}

enum Values_countertype {
  starts: 0,
  hours1: 1,
  hours2: 2,
  hours3: 3,
  hours4: 4,
  modulating: 5,
  fuelquantity: 16,
}

enum Values_opdatacyclic {
  stop: 0x55,
  start: 0xaa,
}

enum Values_opdatatransfer {
  stop: 0,
  cyclic: 1,
  event: 2,
  single: 3,
  cyclicandevent: 3,
}

enum Values_opdataheat {
  off: 0x00,
  none: 0x01,
  hotwater: 0x55,
  heating: 0xaa,
  emissioncheck: 0xcc,
  qualitycontrol: 0xdd,
  controlstop: 0xee,
  hotwaterincontrolstop: 0x66,
  hotwaterinheating: 0xbb,
  controlstopinstage: 0x44,
}

enum Values_opdataaction {
  none: 0x00,
  stoppump: 0x01,
  startpump: 0x02,
  stopconsumer: 0x03,
  startconsumer: 0x04,
}
