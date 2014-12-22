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
	public dynamic final class ResetQuestRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ResetQuestRes.res_id", "resId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_id$field:int;

		private var hasField$0:uint = 0;

		public function clearResId():void {
			hasField$0 &= 0xfffffffe;
			res_id$field = new int();
		}

		public function get hasResId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set resId(value:int):void {
			hasField$0 |= 0x1;
			res_id$field = value;
		}

		public function get resId():int {
			return res_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasResId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var res_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (res_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResetQuestRes.resId cannot be set twice.');
					}
					++res_id$count;
					this.resId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
