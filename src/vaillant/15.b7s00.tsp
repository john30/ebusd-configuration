import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./15.700.tsp";  // réutilise toutes les définitions du VRC 700

using Vaillant;

/** Vaillant Mipro R (B7S00) - alias of VRC 700 */
@zz(0x15)
namespace _B7S00 extends _700 {}

