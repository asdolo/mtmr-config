# mtmr-config

These are my personal preferences for [MTMR](https://github.com/Toxblh/MTMR).

### Pre-requisites
- [blueutil](https://formulae.brew.sh/formula/blueutil)

## Installation
1. Install all the pre-requisites.

2. Clone this repo at `~/dev/mtmr-config`:
```bash
git clone git@github.com:asdolo/mtmr-config.git ~/dev/mtmr-config
```
3. Remove previous preferences from MTMR:
```bash
rm "~/Library/Application Support/MTMR/items.json"
```
4. Create a hard link at `~/Library/Application Support/MTMR/items.json` that points to the `items.json` file in this repo:
```bash
ln ~/dev/mtmr-config/items.json "~/Library/Application Support/MTMR/items.json"
```

## Uninstall
1. Delete the hard link:
```bash
rm "~/Library/Application Support/MTMR/items.json"
```
2. Delete the directory containing this repo:
```bash
rm -rf ~/dev/mtmr-config
```
3. Restart MTMR.

## Troubleshooting

### If you have an Intel-based MacBook 
These preferences were made for a MacBook Pro with the M1 processor, so most of the absolute paths for the binaries in the `items.json` file (like `/opt/homebrew/bin/blueutil`) resemble paths for `arm64` binaries installed from M1 version of [Homebrew](https://brew.sh/).

So **if you have an Intel-based MacBook you'll have to change the paths for those binaries to the ones for your architecture**. For example, you'll have to change `/opt/homebrew/bin/blueutil` (which is the path for the `arm64` version of blueutils installed from `arm64` version of Homebrew) to `/usr/local/bin/blueutil` (which is the path for the `x86_64` version of `blueutils` installed from `x86_64` version of Homebrew).

### If some buttons show `error` or doesn't do anything when pressing them
1. Make sure you've installed all the pre-requisites 😛.
2. Make sure you cloned this repo at `~/dev/mtmr-config`. If you need/want to have this repo in another directory, you'll have to change all the paths in the `items.json` that references to `~/dev/mtmr-config` for the one you want.