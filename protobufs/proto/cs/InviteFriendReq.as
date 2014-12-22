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
	public dynamic final class InviteFriendReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TARGET_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.InviteFriendReq.target_role_id", "targetRoleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const INVITE_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.InviteFriendReq.invite_role_id", "inviteRoleId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const INVITE_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.InviteFriendReq.invite_name", "inviteName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var invite_name$field:String;

		public function clearInviteName():void {
			invite_name$field = null;
		}

		public function get hasInviteName():Boolean {
			return invite_name$field != null;
		}

		public function set inviteName(value:String):void {
			invite_name$field = value;
		}

		public function get inviteName():String {
			return invite_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTargetRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_role_id$field);
			}
			if (hasInviteRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, invite_role_id$field);
			}
			if (hasInviteName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, invite_name$field);
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
			var invite_role_id$count:uint = 0;
			var invite_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (target_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: InviteFriendReq.targetRoleId cannot be set twice.');
					}
					++target_role_id$count;
					this.targetRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (invite_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: InviteFriendReq.inviteRoleId cannot be set twice.');
					}
					++invite_role_id$count;
					this.inviteRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (invite_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: InviteFriendReq.inviteName cannot be set twice.');
					}
					++invite_name$count;
					this.inviteName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
