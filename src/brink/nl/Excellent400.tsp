import "@ebusd/ebus-typespec";

using ebus;

@device("Brink Renovent Excellent 400", 0x7c, 0x3c)
namespace brink {

  // ==========================================
  // ENUMS & DEFINITIES
  // ==========================================
  enum ResetMeldingenStatus {
    NoResetRequested: 0x0000,
    Filter: 0x0001,
    Errors: 0x0100,
    ErrorsAndFilter: 0x0101
  }

  enum VentilatorModeU32 {
    Holiday: 0x0,
    Reduced: 0x00010001,
    Normal: 0x00020002,
    High: 0x00030003
  }

  enum VentilatorModeU16 {
    Holiday: 0,
    Reduced: 1,
    Normal: 2,
    High: 3
  }

  enum VentilatorModeStatusU8 {
    Holiday: 0,
    Reduced: 1,
    Normal: 2,
    High: 3,
    Auto: 4
  }

  enum SysteemStatus {
    Initializing: 0,
    Off: 1,
    On: 2
  }

  enum BypassStatusEnum {
    Initializing: 0,
    Opening: 1,
    Closing: 2,
    Open: 3,
    Closed: 4,
    Error: 5,
    Calibrating: 6
  }

  enum FilterStatusEnum {
    Clean: 0,
    Dirty: 1
  }

  // ==========================================
  // GEMEENSCHAPPELIJKE HRU COMMANDO'S
  // ==========================================
  @id(0x40)
  @comment("Algemene opdrachten en statuswijzigingen")
  interface AlgemeneCommandos {
    
    @msg(0xff)
    @write
    op FabrieksinstellingenInstellen(data: numeric): void;

    @msg(0x91)
    @write
    op ResetMeldingen(status: ResetMeldingenStatus): void;

    @msg(0xa1)
    @write
    op VentilatorMode(mode: VentilatorModeU32): void;

    @msg(0xcb)
    @write
    op VentilatorModeAlternative(mode: VentilatorModeU16): void;
  }

  // ==========================================
  // HUIDIGE STAAT EN SENSOREN
  // ==========================================
  @id(0x4022)
  @comment("Actuele sensordata en systeemstatussen")
  interface ActueleSensoren {

    @msg(0x01)
    @read
    op VentilatorModeStatus(): VentilatorModeStatusU8;

    @msg(0x09)
    @read
    @unit("m³/h")
    op ToevoerFlowSetting(): numeric;

    @msg(0x0a)
    @read
    @unit("m³/h")
    op AfvoerFlowSetting(): numeric;

    @msg(0x0b)
    @read
    @unit("m³/h")
    op HuidigeToevoerFlow(): numeric;

    @msg(0x0c)
    @read
    @unit("m³/h")
    op HuidigeAfvoerFlow(): numeric;

    @msg(0x02)
    @read
    @unit("rpm")
    op HuidigeToevoerSnelheid(): numeric;

    @msg(0x03)
    @read
    @unit("rpm")
    op HuidigeAfvoerSnelheid(): numeric;

    @msg(0x00)
    @read
    op SoftwareVersie(): string;

    @msg(0x0e)
    @read
    op BypassStatus(): BypassStatusEnum;

    @msg(0x0f)
    @read
    op VoorverwarmerStatus(): SysteemStatus;

    @msg(0x10)
    @read
    @unit("%")
    op VoorverwarmVermogen(): numeric;

    @msg(0x1d)
    @read
    op NaverwarmerStatus(): SysteemStatus;

    @msg(0x1e)
    @read
    @unit("%")
    op NaverwarmerVermogen(): numeric;

    @msg(0x07)
    @read
    @unit("°C")
    @factor(0.1)
    op BinnenTemperatuur(): numeric;

    @msg(0x08)
    @read
    @unit("°C")
    @factor(0.1)
    op BuitenTemperatuur(): numeric;

    @msg(0x1a)
    @read
    @unit("°C")
    @factor(0.1)
    op OptioneleTemperatuur(): numeric;

    @msg(0x18)
    @read
    op FilterMelding(): FilterStatusEnum;

    @msg(0x20)
    @read
    @unit("%")
    @factor(0.1)
    op RelatieveVochtigheid(): numeric;

    @msg(0x14)
    @read
    @unit("Pa")
    @factor(0.1)
    op HuidigeToevoerdruk(): numeric;

    @msg(0x15)
    @read
    @unit("Pa")
    @factor(0.1)
    op HuidigeAfvoerdruk(): numeric;

    @msg(0x29)
    @read
    @unit("ppm")
    op CO2Sensor1Niveau(): numeric;

    @msg(0x2b)
    @read
    @unit("ppm")
    op CO2Sensor2Niveau(): numeric;
  }

  // ==========================================
  // CONFIGURATIEPARAMETERS
  // ==========================================
  @id(0x4080)
  @comment("Instelbare parameters van de WTW")
  interface Instellingen {

    @msg(0x21)
    @read
    @write
    op LuchtdebietStand0(@unit("m³/h") flow: numeric): void;

    @msg(0x01)
    @read
    @write
    op LuchtdebietStand1(@unit("m³/h") flow: numeric): void;

    @msg(0x02)
    @read
    @write
    op LuchtdebietStand2(@unit("m³/h") flow: numeric): void;

    @msg(0x03)
    @read
    @write
    @unit("m³/h")
    op LuchtdebietStand3(flow: numeric): void;

    @msg(0x04)
    @read
    @write
    @unit("°C")
    @factor(0.1)
    op BypassTemperatuur(temp: numeric): void;

    @msg(0x42)
    @read
    @write
    op ModbusSlaveAdres(address: numeric): void;
  }
}

