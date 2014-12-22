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
	public dynamic final class TXApiParam extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PARAM_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.TXApiParam.param_name", "paramName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var param_name$field:String;

		public function clearParamName():void {
			param_name$field = null;
		}

		public function get hasParamName():Boolean {
			return param_name$field != null;
		}

		public function set paramName(value:String):void {
			param_name$field = value;
		}

		public function get paramName():String {
			return param_name$field;
		}

		/**
		 *  @private
		 */
		public static const PARAM_VALUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.TXApiParam.param_value", "paramValue", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var param_value$field:String;

		public function clearParamValue():void {
			param_value$field = null;
		}

		public function get hasParamValue():Boolean {
			return param_value$field != null;
		}

		public function set paramValue(value:String):void {
			param_value$field = value;
		}

		public function get paramValue():String {
			return param_value$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasParamName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, param_name$field);
			}
			if (hasParamValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, param_value$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var param_name$count:uint = 0;
			var param_value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (param_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: TXApiParam.paramName cannot be set twice.');
					}
					++param_name$count;
					this.paramName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (param_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: TXApiParam.paramValue cannot be set twice.');
					}
					++param_value$count;
					this.paramValue = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
