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
	public dynamic final class QuitRoomNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const QUITER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.QuitRoomNtf.quiter_id", "quiterId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var quiter_id$field:UInt64;

		public function clearQuiterId():void {
			quiter_id$field = null;
		}

		public function get hasQuiterId():Boolean {
			return quiter_id$field != null;
		}

		public function set quiterId(value:UInt64):void {
			quiter_id$field = value;
		}

		public function get quiterId():UInt64 {
			return quiter_id$field;
		}

		/**
		 *  @private
		 */
		public static const QUIT_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.QuitRoomNtf.quit_type", "quitType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var quit_type$field:int;

		private var hasField$0:uint = 0;

		public function clearQuitType():void {
			hasField$0 &= 0xfffffffe;
			quit_type$field = new int();
		}

		public function get hasQuitType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set quitType(value:int):void {
			hasField$0 |= 0x1;
			quit_type$field = value;
		}

		public function get quitType():int {
			return quit_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasQuiterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, quiter_id$field);
			}
			if (hasQuitType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, quit_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var quiter_id$count:uint = 0;
			var quit_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (quiter_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuitRoomNtf.quiterId cannot be set twice.');
					}
					++quiter_id$count;
					this.quiterId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (quit_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuitRoomNtf.quitType cannot be set twice.');
					}
					++quit_type$count;
					this.quitType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
