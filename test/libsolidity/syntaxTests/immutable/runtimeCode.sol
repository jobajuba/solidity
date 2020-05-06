pragma solidity ^0.6.6;

contract GelatoUserProxyDebug {
    address public immutable user = address(0x0);
}

contract GelatoUserProxyFactoryDebug {
    function proxyRuntimeCode() public pure returns(bytes memory) {
        return type(GelatoUserProxyDebug).runtimeCode;
    }
}
// ----
// TypeError: (232-270): "runtimeCode" isn't available for contracts containing immutable variables.
