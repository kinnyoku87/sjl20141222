package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.BattleMemberInfo;
	import proto.com.RoomBaseInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StartMatchNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_BASE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.StartMatchNtf.room_base_info", "roomBaseInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomBaseInfo; });

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
		public static const MEMBERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.StartMatchNtf.members", "members", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.BattleMemberInfo; });

		[ArrayElementType("proto.com.BattleMemberInfo")]
		public var members:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomBaseInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room_base_info$field);
			}
			for (var members$index:uint = 0; members$index < this.members.length; ++members$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.members[members$index]);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_base_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: StartMatchNtf.roomBaseInfo cannot be set twice.');
					}
					++room_base_info$count;
					this.roomBaseInfo = new proto.com.RoomBaseInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roomBaseInfo);
					break;
				case 2:
					this.members.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.BattleMemberInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
