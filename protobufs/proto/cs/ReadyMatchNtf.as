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
	public dynamic final class ReadyMatchNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const READYER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ReadyMatchNtf.readyer_id", "readyerId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var readyer_id$field:UInt64;

		public function clearReadyerId():void {
			readyer_id$field = null;
		}

		public function get hasReadyerId():Boolean {
			return readyer_id$field != null;
		}

		public function set readyerId(value:UInt64):void {
			readyer_id$field = value;
		}

		public function get readyerId():UInt64 {
			return readyer_id$field;
		}

		/**
		 *  @private
		 */
		public static const READY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.ReadyMatchNtf.ready", "ready", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
			if (hasReadyerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, readyer_id$field);
			}
			if (hasReady) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
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
			var readyer_id$count:uint = 0;
			var ready$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (readyer_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReadyMatchNtf.readyerId cannot be set twice.');
					}
					++readyer_id$count;
					this.readyerId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (ready$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReadyMatchNtf.ready cannot be set twice.');
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
