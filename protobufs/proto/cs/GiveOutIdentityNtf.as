package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.RoleIdentity;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GiveOutIdentityNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLES_IDENTITY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GiveOutIdentityNtf.roles_identity", "rolesIdentity", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleIdentity; });

		[ArrayElementType("proto.cs.RoleIdentity")]
		public var rolesIdentity:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var rolesIdentity$index:uint = 0; rolesIdentity$index < this.rolesIdentity.length; ++rolesIdentity$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.rolesIdentity[rolesIdentity$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.rolesIdentity.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.RoleIdentity()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
