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
	public dynamic final class JoinRoomNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const JOINER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.JoinRoomNtf.joiner_id", "joinerId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var joiner_id$field:UInt64;

		public function clearJoinerId():void {
			joiner_id$field = null;
		}

		public function get hasJoinerId():Boolean {
			return joiner_id$field != null;
		}

		public function set joinerId(value:UInt64):void {
			joiner_id$field = value;
		}

		public function get joinerId():UInt64 {
			return joiner_id$field;
		}

		/**
		 *  @private
		 */
		public static const CHAIR_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.JoinRoomNtf.chair_id", "chairId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const IS_ROBOT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.JoinRoomNtf.is_robot", "isRobot", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_robot$field:Boolean;

		public function clearIsRobot():void {
			hasField$0 &= 0xfffffffd;
			is_robot$field = new Boolean();
		}

		public function get hasIsRobot():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isRobot(value:Boolean):void {
			hasField$0 |= 0x2;
			is_robot$field = value;
		}

		public function get isRobot():Boolean {
			return is_robot$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasJoinerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, joiner_id$field);
			}
			if (hasChairId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chair_id$field);
			}
			if (hasIsRobot) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_robot$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var joiner_id$count:uint = 0;
			var chair_id$count:uint = 0;
			var is_robot$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (joiner_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomNtf.joinerId cannot be set twice.');
					}
					++joiner_id$count;
					this.joinerId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (chair_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomNtf.chairId cannot be set twice.');
					}
					++chair_id$count;
					this.chairId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (is_robot$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomNtf.isRobot cannot be set twice.');
					}
					++is_robot$count;
					this.isRobot = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
