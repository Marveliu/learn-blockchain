curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method": "eth_compileSolidity", "params": ["contract Multiply7 {event Print(uint);function multiply(uint input) returns (uint) {Print(input * 7);return input * 7;}}"], "id": 5}' localhost:8545