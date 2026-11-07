import { Numeric, isNumeric } from "@typespec/compiler";
import { StateKeys, reportDiagnostic } from "../../node_modules/@ebusd/ebus-typespec/dist/src/lib.js";
import { $ext } from "../../node_modules/@ebusd/ebus-typespec/dist/src/decorators.js";
const getNum = (value) => {
    if (typeof value === 'number') {
        return value;
    }
    if (!isNumeric(value)) {
        return undefined;
    }
    const v = value.asNumber();
    if (v === null) {
        const b = value.asBigInt(); // weird way of having 0x00 "loosing precision"
        if (b === null) {
            return undefined;
        }
        return Number(b.valueOf());
    }
    return v;
};
export function $crcext(context, target, ...dd) {
    // single @id and @ext can only combine with single @base from inherited model
    if (context.program.stateMap(StateKeys.id).has(target)) {
        reportDiagnostic(context.program, {
            code: "multiple-decorator",
            target: context.getArgumentTarget(0),
            format: { which: 'ext/@id/@base' },
        });
    }
    if (!dd || dd.length === 0)
        $ext(context, target, ...[...dd]);
    else {
        let d0 = getNum(dd[0]);
        if (typeof d0 !== 'number' || isNaN(d0))
            d0 = 0;
        let crc = d0 & 0xFF;
        for (let i = 1; i < dd.length; i++) {
            let nextByte = getNum(dd[i]);
            if (typeof nextByte !== 'number' || isNaN(nextByte))
                nextByte = 0;
            for (let j = 0; j < 8; j++) {
                if (crc & 0x80) {
                    crc = ((crc << 1) ^ 0x5C) & 0xFF;
                }
                else {
                    crc = (crc << 1) & 0xFF;
                }
            }
            crc ^= nextByte;
            crc &= 0xFF;
        }
        $ext(context, target, ...[Numeric(crc.toString()), ...dd]);
    }
}
export function $wcrc(context, target, ...dd) {
    // single @id and @ext can only combine with single @base from inherited model
    if (context.program.stateMap(StateKeys.id).has(target)) {
        reportDiagnostic(context.program, {
            code: "multiple-decorator",
            target: context.getArgumentTarget(0),
            format: { which: 'ext/@id/@base' },
        });
    }
    // The Weishaupt register CRC-8 covers the data too, so it cannot be precomputed for
    // writes. Emit a placeholder first ID byte (0x00); the forked ebusd computes the real
    // CRC at runtime for messages whose comment carries the WCRC marker (issue #167).
    $ext(context, target, ...[Numeric("0"), ...dd]);
}
export function $appendext(context, target, ll, ...dd) {
    // single @id and @ext can only combine with single @base from inherited model
    if (context.program.stateMap(StateKeys.id).has(target)) {
        reportDiagnostic(context.program, {
            code: "multiple-decorator",
            target: context.getArgumentTarget(0),
            format: { which: 'ext/@id/@base' },
        });
    }
    $ext(context, target, ...[...dd, ll]);
}
