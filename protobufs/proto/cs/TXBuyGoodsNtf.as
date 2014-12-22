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
	public dynamic final class TXBuyGoodsNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const URL_PARAMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.TXBuyGoodsNtf.url_params", "urlParams", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var url_params$field:String;

		public function clearUrlParams():void {
			url_params$field = null;
		}

		public function get hasUrlParams():Boolean {
			return url_params$field != null;
		}

		public function set urlParams(value:String):void {
			url_params$field = value;
		}

		public function get urlParams():String {
			return url_params$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUrlParams) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, url_params$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var url_params$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (url_params$count != 0) {
						throw new flash.errors.IOError('Bad data format: TXBuyGoodsNtf.urlParams cannot be set twice.');
					}
					++url_params$count;
					this.urlParams = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
