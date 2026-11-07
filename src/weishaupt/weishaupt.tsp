import "./weishaupt.js";

/**
 * Define the extension message ID to be combined with a base ID.
 * @param dd message ID extensions parts.
 */
extern dec crcext(target: TypeSpec.Reflection.Model, ...dd: valueof uint8[]);

/**
 * Like @crcext, but for messages whose Weishaupt CRC-8 must be computed at runtime
 * (register writes, where the CRC depends on the value being sent). Emits a placeholder
 * first ID byte (0x00); ebusd replaces it with the real CRC at send time and verifies it
 * on receipt, for any message whose comment carries the WCRC marker. See ebusd issue #167.
 * @param dd message ID extension parts (without the CRC byte).
 */
extern dec wcrc(target: TypeSpec.Reflection.Model, ...dd: valueof uint8[]);
extern dec appendext(target: TypeSpec.Reflection.Model, ll: valueof uint8, ...dd: valueof uint8[]);
