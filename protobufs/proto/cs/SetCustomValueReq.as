package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.CustomValue;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SetCustomValueReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CUSTOM_VALUE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.SetCustomValueReq.custom_value", "customValue", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CustomValue; });

		private var custom_value$field:proto.com.CustomValue;

		public function clearCustomValue():void {
			custom_value$field = null;
		}

		public function get hasCustomValue():Boolean {
			return custom_value$field != null;
		}

		public function set customValue(value:proto.com.CustomValue):void {
			custom_value$field = value;
		}

		public function get customValue():proto.com.CustomValue {
			return custom_value$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCustomValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, custom_value$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var custom_value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (custom_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: SetCustomValueReq.customValue cannot be set twice.');
					}
					++custom_value$count;
					this.customValue = new proto.com.CustomValue();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.customValue);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
