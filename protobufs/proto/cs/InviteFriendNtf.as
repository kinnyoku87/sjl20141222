package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.List_Unit;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class InviteFriendNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INVITE_ROLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.InviteFriendNtf.invite_role", "inviteRole", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.List_Unit; });

		private var invite_role$field:proto.com.List_Unit;

		public function clearInviteRole():void {
			invite_role$field = null;
		}

		public function get hasInviteRole():Boolean {
			return invite_role$field != null;
		}

		public function set inviteRole(value:proto.com.List_Unit):void {
			invite_role$field = value;
		}

		public function get inviteRole():proto.com.List_Unit {
			return invite_role$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasInviteRole) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, invite_role$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var invite_role$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (invite_role$count != 0) {
						throw new flash.errors.IOError('Bad data format: InviteFriendNtf.inviteRole cannot be set twice.');
					}
					++invite_role$count;
					this.inviteRole = new proto.com.List_Unit();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.inviteRole);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
