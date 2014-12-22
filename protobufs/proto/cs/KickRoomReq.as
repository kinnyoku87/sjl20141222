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
	public dynamic final class KickRoomReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KICKEDER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.KickRoomReq.kickeder_id", "kickederId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kickeder_id$field:UInt64;

		public function clearKickederId():void {
			kickeder_id$field = null;
		}

		public function get hasKickederId():Boolean {
			return kickeder_id$field != null;
		}

		public function set kickederId(value:UInt64):void {
			kickeder_id$field = value;
		}

		public function get kickederId():UInt64 {
			return kickeder_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKickederId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, kickeder_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var kickeder_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (kickeder_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: KickRoomReq.kickederId cannot be set twice.');
					}
					++kickeder_id$count;
					this.kickederId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
