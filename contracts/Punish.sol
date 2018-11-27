pragma solidity ^0.4.24;

import "./behaviors.sol";

contract Punish is Behaviors{

    // keeps a history of severity points
    uint [] public points;
    event add_pointsEvent(uint _points);

function add_points(uint _points) public {
    points.push(_points);

    emit add_pointsEvent(_points);
}

function get_length() public view returns(uint) {
    return points.length;
}

function get_element(uint index) public view returns(uint) {
    if (index >= points.length){
        return points[index];
    }
}

function delete_element(uint index) internal returns(bool) {
    if (index >= points.length)
        return false;
    for(uint i = index; i< points.length -1; i++) {
        points[i] = points[i+1];
    }

    points.length--;
    return true;
    }
}
