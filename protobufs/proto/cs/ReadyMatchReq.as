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
	public dynamic final class ReadyMatchReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const READY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.ReadyMatchReq.ready", "ready", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ready$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearReady():void {
			hasField$0 &= 0xfffffffe;
			ready$field = new Boolean();
		}

		public function get hasReady():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ready(value:Boolean):void {
			hasField$0 |= 0x1;
			ready$field = value;
		}

		public function get ready():Boolean {
			return ready$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasReady) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, ready$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var ready$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ready$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReadyMatchReq.ready cannot be set twice.');
					}
					++ready$count;
					this.ready = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
