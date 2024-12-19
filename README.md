# ouroboros

Convert camel case to snake case (and vice versa) in Lua code, using Lua.

## Installation

Clone this repository and (optionally) add the Lua executable to your `PATH`.

```bash
git clone https://github.com/44mira/ouroboros.git
export PATH="$PATH:/path/to/ouroboros"  # temporarily add to path

./ouroboros.lua samplefile
```

## Usage

```
./ouroboros.lua <filename> [-c]

-c      from snake case to camel case
```

## Usage for rewriting file

Simply redirect `stdout` to the input file.

```bash
./ouroboros.lua sample.lua > sample.lua
```
