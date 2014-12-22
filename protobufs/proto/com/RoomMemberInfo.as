package proto.com {
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
	public dynamic final class RoomMemberInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.RoomMemberInfo.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var role_id$field:UInt64;

		public function clearRoleId():void {
			role_id$field = null;
		}

		public function get hasRoleId():Boolean {
			return role_id$field != null;
		}

		public function set roleId(value:UInt64):void {
			role_id$field = value;
		}

		public function get roleId():UInt64 {
			return role_id$field;
		}

		/**
		 *  @private
		 */
		public static const READY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.RoomMemberInfo.ready", "ready", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ready$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearReady():void {
			hasField$0 &= 0xfffffffe;
			ready$field = new Boolean();
		}

		public function get hasReady():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ready(value:Boolean):void {
			hasField$0 |= 0x1;
			ready$field = value;
		}

		public function get ready():Boolean {
			return ready$field;
		}

		/**
		 *  @private
		 */
		public static const CHAIR_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomMemberInfo.chair_id", "chairId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chair_id$field:int;

		public function clearChairId():void {
			hasField$0 &= 0xfffffffd;
			chair_id$field = new int();
		}

		public function get hasChairId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set chairId(value:int):void {
			hasField$0 |= 0x2;
			chair_id$field = value;
		}

		public function get chairId():int {
			return chair_id$field;
		}

		/**
		 *  @private
		 */
		public static const CAMP_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomMemberInfo.camp_id", "campId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var camp_id$field:int;

		public function clearCampId():void {
			hasField$0 &= 0xfffffffb;
			camp_id$field = new int();
		}

		public function get hasCampId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set campId(value:int):void {
			hasField$0 |= 0x4;
			camp_id$field = value;
		}

		public function get campId():int {
			return camp_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasReady) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, ready$field);
			}
			if (hasChairId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chair_id$field);
			}
			if (hasCampId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, camp_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var role_id$count:uint = 0;
			var ready$count:uint = 0;
			var chair_id$count:uint = 0;
			var camp_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMemberInfo.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (ready$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMemberInfo.ready cannot be set twice.');
					}
					++ready$count;
					this.ready = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (chair_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMemberInfo.chairId cannot be set twice.');
					}
					++chair_id$count;
					this.chairId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (camp_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMemberInfo.campId cannot be set twice.');
					}
					++camp_id$count;
					this.campId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}