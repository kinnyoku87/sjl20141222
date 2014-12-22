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
	public dynamic final class DeleteFriendRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TARGET_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.DeleteFriendRes.target_role_id", "targetRoleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var target_role_id$field:UInt64;

		public function clearTargetRoleId():void {
			target_role_id$field = null;
		}

		public function get hasTargetRoleId():Boolean {
			return target_role_id$field != null;
		}

		public function set targetRoleId(value:UInt64):void {
			target_role_id$field = value;
		}

		public function get targetRoleId():UInt64 {
			return target_role_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTargetRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_role_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var target_role_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (target_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DeleteFriendRes.targetRoleId cannot be set twice.');
					}
					++target_role_id$count;
					this.targetRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
