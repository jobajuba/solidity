contract A1 { constructor() public {} }
contract B1 is A1 {}

contract A2 { constructor() public payable {} }
contract B2 is A2 {}

contract B3 {}

contract C {
    function createWithValue(bytes memory c) public payable {
        assembly { let x := create(10, add(c, 0x20), mload(c)) }
    }
    function f() public payable {
	createWithValue(type(B1).creationCode);
    }
    function g() public payable {
	createWithValue(type(B2).creationCode);
    }
    function h() public payable {
	createWithValue(type(B3).creationCode);
    }
}
// ----
// f(), 2000 ether ->
// g(), 2000 ether ->
// h(), 2000 ether ->
