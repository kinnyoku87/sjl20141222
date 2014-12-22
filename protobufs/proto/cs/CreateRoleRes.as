package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.LoginRoleInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CreateRoleRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.CreateRoleRes.role_info", "roleInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.LoginRoleInfo; });

		private var role_info$field:proto.com.LoginRoleInfo;

		public function clearRoleInfo():void {
			role_info$field = null;
		}

		public function get hasRoleInfo():Boolean {
			return role_info$field != null;
		}

		public function set roleInfo(value:proto.com.LoginRoleInfo):void {
			role_info$field = value;
		}

		public function get roleInfo():proto.com.LoginRoleInfo {
			return role_info$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_info$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var role_info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: CreateRoleRes.roleInfo cannot be set twice.');
					}
					++role_info$count;
					this.roleInfo = new proto.com.LoginRoleInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleInfo);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
