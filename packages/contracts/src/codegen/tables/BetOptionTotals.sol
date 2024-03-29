// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("BetOptionTotals")))
);
ResourceId constant BetOptionTotalsTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0024020004200000000000000000000000000000000000000000000000000000
);

struct BetOptionTotalsData {
  uint32 totalBets;
  uint256 totalAmount;
}

library BetOptionTotals {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](2);
    _keySchema[0] = SchemaType.UINT32;
    _keySchema[1] = SchemaType.UINT32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.UINT32;
    _valueSchema[1] = SchemaType.UINT256;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "betId";
    keyNames[1] = "optionId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "totalBets";
    fieldNames[1] = "totalAmount";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get totalBets.
   */
  function getTotalBets(uint32 betId, uint32 optionId) internal view returns (uint32 totalBets) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get totalBets.
   */
  function _getTotalBets(uint32 betId, uint32 optionId) internal view returns (uint32 totalBets) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set totalBets.
   */
  function setTotalBets(uint32 betId, uint32 optionId, uint32 totalBets) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((totalBets)), _fieldLayout);
  }

  /**
   * @notice Set totalBets.
   */
  function _setTotalBets(uint32 betId, uint32 optionId, uint32 totalBets) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((totalBets)), _fieldLayout);
  }

  /**
   * @notice Get totalAmount.
   */
  function getTotalAmount(uint32 betId, uint32 optionId) internal view returns (uint256 totalAmount) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get totalAmount.
   */
  function _getTotalAmount(uint32 betId, uint32 optionId) internal view returns (uint256 totalAmount) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set totalAmount.
   */
  function setTotalAmount(uint32 betId, uint32 optionId, uint256 totalAmount) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((totalAmount)), _fieldLayout);
  }

  /**
   * @notice Set totalAmount.
   */
  function _setTotalAmount(uint32 betId, uint32 optionId, uint256 totalAmount) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((totalAmount)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint32 betId, uint32 optionId) internal view returns (BetOptionTotalsData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint32 betId, uint32 optionId) internal view returns (BetOptionTotalsData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(uint32 betId, uint32 optionId, uint32 totalBets, uint256 totalAmount) internal {
    bytes memory _staticData = encodeStatic(totalBets, totalAmount);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(uint32 betId, uint32 optionId, uint32 totalBets, uint256 totalAmount) internal {
    bytes memory _staticData = encodeStatic(totalBets, totalAmount);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint32 betId, uint32 optionId, BetOptionTotalsData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.totalBets, _table.totalAmount);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint32 betId, uint32 optionId, BetOptionTotalsData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.totalBets, _table.totalAmount);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(bytes memory _blob) internal pure returns (uint32 totalBets, uint256 totalAmount) {
    totalBets = (uint32(Bytes.slice4(_blob, 0)));

    totalAmount = (uint256(Bytes.slice32(_blob, 4)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (BetOptionTotalsData memory _table) {
    (_table.totalBets, _table.totalAmount) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint32 betId, uint32 optionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint32 betId, uint32 optionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(uint32 totalBets, uint256 totalAmount) internal pure returns (bytes memory) {
    return abi.encodePacked(totalBets, totalAmount);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint32 totalBets,
    uint256 totalAmount
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(totalBets, totalAmount);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint32 betId, uint32 optionId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(betId));
    _keyTuple[1] = bytes32(uint256(optionId));

    return _keyTuple;
  }
}
