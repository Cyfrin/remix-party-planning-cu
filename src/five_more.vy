# pragma version 0.4.0
# @license MIT

import favorites 

initializes: favorites # noqa 

# what if favorites doesn't have an __init__ function? 
@deploy 
def __init__():
    favorites.__init__()

@external
def store(favorite_number: uint256):
    # favorites.store(favorite_number) # cant do this!
    favorites.my_favorite_number = favorite_number + 5

exports:(favorites.retrieve, favorites.add_person)
# exports: favorites.__interface__ # cant do this!