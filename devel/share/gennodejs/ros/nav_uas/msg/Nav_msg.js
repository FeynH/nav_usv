// Auto-generated. Do not edit!

// (in-package nav_uas.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Nav_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Angle = null;
      this.Distance = null;
      this.IsArrive = null;
    }
    else {
      if (initObj.hasOwnProperty('Angle')) {
        this.Angle = initObj.Angle
      }
      else {
        this.Angle = 0.0;
      }
      if (initObj.hasOwnProperty('Distance')) {
        this.Distance = initObj.Distance
      }
      else {
        this.Distance = 0.0;
      }
      if (initObj.hasOwnProperty('IsArrive')) {
        this.IsArrive = initObj.IsArrive
      }
      else {
        this.IsArrive = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Nav_msg
    // Serialize message field [Angle]
    bufferOffset = _serializer.float64(obj.Angle, buffer, bufferOffset);
    // Serialize message field [Distance]
    bufferOffset = _serializer.float64(obj.Distance, buffer, bufferOffset);
    // Serialize message field [IsArrive]
    bufferOffset = _serializer.int16(obj.IsArrive, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Nav_msg
    let len;
    let data = new Nav_msg(null);
    // Deserialize message field [Angle]
    data.Angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Distance]
    data.Distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [IsArrive]
    data.IsArrive = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nav_uas/Nav_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '39a4dfb897b4de0e5aa5ba62412e2faf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 Angle
    float64 Distance
    int16 IsArrive
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Nav_msg(null);
    if (msg.Angle !== undefined) {
      resolved.Angle = msg.Angle;
    }
    else {
      resolved.Angle = 0.0
    }

    if (msg.Distance !== undefined) {
      resolved.Distance = msg.Distance;
    }
    else {
      resolved.Distance = 0.0
    }

    if (msg.IsArrive !== undefined) {
      resolved.IsArrive = msg.IsArrive;
    }
    else {
      resolved.IsArrive = 0
    }

    return resolved;
    }
};

module.exports = Nav_msg;
