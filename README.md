# Px: A patterns player class for SuperCollider

## Px

### Class args

| Arg        | Value            | Description                                          |
| ---------- | ---------------- | ---------------------------------------------------- |
| `name`     | string \| symbol | A user defined name for the generated Pdef           |
| `patterns` | Event[]          | An array containing all the patterns in Event format |
| `trace`    | boolean          | Print out the results of the streams                 |

### Pattern controls

| Key      | Value                                          | Description                              |
| -------- | ---------------------------------------------- | ---------------------------------------- |
| `amp`    | number \| number[] \| Pattern                  | Amplification. An array generates a Pseq |
| `dur`    | number \| number[] \| Pattern                  | Duration. An array generates a Pseq      |
| `euclid` | [hits: number, duration: number, time: number] | Generates an Euclidian ryhthm            |

### Event methods

| Name     | Arguments                                                            | Description                                                                                                                                                                                  |
| -------- | -------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `amp`    | number \| number[] \| Pattern                                        | Amplification                                                                                                                                                                                |
| `beat`   | seed?: integer                                                       | Generates a random rhythm                                                                                                                                                                    |
| `delay`  | mix?: 1.0 \| \rand \| [\wrand, item1, item2, weight], args?: pairs[] | Adds a delay effect                                                                                                                                                                          |
| `dur`    | number \| number[] \| Pattern                                        | Duration                                                                                                                                                                                     |
| `fill`   | None                                                                 | Fills the rests gap of its previous pattern beat                                                                                                                                             |
| `in`     | Seconds?: integer                                                    | (\fade: "in")                                                                                                                                                                                |
| `out`    | Seconds?: integer                                                    | (\fade: "out")                                                                                                                                                                               |
| `pan`    | number \| \rand \| \rotate \| Pattern                                | Pan                                                                                                                                                                                          |
| `rate`   | number \| \rand \| [\wrand, item1, item2, weight]                    | Rate value                                                                                                                                                                                   |
| `reverb` | mix?: 1.0 \| \rand \| [\wrand, item1, item2, weight], args?: pairs[] | Adds a reverb effect                                                                                                                                                                         |
| `rotate` | None                                                                 | Creates a back-and-forth pan rotation between left and right channels                                                                                                                        |
| `seed`   | seed: integer                                                        | Generate a specific seed                                                                                                                                                                     |
| `solo`   | None                                                                 | (\solo: true)                                                                                                                                                                                |
| `trim`   | startPosition?: 1.0                                                  | Plays a trimmed loop from a fixed position or random when startPosition is nil                                                                                                               |
| `wah`    | mix?: 1.0 \| \rand \| [\wrand, item1, item2, weight], args?: pairs[] | Adds a wah effect                                                                                                                                                                            |
| `weight` | number                                                               | Generates a list of probabilities or weights. Value range from 0 to 1. Tenths change the probability of hits and rests while hundredths defines the probabilty of switching between 2 tenths |

### Class methods

- `chorus`: Plays a chorus
- `gui`: A gui showing all Pdefs
- `release`: nil | integer
- `save`: Saves a chorus
- `shuffle`: Generates new random seeds
- `stop`: Stops the Pdef
- `synthDef`: Browse global synthDefs. If a synthDef name is provided, it returns its arguments
- `trace`: print out the results of the streams

### Buf loopers

- `loop`: [folder: string, file: number | \jump | \rand]
- `play`: [folder: string, file: number | \rand]

## Play

Custom pattern player designed to handle degrees, and can send MIDI messages based on incoming pattern data. It also helps to manage MIDI-related functionalities within SuperCollider, providing a way to control MIDI events and output.

### Event methods

| Name     | Arguments                                                           | Description                  |
| -------- | ------------------------------------------------------------------- | ---------------------------- |
| `arp`    | None                                                                | Creates a very basic arpegio |
| `degree` | `degree`: number \| array \| \rand, `scale`?: scale, `size`: number | Handle notes                 |

### MIDI

When the pattern contains `\chan`, it sends MIDI with MIDIOut class and the `\midi` event type. All the necessary default commands are added automatically, like `\midicmd`, `\allNotesOff`, `\control`, or `\noteOn`.

#### MIDI methods

- `Pmidi.init`: Initializes the MIDIClient. Latency can be passed as argument.

#### MIDI event methods

| Name      | Arguments                                                                                                                   | Description                                                           |
| --------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `control` | number, number \| Pattern \| \rand \| \wrand \| [symbol: \rand \| \wrand, value1: number, value2?: number, weight?: number] | Sends a controller message                                            |
| `hold`    | None                                                                                                                        | The note off message will not be sent and will keep the notes pressed |
| `holdOff` | None                                                                                                                        | "Panic" message, kills all notes on the channel pattern               |
