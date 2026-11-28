import "@ebusd/ebus-typespec";
import "../wolf/08..hc.tsp";

/**
 * The Wolf CGx-2 burner controller (Feuerungsautomat, made by Kromschröder) reports
 * itself with manufacturer ENCON and an empty device ID, so automatic configuration
 * needs these definitions served from the encon folder as well.
 */
namespace Encon;

namespace hc {
  /** included parts */
  union _includes {
    Wolf.hc,
  }
}
