package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.RoomMemberInfo;
	import proto.com.RoomBaseInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class JoinRoomRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_BASE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.JoinRoomRes.room_base_info", "roomBaseInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomBaseInfo; });

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
		public static const CLOSE_CHAIRS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.JoinRoomRes.close_chairs", "closeChairs", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var closeChairs:Array = [];

		/**
		 *  @private
		 */
		public static const MEMBERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.JoinRoomRes.members", "members", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomMemberInfo; });

		[ArrayElementType("proto.com.RoomMemberInfo")]
		public var members:Array = [];

		/**
		 *  @private
		 */
		public static const CHECK_CODE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.JoinRoomRes.check_code", "checkCode", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const CHAIR_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.JoinRoomRes.chair_id", "chairId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chair_id$field:int;

		private var hasField$0:uint = 0;

		public function clearChairId():void {
			hasField$0 &= 0xfffffffe;
			chair_id$field = new int();
		}

		public function get hasChairId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chairId(value:int):void {
			hasField$0 |= 0x1;
			chair_id$field = value;
		}

		public function get chairId():int {
			return chair_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomBaseInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room_base_info$field);
			}
			for (var closeChairs$index:uint = 0; closeChairs$index < this.closeChairs.length; ++closeChairs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.closeChairs[closeChairs$index]);
			}
			for (var members$index:uint = 0; members$index < this.members.length; ++members$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.members[members$index]);
			}
			if (hasCheckCode) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, check_code$field);
			}
			if (hasChairId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chair_id$field);
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
			var chair_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_base_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomRes.roomBaseInfo cannot be set twice.');
					}
					++room_base_info$count;
					this.roomBaseInfo = new proto.com.RoomBaseInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roomBaseInfo);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.closeChairs);
						break;
					}
					this.closeChairs.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 3:
					this.members.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.RoomMemberInfo()));
					break;
				case 4:
					if (check_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomRes.checkCode cannot be set twice.');
					}
					++check_code$count;
					this.checkCode = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (chair_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomRes.chairId cannot be set twice.');
					}
					++chair_id$count;
					this.chairId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
