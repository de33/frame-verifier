// File automatically generated by protoc-gen-sol v0.2.0
// and then fixed by @wilsoncusack :)
// SPDX-License-Identifier: CC0
pragma solidity >=0.8.4 <0.9.0;
pragma experimental ABIEncoderV2;

import "./libraries/ProtobufLib.sol";

enum MessageType {
    MESSAGE_TYPE_NONE,
    MESSAGE_TYPE_CAST_ADD,
    MESSAGE_TYPE_CAST_REMOVE,
    MESSAGE_TYPE_REACTION_ADD,
    MESSAGE_TYPE_REACTION_REMOVE,
    MESSAGE_TYPE_LINK_ADD,
    MESSAGE_TYPE_LINK_REMOVE,
    MESSAGE_TYPE_VERIFICATION_ADD_ETH_ADDRESS,
    MESSAGE_TYPE_VERIFICATION_REMOVE,
    MESSAGE_TYPE_SIGNER_ADD,
    MESSAGE_TYPE_SIGNER_REMOVE,
    MESSAGE_TYPE_USER_DATA_ADD,
    MESSAGE_TYPE_USERNAME_PROOF,
    MESSAGE_TYPE_FRAME_ACTION
}

enum FarcasterNetwork {
    FARCASTER_NETWORK_NONE,
    FARCASTER_NETWORK_MAINNET,
    FARCASTER_NETWORK_TESTNET,
    FARCASTER_NETWORK_DEVNET
}

struct MessageData {
    MessageType type_;
    uint64 fid;
    uint32 timestamp;
    FarcasterNetwork network;
    FrameActionBody frame_action_body;
}

library MessageDataCodec {
    // Holds encoded version of message
    struct MessageData__Encoded {
        bytes type___Key;
        bytes type_;
        bytes fid__Key;
        bytes fid;
        bytes timestamp__Key;
        bytes timestamp;
        bytes network__Key;
        bytes network;
        FrameActionBodyCodec.FrameActionBody__Encoded__Nested frame_action_body;
        bytes frame_action_body__Encoded;
    }

    // Holds encoded version of nested message
    struct MessageData__Encoded__Nested {
        bytes key;
        bytes length;
        bytes nestedInstance;
    }

    function encode(MessageData memory instance) internal pure returns (bytes memory) {
        // Omit encoding fields if default value
        bytes memory type__Key = uint64(instance.type_) != 0 ? ProtobufLib.encode_key(1, uint64(ProtobufLib.WireType.Varint)) : new bytes(0);
        bytes memory type_ = uint64(instance.type_) != 0 ? ProtobufLib.encode_int32(int32(uint32(instance.type_))) : new bytes(0);
        bytes memory fid__Key = uint64(instance.fid) != 0 ? ProtobufLib.encode_key(2, uint64(ProtobufLib.WireType.Varint)) : new bytes(0);
        bytes memory fid = uint64(instance.fid) != 0 ? ProtobufLib.encode_uint64(instance.fid) : new bytes(0);
        bytes memory timestamp__Key = uint64(instance.timestamp) != 0 ? ProtobufLib.encode_key(3, uint64(ProtobufLib.WireType.Varint)) : new bytes(0);
        bytes memory timestamp = uint64(instance.timestamp) != 0 ? ProtobufLib.encode_uint32(instance.timestamp) : new bytes(0);
        bytes memory network__Key = uint64(instance.network) != 0 ? ProtobufLib.encode_key(4, uint64(ProtobufLib.WireType.Varint)) : new bytes(0);
        bytes memory network = uint64(instance.network) != 0 ? ProtobufLib.encode_int32(int32(uint32(instance.network))) : new bytes(0);

        // Encode frame_action_body
        FrameActionBodyCodec.FrameActionBody__Encoded__Nested memory frame_action_body = FrameActionBodyCodec.encodeNested(16, instance.frame_action_body);
        bytes memory frame_action_body__Encoded = abi.encodePacked(
            frame_action_body.key,
            frame_action_body.length,
            frame_action_body.nestedInstance
        );

        // Use abi.encodePacked for efficient concatenation
        return abi.encodePacked(
            type__Key,
            type_,
            fid__Key,
            fid,
            timestamp__Key,
            timestamp,
            network__Key,
            network,
            frame_action_body__Encoded
        );
    }

    // Encode a nested MessageData, wrapped in key and length if non-default
    function encodeNested(uint64 field_number, MessageData memory instance)
        internal
        pure
        returns (MessageData__Encoded__Nested memory)
    {
        bytes memory nestedInstance = encode(instance);
        uint64 len = uint64(nestedInstance.length);
        bytes memory key = len > 0 ? ProtobufLib.encode_key(field_number, 2) : new bytes(0);
        bytes memory length = len > 0 ? ProtobufLib.encode_uint64(len) : new bytes(0);

        return MessageData__Encoded__Nested(key, length, nestedInstance);
    }
}

struct CastId {
    uint64 fid;
    bytes hash;
}

library CastIdCodec {
    // Holds encoded version of message
    struct CastId__Encoded {
        bytes fid__Key;
        bytes fid;
        bytes hash__Key;
        bytes hash__Length;
        bytes hash;
    }

    // Holds encoded version of nested message
    struct CastId__Encoded__Nested {
        bytes key;
        bytes length;
        bytes nestedInstance;
    }

    function encode(CastId memory instance) internal pure returns (bytes memory) {
        bytes memory fid__Key = uint64(instance.fid) != 0 ? ProtobufLib.encode_key(1, uint64(ProtobufLib.WireType.Varint)) : new bytes(0);
        bytes memory fid = uint64(instance.fid) != 0 ? ProtobufLib.encode_uint64(instance.fid) : new bytes(0);
        bytes memory hash__Key = instance.hash.length > 0 ? ProtobufLib.encode_key(2, uint64(ProtobufLib.WireType.LengthDelimited)) : new bytes(0);
        bytes memory hash__Length = instance.hash.length > 0 ? ProtobufLib.encode_uint64(uint64(instance.hash.length)) : new bytes(0);
        bytes memory hash = instance.hash.length > 0 ? bytes(instance.hash) : new bytes(0);

        return abi.encodePacked(
            fid__Key,
            fid,
            hash__Key,
            hash__Length,
            hash
        );
    }

    // Encode a nested CastId, wrapped in key and length if non-default
    function encodeNested(uint64 field_number, CastId memory instance)
        internal
        pure
        returns (CastId__Encoded__Nested memory)
    {
        bytes memory nestedInstance = encode(instance);
        uint64 len = uint64(nestedInstance.length);
        bytes memory key = len > 0 ? ProtobufLib.encode_key(field_number, 2) : new bytes(0);
        bytes memory length = len > 0 ? ProtobufLib.encode_uint64(len) : new bytes(0);

        return CastId__Encoded__Nested(key, length, nestedInstance);
    }
}

struct FrameActionBody {
    bytes url;
    uint32 button_index;
    CastId cast_id;
}

library FrameActionBodyCodec {
    // Holds encoded version of message
    struct FrameActionBody__Encoded {
        bytes url__Key;
        bytes url__Length;
        bytes url;
        bytes button_index__Key;
        bytes button_index;
        CastIdCodec.CastId__Encoded__Nested cast_id;
        bytes cast_id__Encoded;
    }

    // Holds encoded version of nested message
    struct FrameActionBody__Encoded__Nested {
        bytes key;
        bytes length;
        bytes nestedInstance;
    }

    function encode(FrameActionBody memory instance) internal pure returns (bytes memory) {
        bytes memory url__Key = instance.url.length > 0 ? ProtobufLib.encode_key(1, uint64(ProtobufLib.WireType.LengthDelimited)) : new bytes(0);
        bytes memory url__Length = instance.url.length > 0 ? ProtobufLib.encode_uint64(uint64(instance.url.length)) : new bytes(0);
        bytes memory url = instance.url.length > 0 ? bytes(instance.url) : new bytes(0);
        bytes memory button_index__Key = uint64(instance.button_index) != 0 ? ProtobufLib.encode_key(2, uint64(ProtobufLib.WireType.Varint)) : new bytes(0);
        bytes memory button_index = uint64(instance.button_index) != 0 ? ProtobufLib.encode_uint32(instance.button_index) : new bytes(0);
        CastIdCodec.CastId__Encoded__Nested memory cast_id = CastIdCodec.encodeNested(3, instance.cast_id);
        bytes memory cast_id__Encoded = abi.encodePacked(
            cast_id.key,
            cast_id.length,
            cast_id.nestedInstance
        );

        return abi.encodePacked(
            url__Key,
            url__Length,
            url,
            button_index__Key,
            button_index,
            cast_id__Encoded
        );
    }

    // Encode a nested FrameActionBody, wrapped in key and length if non-default
    function encodeNested(uint64 field_number, FrameActionBody memory instance)
        internal
        pure
        returns (FrameActionBody__Encoded__Nested memory)
    {
        bytes memory nestedInstance = encode(instance);
        uint64 len = uint64(nestedInstance.length);
        bytes memory key = len > 0 ? ProtobufLib.encode_key(field_number, 2) : new bytes(0);
        bytes memory length = len > 0 ? ProtobufLib.encode_uint64(len) : new bytes(0);

        return FrameActionBody__Encoded__Nested(key, length, nestedInstance);
    }
}
