package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ModifyRoomParamNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ModifyRoomParamNtf.room_name", "roomName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var room_name$field:String;

		public function clearRoomName():void {
			room_name$field = null;
		}

		public function get hasRoomName():Boolean {
			return room_name$field != null;
		}

		public function set roomName(value:String):void {
			room_name$field = value;
		}

		public function get roomName():String {
			return room_name$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_PWD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ModifyRoomParamNtf.room_pwd", "roomPwd", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var room_pwd$field:String;

		public function clearRoomPwd():void {
			room_pwd$field = null;
		}

		public function get hasRoomPwd():Boolean {
			return room_pwd$field != null;
		}

		public function set roomPwd(value:String):void {
			room_pwd$field = value;
		}

		public function get roomPwd():String {
			return room_pwd$field;
		}

		/**
		 *  @private
		 */
		public static const OWNER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ModifyRoomParamNtf.owner_id", "ownerId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var owner_id$field:UInt64;

		public function clearOwnerId():void {
			owner_id$field = null;
		}

		public function get hasOwnerId():Boolean {
			return owner_id$field != null;
		}

		public function set ownerId(value:UInt64):void {
			owner_id$field = value;
		}

		public function get ownerId():UInt64 {
			return owner_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, room_name$field);
			}
			if (hasRoomPwd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, room_pwd$field);
			}
			if (hasOwnerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, owner_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var room_name$count:uint = 0;
			var room_pwd$count:uint = 0;
			var owner_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (room_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ModifyRoomParamNtf.roomName cannot be set twice.');
					}
					++room_name$count;
					this.roomName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (room_pwd$count != 0) {
						throw new flash.errors.IOError('Bad data format: ModifyRoomParamNtf.roomPwd cannot be set twice.');
					}
					++room_pwd$count;
					this.roomPwd = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (owner_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ModifyRoomParamNtf.ownerId cannot be set twice.');
					}
					++owner_id$count;
					this.ownerId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
