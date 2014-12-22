package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.RoomBaseInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ReconnectPvpIngNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_BASE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ReconnectPvpIngNtf.room_base_info", "roomBaseInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomBaseInfo; });

		private var room_base_info$field:proto.com.RoomBaseInfo;

		public function clearRoomBaseInfo():void {
			room_base_info$field = null;
		}

		public function get hasRoomBaseInfo():Boolean {
			return room_base_info$field != null;
		}

		public function set roomBaseInfo(value:proto.com.RoomBaseInfo):void {
			room_base_info$field = value;
		}

		public function get roomBaseInfo():proto.com.RoomBaseInfo {
			return room_base_info$field;
		}

		/**
		 *  @private
		 */
		public static const CHECK_CODE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ReconnectPvpIngNtf.check_code", "checkCode", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var check_code$field:String;

		public function clearCheckCode():void {
			check_code$field = null;
		}

		public function get hasCheckCode():Boolean {
			return check_code$field != null;
		}

		public function set checkCode(value:String):void {
			check_code$field = value;
		}

		public function get checkCode():String {
			return check_code$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomBaseInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room_base_info$field);
			}
			if (hasCheckCode) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, check_code$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var room_base_info$count:uint = 0;
			var check_code$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_base_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReconnectPvpIngNtf.roomBaseInfo cannot be set twice.');
					}
					++room_base_info$count;
					this.roomBaseInfo = new proto.com.RoomBaseInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roomBaseInfo);
					break;
				case 2:
					if (check_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReconnectPvpIngNtf.checkCode cannot be set twice.');
					}
					++check_code$count;
					this.checkCode = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
