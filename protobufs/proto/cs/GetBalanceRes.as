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
	public dynamic final class GetBalanceRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BALANCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GetBalanceRes.balance", "balance", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var balance$field:int;

		private var hasField$0:uint = 0;

		public function clearBalance():void {
			hasField$0 &= 0xfffffffe;
			balance$field = new int();
		}

		public function get hasBalance():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set balance(value:int):void {
			hasField$0 |= 0x1;
			balance$field = value;
		}

		public function get balance():int {
			return balance$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBalance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, balance$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var balance$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (balance$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetBalanceRes.balance cannot be set twice.');
					}
					++balance$count;
					this.balance = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
