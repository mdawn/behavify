pragma solidity ^0.4.24;

contract Behaviors {

    struct Offense{
        string description;
        uint value;
    }

    Offense public insubordination;
    mapping(address => Offense) public offenses;
    event modify_offenseEvent(string _description, uint _value);


    constructor(string _description, uint _value) public {
        insubordination.description = _description;
        insubordination.value = _value;

        offenses[msg.sender] = insubordination;

    }

    function modify_offense(string _description, uint _value) public payable {
        Offense memory newOffense = Offense({
            description: _description,
            value: _value
        });

     insubordination = newOffense;
     emit modify_offenseEvent(_description, _value);

    }

}
