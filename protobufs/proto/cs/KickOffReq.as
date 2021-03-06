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
	public dynamic final class KickOffReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_KICK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.KickOffReq.is_kick", "isKick", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_kick$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsKick():void {
			hasField$0 &= 0xfffffffe;
			is_kick$field = new Boolean();
		}

		public function get hasIsKick():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isKick(value:Boolean):void {
			hasField$0 |= 0x1;
			is_kick$field = value;
		}

		public function get isKick():Boolean {
			return is_kick$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsKick) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_kick$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_kick$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_kick$count != 0) {
						throw new flash.errors.IOError('Bad data format: KickOffReq.isKick cannot be set twice.');
					}
					++is_kick$count;
					this.isKick = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
