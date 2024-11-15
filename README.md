# Mox Five More CU

This is part of the Cyfrin Updraft Vyper Course. 

- [Mox Five More CU](#mox-five-more-cu)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Compile](#compile)
  - [Test](#test)
  - [Deployment](#deployment)
    - [Deployment - pyevm](#deployment---pyevm)
    - [Deployment - eravm](#deployment---eravm)
    - [Deployment - anvil](#deployment---anvil)
    - [Deployment - Testnet or Mainnet](#deployment---testnet-or-mainnet)
- [Verification](#verification)


# Getting Started

## Prerequisites

- [git](https://git-scm.com/)
  - You'll know you've done it right if you can run `git --version` and see a version number.
- [anvil](https://book.getfoundry.sh/anvil/)
  - You'll know you've done it right if you can run `anvil --version` and see an output like `anvil 0.2.0 (fdd321b 2024-10-15T00:21:13.119600000Z)`
- [era-test-node](https://github.com/matter-labs/era-test-node)
  - You'll know you've done it right if you can run `era_test_node --version` and see an output like `era_test_node 0.1.0-alpha.28`
- [moccasin](https://github.com/Cyfrin/moccasin)
  - You'll know you've done it right if you can run `mox --version` and get an output like: `Moccasin CLI v0.3.0`

## Installation

```bash
git clone https://github.com/cyfrin/mox-five-more-cu
cd mox-five-more-cu
```

## Quickstart

```bash
mox run deploy 
```

# Usage

## Compile

```bash
mox compile
```

## Test

```bash
mox test
```

## Deployment

### Deployment - pyevm

```bash
mox run deploy
```

### Deployment - eravm

```bash
mox run deploy --network eravm
```

### Deployment - anvil 

1. In a terminal, run:

```bash
anvil
```

2. Then, in another terminal, run:

```bash
mox run deploy --network anvil
```

### Deployment - Testnet or Mainnet

Let's say you want to deploy to the `sepolia-zksync` network. 

1. Update your `moccasin.toml` entry for that network:

```toml
[networks.sepolia-zksync]
url = "$SEPOLIA_ZKSYNC_RPC_URL"
chain_id = 300
default_account_name = "default"
is_zksync = true
save_to_db = true
explorer_uri = "https://explorer.sepolia.era.zksync.dev"
explorer_type = "zksyncexplorer"
```

2. Add a `SEPOLIA_ZKSYNC_RPC_URL` environment variable to your shell or a `.env` file:

```bash
# This is a public endpoint, feel free to try this one
SEPOLIA_ZKSYNC_RPC_URL="https://sepolia.era.zksync.dev"
```

3. Make sure you have a wallet named `default` that is encrypted

```bash
mox wallet import default
```

You will be prompted to enter your private key, and a password to encrypt it with.

Once done, you can verify it's accessible by running:

```bash
mox wallet list
```

And seeing the `default` wallet listed.

4. Deploy to the network

```bash
mox run deploy --network sepolia-zksync
```

You will be prompted for your wallet password to unlock the wallet.

# Verification

If you want to verify your contract, add the `explorer_uri`, `explorer_type`, and `explorer_api_key` (if applicable) to your `moccasin.toml` file.

As of writing, only the following are supported:

- Blockscout
- ZKsync explorer

Not Etherscan at this time. 