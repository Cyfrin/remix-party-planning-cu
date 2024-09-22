# @version ^0.4.0
# SPDX-License-Identifier: MIT

interface Favorites:
    def store(favorites_number: uint256): nonpayable
    def retrieve() -> uint256: view

list_of_favorites_contracts: public(DynArray[Favorites, 100])
original_favorite_contract: address

@deploy 
def __init__(original_favorite_contract: address):
    self.original_favorite_contract = original_favorite_contract

@external
def create_favorites_contract():
    new_favorites_address: address = create_copy_of(self.original_favorite_contract)
    favorites_contract: Favorites = Favorites(new_favorites_address)
    self.list_of_favorites_contracts.append(favorites_contract)

@external
def store_from_factory(favorites_index: uint256, favorites_number: uint256):
    extcall self.list_of_favorites_contracts[favorites_index].store(favorites_number)

@view
@external
def view_from_factory(favorites_index: uint256) -> uint256:
    return staticcall self.list_of_favorites_contracts[favorites_index].retrieve()