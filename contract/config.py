#!/usr/bin/env python3

# Shared configuration.

import os
import eth_account
from web3 import Web3

DIR_THIS = os.path.abspath(os.path.dirname(__file__))

# Chain RPC:
RPC_URL = 'https://testnet.evm.nodes.onflow.org'
web3 = Web3(Web3.HTTPProvider(RPC_URL))

# Contract's address.
CONTRACT_ADDR = f"0x08db0B336C6e4bb61C469b40F2E80a7A05AAd766"
CONTRACT_BIN  = f"{DIR_THIS}/src/output/src_InternetAstronaut_sol_InternetAstronaut.bin"
CONTRACT_ABI  = f"{DIR_THIS}/src/output/src_InternetAstronaut_sol_InternetAstronaut.abi"


# Load private key.
try:
    PKEY = open(f"{DIR_THIS}/.pkey").read()
except Exception as _:
    print(f"Add private key to {DIR_THIS}/.pkey")
    exit(-1)

# Wallet address derived from the private key.
account = eth_account.Account.from_key(PKEY)
user_address = account.address

# Contract's ABI.
contract_abi = open(CONTRACT_ABI, 'r').read()

# Initialize the contract.
contract = web3.eth.contract(address=CONTRACT_ADDR, abi=contract_abi)

# Amount of Ether (in wei) required to mint a Star.
star_price = web3.to_wei(2, 'ether')

# Total amount of stars available to mint.
stars_total = 10

