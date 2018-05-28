pragma solidity ^0.4.23;

import { Utilities } from "./Utilities.sol";

contract HelloWorld is Utilities {
  address public owner;
  uint counter;

  constructor() public {
    owner = msg.sender;
    counter = 0;
  }

  function increment() public returns (uint) {
    counter++;
    return counter;
  }

  function sayHello() public view returns (string) {
    address sender = msg.sender;
    string memory senderAsString = toAsciiString(sender);
    string memory greeting = strConcat("Hello", " ", senderAsString, "!");
    return greeting;
  }
}
