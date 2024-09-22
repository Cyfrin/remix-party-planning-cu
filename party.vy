# @version ^0.4.0
# SPDX-License-Identifier: MIT

import favorites 

initializes: favorites

@external
def store(favorite_number: uint256):
    # favorites.store(favorite_number) # cant do this!
    favorites.my_favorite_number = favorite_number + 5

exports:(favorites.retrieve, favorites.add_person)
# exports: favorites.__interface__ # cant do this!