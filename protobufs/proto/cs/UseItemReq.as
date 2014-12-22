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
	public dynamic final class UseItemReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ITEM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.UseItemReq.item_id", "itemId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CB_DATA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UseItemReq.cb_data", "cbData", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cb_data$field:int;

		private var hasField$0:uint = 0;

		public function clearCbData():void {
			hasField$0 &= 0xfffffffe;
			cb_data$field = new int();
		}

		public function get hasCbData():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cbData(value:int):void {
			hasField$0 |= 0x1;
			cb_data$field = value;
		}

		public function get cbData():int {
			return cb_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasItemId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, item_id$field);
			}
			if (hasCbData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cb_data$field);
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
			var cb_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (item_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: UseItemReq.itemId cannot be set twice.');
					}
					++item_id$count;
					this.itemId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (cb_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: UseItemReq.cbData cannot be set twice.');
					}
					++cb_data$count;
					this.cbData = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
