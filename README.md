# ouroboros

Convert camel case to snake case (and vice versa) in Lua code, using Lua.

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
