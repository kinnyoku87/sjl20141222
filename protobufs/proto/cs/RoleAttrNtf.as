package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.CampLevel;
	import proto.com.RoleInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoleAttrNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleAttrNtf.role_info", "roleInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoleInfo; });

		private var role_info$field:proto.com.RoleInfo;

		public function clearRoleInfo():void {
			role_info$field = null;
		}

		public function get hasRoleInfo():Boolean {
			return role_info$field != null;
		}

		public function set roleInfo(value:proto.com.RoleInfo):void {
			role_info$field = value;
		}

		public function get roleInfo():proto.com.RoleInfo {
			return role_info$field;
		}

		/**
		 *  @private
		 */
		public static const CAMP_LEVELS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RoleAttrNtf.camp_levels", "campLevels", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CampLevel; });

		[ArrayElementType("proto.com.CampLevel")]
		public var campLevels:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_info$field);
			}
			for (var campLevels$index:uint = 0; campLevels$index < this.campLevels.length; ++campLevels$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.campLevels[campLevels$index]);
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
						throw new flash.errors.IOError('Bad data format: RoleAttrNtf.roleInfo cannot be set twice.');
					}
					++role_info$count;
					this.roleInfo = new proto.com.RoleInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleInfo);
					break;
				case 3:
					this.campLevels.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CampLevel()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
