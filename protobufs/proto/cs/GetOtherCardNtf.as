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
	public dynamic final class GetOtherCardNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GetOtherCardNtf.card_id", "cardId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var card_id$field:int;

		private var hasField$0:uint = 0;

		public function clearCardId():void {
			hasField$0 &= 0xfffffffe;
			card_id$field = new int();
		}

		public function get hasCardId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cardId(value:int):void {
			hasField$0 |= 0x1;
			card_id$field = value;
		}

		public function get cardId():int {
			return card_id$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GetOtherCardNtf.from_type", "fromType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_type$field:int;

		public function clearFromType():void {
			hasField$0 &= 0xfffffffd;
			from_type$field = new int();
		}

		public function get hasFromType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set fromType(value:int):void {
			hasField$0 |= 0x2;
			from_type$field = value;
		}

		public function get fromType():int {
			return from_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, card_id$field);
			}
			if (hasFromType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, from_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var card_id$count:uint = 0;
			var from_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetOtherCardNtf.cardId cannot be set twice.');
					}
					++card_id$count;
					this.cardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (from_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetOtherCardNtf.fromType cannot be set twice.');
					}
					++from_type$count;
					this.fromType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
