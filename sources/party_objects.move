module party_objects::party_objects;

use std::string::String;
use sui::party;


public struct MyObject has key, store {
    id: UID,
    name: String,
}
//Party objects only support single owners at the moment
public fun create(name: String, ctx: &mut TxContext) {
    let my_object = MyObject {
        id: object::new(ctx),
        name,
    };
    let party = party::single_owner(ctx.sender());
    transfer::public_party_transfer(my_object, party);
}
#[allow(lint(self_transfer))]
public fun claim_from_party(object: MyObject, ctx: &TxContext){
    transfer::public_transfer(object, ctx.sender());

}