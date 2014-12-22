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
	public dynamic final class GivingAskItem extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ASKER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.GivingAskItem.asker_id", "askerId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var asker_id$field:UInt64;

		public function clearAskerId():void {
			asker_id$field = null;
		}

		public function get hasAskerId():Boolean {
			return asker_id$field != null;
		}

		public function set askerId(value:UInt64):void {
			asker_id$field = value;
		}

		public function get askerId():UInt64 {
			return asker_id$field;
		}

		/**
		 *  @private
		 */
		public static const ASK_GIVING_ITEM_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.GivingAskItem.ask_giving_item_id", "askGivingItemId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ask_giving_item_id$field:int;

		private var hasField$0:uint = 0;

		public function clearAskGivingItemId():void {
			hasField$0 &= 0xfffffffe;
			ask_giving_item_id$field = new int();
		}

		public function get hasAskGivingItemId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set askGivingItemId(value:int):void {
			hasField$0 |= 0x1;
			ask_giving_item_id$field = value;
		}

		public function get askGivingItemId():int {
			return ask_giving_item_id$field;
		}

		/**
		 *  @private
		 */
		public static const ASK_ITEM_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.GivingAskItem.ask_item_count", "askItemCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ask_item_count$field:int;

		public function clearAskItemCount():void {
			hasField$0 &= 0xfffffffd;
			ask_item_count$field = new int();
		}

		public function get hasAskItemCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set askItemCount(value:int):void {
			hasField$0 |= 0x2;
			ask_item_count$field = value;
		}

		public function get askItemCount():int {
			return ask_item_count$field;
		}

		/**
		 *  @private
		 */
		public static const RAND_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.GivingAskItem.rand_uid", "randUid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rand_uid$field:UInt64;

		public function clearRandUid():void {
			rand_uid$field = null;
		}

		public function get hasRandUid():Boolean {
			return rand_uid$field != null;
		}

		public function set randUid(value:UInt64):void {
			rand_uid$field = value;
		}

		public function get randUid():UInt64 {
			return rand_uid$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.GivingAskItem.time", "time", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:uint;

		public function clearTime():void {
			hasField$0 &= 0xfffffffb;
			time$field = new uint();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set time(value:uint):void {
			hasField$0 |= 0x4;
			time$field = value;
		}

		public function get time():uint {
			return time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAskerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, asker_id$field);
			}
			if (hasAskGivingItemId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ask_giving_item_id$field);
			}
			if (hasAskItemCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ask_item_count$field);
			}
			if (hasRandUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, rand_uid$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var asker_id$count:uint = 0;
			var ask_giving_item_id$count:uint = 0;
			var ask_item_count$count:uint = 0;
			var rand_uid$count:uint = 0;
			var time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (asker_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingAskItem.askerId cannot be set twice.');
					}
					++asker_id$count;
					this.askerId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (ask_giving_item_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingAskItem.askGivingItemId cannot be set twice.');
					}
					++ask_giving_item_id$count;
					this.askGivingItemId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (ask_item_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingAskItem.askItemCount cannot be set twice.');
					}
					++ask_item_count$count;
					this.askItemCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (rand_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingAskItem.randUid cannot be set twice.');
					}
					++rand_uid$count;
					this.randUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 5:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingAskItem.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
