from src import favorites_factory, favorites, five_more
from moccasin.boa_tools import VyperContract

def deploy_favorites() -> VyperContract:
    favorites_contract: VyperContract = favorites.deploy()
    return favorites_contract

def deploy_factory(favorites_contract: VyperContract):
    f_factory: VyperContract = favorites_factory.deploy(favorites_contract.address)
    f_factory.create_favorites_contract()

    favorties_address: str = f_factory.list_of_favorites_contracts(0)
    favorites_from_factory: VyperContract = favorites.at(favorties_address)
    favorites_from_factory.store(77)
    print(f"Stored value is {favorites_from_factory.retrieve()}")

    f_factory.store_from_factory(0, 88)
    print(f"New contract stored value is {favorites_from_factory.retrieve()}")
    print(f"Old contract stored value is {favorites_contract.retrieve()}")

def deploy_five_more():
    five_more_contract = five_more.deploy()
    five_more_contract.store(99)
    print(five_more_contract.retrieve())

def moccasin_main():
    favorites_contract = deploy_favorites()
    deploy_factory(favorites_contract)
    deploy_five_more()