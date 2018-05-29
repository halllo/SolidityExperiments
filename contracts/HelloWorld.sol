pragma solidity ^0.4.23;

import { Utilities } from "./Utilities.sol";

contract HelloWorld is Utilities {
  address public owner;

  struct Greeting {
    address sender;
    string name;
    uint timestamp;
  }

  Greeting[] greetings;

  constructor() public {
    owner = msg.sender;
  }

  function sayHello(string name) public returns (string) {
    address sender = msg.sender;
    string memory senderAsString = toAsciiString(sender);
    string memory helloSender = strConcat("Hello ", name, " (", senderAsString, ")");

    greetings.push(Greeting({
      name: name,
      sender: sender,
      timestamp: block.timestamp
    }));

    return helloSender;
  }

  function countHellos() public view returns (uint) {
    return greetings.length;
  }

  function listHellos() public view returns (string) {
    string memory greetedNamesAndAddresses = '';

    for (uint i = 0; i < greetings.length; i++) {
      Greeting memory greeted = greetings[i];
      address sender = greeted.sender;
      string memory name = greeted.name;
      string memory time = uintToHexstr(greeted.timestamp);
      string memory senderAsString = toAsciiString(sender);
      string memory greetedNameAndAddress = strConcat(name, " (", senderAsString, " at ", time, ")"); 
      
      greetedNamesAndAddresses = strConcat(greetedNamesAndAddresses, greetedNameAndAddress, ", ");
    }

    return greetedNamesAndAddresses;
  }

  function loopInfinitively() public view returns (string) {
    string memory s = '';
    uint counter = 0;
    while(0 < 1) {
      s = uintToHexstr(counter++);
    }
    return s;
  }
}
