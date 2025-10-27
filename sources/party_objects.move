module party_objects::party_objects;

use std::string::String;
use sui::party::{Self,Party};


public struct MyObject has key, store {
    id: UID,
    name: String,
}


public fun create(name: String, party: Party, ctx: &mut TxContext) {
    let my_object = MyObject {
        id: object::new(ctx),
        name,
    };
    transfer::public_party_transfer(my_object, party);
}