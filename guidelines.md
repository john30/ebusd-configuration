# Guidelines for message definitions
[TypeSpec](https://typespec.io/) is a language for defining data models and can be extended for domain specific use.

As an eBUS message is basically nothing more than a transfer of a (rather small) data model between two participants,
TypeSpec together with the [eBUS TypeSpec library](https://github.com/john30/ebus-typespec) is a good way of describing and documenting eBUS message definitions.

Since there is already a lot of [tools around TypeSpec](https://typespec.io/tooling) including language support in VS Code, autocomplete, formatting, linting, and even conversion to JSON schema or others, it is a lot more convenient to work with message defintions this way.

For details of the [eBUS TypeSpec library, see the library readme](https://github.com/john30/ebus-typespec).

In addition to the tooling provided by TypeSpec directly, the [VS Code extension "ebus notebook"](https://marketplace.visualstudio.com/items?itemName=ebusd.ebus-notebook) is provided and allows working on message definitions directly in a VS Code notebook with support for sending to a running ebusd instance.

## Example
Here is a small example illustrating the enhanced readability. A message declared in CSV like this:
```csv
r,ehp,SourceTemp,source temperature,,08,"B509","0D0F00",,,tempsensor,,,Source temperature sensor
```
would be written as TypeSpec file like this:
```typespec
import "@ebusd/ebus-typespec";
import "./_templates.tsp";

/** source temperature */
@zz(0x08)
@id(0xb5, 0x09, 0x0d, 0x0f, 0x00)
model SourceTemp {
  /** Source temperature sensor */
  value: tempsensor;
}
```

Furthermore, when adding another level of abstraction, this can be even reduced to this (the template model `Register<typ>` not shown here as this would be part of the `_templates.tsp`, see the manufacturer specific subdirectories in `src/` for a complete example):
```typespec
import "@ebusd/ebus-typespec";
import "./_templates.tsp";

/** source temperature */
@ext(0x0f, 0x00)
model SourceTemp is Register<tempsensor>;
```

## Directory structure
The primary source for definitions is the [`src` folder](src/), the content of which was initially generated from the latest CSV files using the [conversion tool](#converting-existing-csvs).

It consists only of `.tsp` files with the declarations as well as optionally one i18n YAML file per supported language, e.g. `en.yaml`.

The declarations are supposed to be written in English only and for translation the comments from the declarations can be mapped to a language using the i18n YAML.

The top level directory may only contain message and template declarations common for any manufacturer where sub directories are supposed to contain only declarations specific for that manufacturer.


## eBUS structure versus TypeSpec
This is a list of associations from eBUS structures to the corresponding TypeSpec declaration:
* circuit: `namespace`
* message: `model`
  in order to form an eBUS message, a TypeSpec `model` needs to carry an `@id` decorator, either directly or inherited via `@base`/`@ext`
* field: `model property`
* message/field comment: normal code comment before the entity, i.e.
  ```typespec
  /** comment goes here */
  entity...
  ```


## File structure
Each `.tsp` file basically looks similar, i.e. starts with imports and uses, followed by the manufacturer and circuit namespaces and carrying therein the circuit specific messages.


## Migrating from existing CSVs
In order to ease the move to TypeSpec,the [`csv2tsp.ts` utility](utils/src/csv2tsp.ts) utility is available for converting existing CSV files.

Converting the latest CSV files prepared for i18n can be done with the npm tasks like this:
1. `npm run csv2tsp`: generates English tsp files in directory `outtsp` including a helper file `i18n.yml` for the combination below
2. `npm run csv2tsp-combine`: generates German tsp files in directory `outtsp.de` including a helper file `i18n.yml` as well as i18n files `en.yaml` and `de.yaml` in `outtsp`
3. `npm run maintsp`: generates the `main.tsp` file from the list of the other tsp files
4. `npm run format`: reformats all generated tsp files
5. `npm run lint`: checks for issues in all generated tsp files

Alternatively, the `npm run csvall` performs all of these steps in addition to some pre-normalization, and also adjusts/excludes some top level items that rarely changed and emit warnings otherwise.

From here, the changed declarations in `outtsp` can be compared against the current source folder in `src`, changes to it applied and reviewed beforw PR submission.


## Dos and Don'ts
* embrace comments where reasonable
* avoid repetition in comments, e.g. do not use a comment that only contains exactly the message or field name
* do not put models to deep in the type graph
* ensure the tsp compiler does not emit diagnostics
* use the formatter (see `npm run format`)
* combine read/write active/passive messages where possible
* mark incoming only fields as optional
* name a single field in a message `value`
* use a common top level namespace per manufacturer
* use a unique namespace per circuit (under the manufacturer namespace)
* use a unique name per message
* reuse shared messages with the [include schema](#include-schema)
* prefer predefined types instead of redefining them
* only eBUS internal scalar type definitions are allowed to be uppercase only (like `UCH`)


## Include schema
Inclusion of shared common models is a bit tricky, as TypeSpec currently lacks good support for doing so out of the box.
Therefore, a special union is currently used that implicitly resolves to (i.e. includes) all the models of namespaces listed in it, e.g.
```typespec
import "@ebusd/ebus-typespec";
import "./hwcmode_inc.tsp";  // <= imports the `Hwcmode_inc` namespace for referencing it below

namespace Circuit {
  /** included parts */
  union _includes {
    Hwcmode_inc,  // <= references the imported namespace and implicitly resolves to all contained models
    named: Hwcmode_inc, // <= named entry emits a !load instruction instead
  }
}
```


## Style guide
See the [style guide in the eBUS TypeSpec library](https://github.com/john30/ebus-typespec#style-guide).


## Converting to CSV
The final step is to create the CSV needed by ebusd (for the time being):
1. `npm run compile-en`: generates CSV files in directory `outcsv/@ebusd/ebus-typespec/`
2. this directory would then serve as the base for publishing to CDN for use by ebusd


## Converting to schema
The good thing about TypeSpec is, that declarations can easily be emitted as e.g. JSON Schema or even OpenAPI. See the TypeSpec docs for details.
