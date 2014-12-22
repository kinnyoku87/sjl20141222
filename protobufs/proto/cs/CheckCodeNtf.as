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
	public dynamic final class CheckCodeNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHECK_CODE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.CheckCodeNtf.check_code", "checkCode", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var check_code$field:String;

		public function clearCheckCode():void {
			check_code$field = null;
		}

		public function get hasCheckCode():Boolean {
			return check_code$field != null;
		}

		public function set checkCode(value:String):void {
			check_code$field = value;
		}

		public function get checkCode():String {
			return check_code$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCheckCode) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, check_code$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var check_code$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (check_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: CheckCodeNtf.checkCode cannot be set twice.');
					}
					++check_code$count;
					this.checkCode = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
