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
	public dynamic final class DeleteFriendNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INVOKE_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.DeleteFriendNtf.invoke_role_id", "invokeRoleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var invoke_role_id$field:UInt64;

		public function clearInvokeRoleId():void {
			invoke_role_id$field = null;
		}

		public function get hasInvokeRoleId():Boolean {
			return invoke_role_id$field != null;
		}

		public function set invokeRoleId(value:UInt64):void {
			invoke_role_id$field = value;
		}

		public function get invokeRoleId():UInt64 {
			return invoke_role_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasInvokeRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, invoke_role_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var invoke_role_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (invoke_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DeleteFriendNtf.invokeRoleId cannot be set twice.');
					}
					++invoke_role_id$count;
					this.invokeRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
