module party_objects::party_objects;

use std::string::String;
use sui::party;


public struct MyObject has key, store {
    id: UID,
    name: String,
}

public fun create(name: String, ctx: &mut TxContext) {
    let my_object = MyObject {
        id: object::new(ctx),
        name,
    };
    let party = party::single_owner(ctx.sender());
    transfer::public_party_transfer(my_object, party);
}
