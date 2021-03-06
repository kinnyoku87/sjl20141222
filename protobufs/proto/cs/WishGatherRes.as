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
	public dynamic final class WishGatherRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ITEM_RES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.WishGatherRes.item_res_id", "itemResId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasItemResId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_res_id$field);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (item_res_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: WishGatherRes.itemResId cannot be set twice.');
					}
					++item_res_id$count;
					this.itemResId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
