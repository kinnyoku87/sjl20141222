package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.Friend_Type;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChangeFriendTypeReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OWNER_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ChangeFriendTypeReq.owner_role_id", "ownerRoleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var owner_role_id$field:UInt64;

		public function clearOwnerRoleId():void {
			owner_role_id$field = null;
		}

		public function get hasOwnerRoleId():Boolean {
			return owner_role_id$field != null;
		}

		public function set ownerRoleId(value:UInt64):void {
			owner_role_id$field = value;
		}

		public function get ownerRoleId():UInt64 {
			return owner_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const OWNER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ChangeFriendTypeReq.owner_name", "ownerName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var owner_name$field:String;

		public function clearOwnerName():void {
			owner_name$field = null;
		}

		public function get hasOwnerName():Boolean {
			return owner_name$field != null;
		}

		public function set ownerName(value:String):void {
			owner_name$field = value;
		}

		public function get ownerName():String {
			return owner_name$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ChangeFriendTypeReq.target_role_id", "targetRoleId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TARGET_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.cs.ChangeFriendTypeReq.target_type", "targetType", (4 << 3) | com.netease.protobuf.WireType.VARINT, proto.com.Friend_Type);

		private var target_type$field:int;

		private var hasField$0:uint = 0;

		public function clearTargetType():void {
			hasField$0 &= 0xfffffffe;
			target_type$field = new int();
		}

		public function get hasTargetType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set targetType(value:int):void {
			hasField$0 |= 0x1;
			target_type$field = value;
		}

		public function get targetType():int {
			return target_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOwnerRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, owner_role_id$field);
			}
			if (hasOwnerName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, owner_name$field);
			}
			if (hasTargetRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_role_id$field);
			}
			if (hasTargetType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, target_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var owner_role_id$count:uint = 0;
			var owner_name$count:uint = 0;
			var target_role_id$count:uint = 0;
			var target_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (owner_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeFriendTypeReq.ownerRoleId cannot be set twice.');
					}
					++owner_role_id$count;
					this.ownerRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (owner_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeFriendTypeReq.ownerName cannot be set twice.');
					}
					++owner_name$count;
					this.ownerName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (target_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeFriendTypeReq.targetRoleId cannot be set twice.');
					}
					++target_role_id$count;
					this.targetRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (target_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeFriendTypeReq.targetType cannot be set twice.');
					}
					++target_type$count;
					this.targetType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
