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
	public dynamic final class RoleReconnectCardInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.RoleReconnectCardInfo.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const HAND_CARD_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RoleReconnectCardInfo.hand_card_count", "handCardCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hand_card_count$field:int;

		private var hasField$0:uint = 0;

		public function clearHandCardCount():void {
			hasField$0 &= 0xfffffffe;
			hand_card_count$field = new int();
		}

		public function get hasHandCardCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set handCardCount(value:int):void {
			hasField$0 |= 0x1;
			hand_card_count$field = value;
		}

		public function get handCardCount():int {
			return hand_card_count$field;
		}

		/**
		 *  @private
		 */
		public static const CAMP_CARD_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RoleReconnectCardInfo.camp_card_count", "campCardCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var camp_card_count$field:int;

		public function clearCampCardCount():void {
			hasField$0 &= 0xfffffffd;
			camp_card_count$field = new int();
		}

		public function get hasCampCardCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set campCardCount(value:int):void {
			hasField$0 |= 0x2;
			camp_card_count$field = value;
		}

		public function get campCardCount():int {
			return camp_card_count$field;
		}

		/**
		 *  @private
		 */
		public static const DIE_CARD_IDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.RoleReconnectCardInfo.die_card_ids", "dieCardIds", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var dieCardIds:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasHandCardCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hand_card_count$field);
			}
			if (hasCampCardCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, camp_card_count$field);
			}
			for (var dieCardIds$index:uint = 0; dieCardIds$index < this.dieCardIds.length; ++dieCardIds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.dieCardIds[dieCardIds$index]);
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
			var hand_card_count$count:uint = 0;
			var camp_card_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleReconnectCardInfo.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (hand_card_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleReconnectCardInfo.handCardCount cannot be set twice.');
					}
					++hand_card_count$count;
					this.handCardCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (camp_card_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleReconnectCardInfo.campCardCount cannot be set twice.');
					}
					++camp_card_count$count;
					this.campCardCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.dieCardIds);
						break;
					}
					this.dieCardIds.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
