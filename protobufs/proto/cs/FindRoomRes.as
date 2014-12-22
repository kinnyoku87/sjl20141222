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
	public dynamic final class FindRoomRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OFFSET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.FindRoomRes.offset", "offset", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var offset$field:int;

		private var hasField$0:uint = 0;

		public function clearOffset():void {
			hasField$0 &= 0xfffffffe;
			offset$field = new int();
		}

		public function get hasOffset():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set offset(value:int):void {
			hasField$0 |= 0x1;
			offset$field = value;
		}

		public function get offset():int {
			return offset$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ROOM_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.FindRoomRes.total_room_count", "totalRoomCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_room_count$field:int;

		public function clearTotalRoomCount():void {
			hasField$0 &= 0xfffffffd;
			total_room_count$field = new int();
		}

		public function get hasTotalRoomCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set totalRoomCount(value:int):void {
			hasField$0 |= 0x2;
			total_room_count$field = value;
		}

		public function get totalRoomCount():int {
			return total_room_count$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_BASE_INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.FindRoomRes.room_base_info", "roomBaseInfo", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomBaseInfo; });

		[ArrayElementType("proto.com.RoomBaseInfo")]
		public var roomBaseInfo:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOffset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, offset$field);
			}
			if (hasTotalRoomCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_room_count$field);
			}
			for (var roomBaseInfo$index:uint = 0; roomBaseInfo$index < this.roomBaseInfo.length; ++roomBaseInfo$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.roomBaseInfo[roomBaseInfo$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var offset$count:uint = 0;
			var total_room_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (offset$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomRes.offset cannot be set twice.');
					}
					++offset$count;
					this.offset = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (total_room_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomRes.totalRoomCount cannot be set twice.');
					}
					++total_room_count$count;
					this.totalRoomCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					this.roomBaseInfo.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.RoomBaseInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
