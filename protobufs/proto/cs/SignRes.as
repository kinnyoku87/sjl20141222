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
	public dynamic final class SignRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CB_DATA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SignRes.cb_data", "cbData", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
			if (hasCbData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
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
			var cb_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cb_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: SignRes.cbData cannot be set twice.');
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
