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
	public dynamic final class AcceptFriendRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_AGREE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.AcceptFriendRes.is_agree", "isAgree", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_agree$field:uint;

		private var hasField$0:uint = 0;

		public function clearIsAgree():void {
			hasField$0 &= 0xfffffffe;
			is_agree$field = new uint();
		}

		public function get hasIsAgree():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isAgree(value:uint):void {
			hasField$0 |= 0x1;
			is_agree$field = value;
		}

		public function get isAgree():uint {
			return is_agree$field;
		}

		/**
		 *  @private
		 */
		public static const INVITE_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.AcceptFriendRes.invite_role_id", "inviteRoleId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var invite_role_id$field:UInt64;

		public function clearInviteRoleId():void {
			invite_role_id$field = null;
		}

		public function get hasInviteRoleId():Boolean {
			return invite_role_id$field != null;
		}

		public function set inviteRoleId(value:UInt64):void {
			invite_role_id$field = value;
		}

		public function get inviteRoleId():UInt64 {
			return invite_role_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsAgree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, is_agree$field);
			}
			if (hasInviteRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, invite_role_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_agree$count:uint = 0;
			var invite_role_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_agree$count != 0) {
						throw new flash.errors.IOError('Bad data format: AcceptFriendRes.isAgree cannot be set twice.');
					}
					++is_agree$count;
					this.isAgree = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (invite_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AcceptFriendRes.inviteRoleId cannot be set twice.');
					}
					++invite_role_id$count;
					this.inviteRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
