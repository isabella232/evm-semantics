
module DUPN
  imports ETHEREUM-SIMULATION
  imports EVM

rule
  <k> #execute => #execute </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> ISTANBUL </schedule>
  <analysis> .Map </analysis>
  <ethereum>
    <evm>
      <output> _ </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <callStack> VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => _ </touchedAccounts>
      <callState>
        <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("602a600160026003600460056006600760086009600a600b600c600d600e600f6010b00011"), ISTANBUL)) </program>
        <programBytes> #parseByteStack("602a600160026003600460056006600760086009600a600b600c600d600e600f6010b00011") </programBytes>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> _ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => 42 : _ </wordStack>
        <localMem> .Map => _ </localMem>
        <pc> 0 => _ </pc>
        <gas> VGas => _ </gas>
        <memoryUsed> _ </memoryUsed>
        <previousGas> _ </previousGas>
        <static> _ </static>
        <callDepth> _ </callDepth>
      </callState>
      <substate>
        <selfDestruct> VSelfDestruct </selfDestruct>
        <log> _ </log>
        <refund> _ </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <previousHash> _ </previousHash>
      <ommersHash> _ </ommersHash>
      <coinbase> _ </coinbase>
      <stateRoot> _ </stateRoot>
      <transactionsRoot> _ </transactionsRoot>
      <receiptsRoot> _ </receiptsRoot>
      <logsBloom> _ </logsBloom>
      <difficulty> _ </difficulty>
      <number> _ </number>
      <gasLimit> _ </gasLimit>
      <gasUsed> _ </gasUsed>
      <timestamp> TIME </timestamp>
      <extraData> _ </extraData>
      <mixHash> _ </mixHash>
      <blockNonce> _ </blockNonce>
      <ommerBlockHeaders> _ </ommerBlockHeaders>
      <blockhash> _ </blockhash>
    </evm>
    <network>
      <activeAccounts> SetItem(ACCT_ID) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> #parseByteStack("602a600160026003600460056006600760086009600a600b600c600d600e600f60106011b00011") </code>
          <storage> .Map
           _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ... 
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires VGas >=Int 300

endmodule
