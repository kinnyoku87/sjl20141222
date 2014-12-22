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
	public dynamic final class SaleItemReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ITEM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SaleItemReq.item_id", "itemId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_id$field:UInt64;

		public function clearItemId():void {
			item_id$field = null;
		}

		public function get hasItemId():Boolean {
			return item_id$field != null;
		}

		public function set itemId(value:UInt64):void {
			item_id$field = value;
		}

		public function get itemId():UInt64 {
			return item_id$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SaleItemReq.item_count", "itemCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_count$field:int;

		private var hasField$0:uint = 0;

		public function clearItemCount():void {
			hasField$0 &= 0xfffffffe;
			item_count$field = new int();
		}

		public function get hasItemCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set itemCount(value:int):void {
			hasField$0 |= 0x1;
			item_count$field = value;
		}

		public function get itemCount():int {
			return item_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasItemId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, item_id$field);
			}
			if (hasItemCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var item_id$count:uint = 0;
			var item_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (item_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SaleItemReq.itemId cannot be set twice.');
					}
					++item_id$count;
					this.itemId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (item_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: SaleItemReq.itemCount cannot be set twice.');
					}
					++item_count$count;
					this.itemCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
