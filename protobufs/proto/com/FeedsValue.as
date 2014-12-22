package proto.com {
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
	public dynamic final class FeedsValue extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FEEDS_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.FeedsValue.feeds_id", "feedsId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var feeds_id$field:int;

		private var hasField$0:uint = 0;

		public function clearFeedsId():void {
			hasField$0 &= 0xfffffffe;
			feeds_id$field = new int();
		}

		public function get hasFeedsId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set feedsId(value:int):void {
			hasField$0 |= 0x1;
			feeds_id$field = value;
		}

		public function get feedsId():int {
			return feeds_id$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.FeedsValue.count", "count", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffd;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x2;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFeedsId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, feeds_id$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var feeds_id$count:uint = 0;
			var count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (feeds_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FeedsValue.feedsId cannot be set twice.');
					}
					++feeds_id$count;
					this.feedsId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FeedsValue.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
