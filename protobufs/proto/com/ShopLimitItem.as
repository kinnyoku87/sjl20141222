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
	public dynamic final class ShopLimitItem extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ITEM_RES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ShopLimitItem.item_res_id", "itemResId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_res_id$field:int;

		private var hasField$0:uint = 0;

		public function clearItemResId():void {
			hasField$0 &= 0xfffffffe;
			item_res_id$field = new int();
		}

		public function get hasItemResId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set itemResId(value:int):void {
			hasField$0 |= 0x1;
			item_res_id$field = value;
		}

		public function get itemResId():int {
			return item_res_id$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ShopLimitItem.item_count", "itemCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_count$field:int;

		public function clearItemCount():void {
			hasField$0 &= 0xfffffffd;
			item_count$field = new int();
		}

		public function get hasItemCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set itemCount(value:int):void {
			hasField$0 |= 0x2;
			item_count$field = value;
		}

		public function get itemCount():int {
			return item_count$field;
		}

		/**
		 *  @private
		 */
		public static const UPDATE_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.ShopLimitItem.update_time", "updateTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var update_time$field:uint;

		public function clearUpdateTime():void {
			hasField$0 &= 0xfffffffb;
			update_time$field = new uint();
		}

		public function get hasUpdateTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set updateTime(value:uint):void {
			hasField$0 |= 0x4;
			update_time$field = value;
		}

		public function get updateTime():uint {
			return update_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasItemResId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_res_id$field);
			}
			if (hasItemCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_count$field);
			}
			if (hasUpdateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, update_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var item_res_id$count:uint = 0;
			var item_count$count:uint = 0;
			var update_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (item_res_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopLimitItem.itemResId cannot be set twice.');
					}
					++item_res_id$count;
					this.itemResId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (item_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopLimitItem.itemCount cannot be set twice.');
					}
					++item_count$count;
					this.itemCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (update_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopLimitItem.updateTime cannot be set twice.');
					}
					++update_time$count;
					this.updateTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
