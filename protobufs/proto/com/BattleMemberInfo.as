package proto.com {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.CampBattleCard;
	import proto.com.CampLevel;
	import proto.com.RoomMemberInfo;
	import proto.com.RoleInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleMemberInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.BattleMemberInfo.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var uid$field:UInt64;

		public function clearUid():void {
			uid$field = null;
		}

		public function get hasUid():Boolean {
			return uid$field != null;
		}

		public function set uid(value:UInt64):void {
			uid$field = value;
		}

		public function get uid():UInt64 {
			return uid$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.com.BattleMemberInfo.role_info", "roleInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoleInfo; });

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
		public static const ROOM_MEMBER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.com.BattleMemberInfo.room_member_info", "roomMemberInfo", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomMemberInfo; });

		private var room_member_info$field:proto.com.RoomMemberInfo;

		public function clearRoomMemberInfo():void {
			room_member_info$field = null;
		}

		public function get hasRoomMemberInfo():Boolean {
			return room_member_info$field != null;
		}

		public function set roomMemberInfo(value:proto.com.RoomMemberInfo):void {
			room_member_info$field = value;
		}

		public function get roomMemberInfo():proto.com.RoomMemberInfo {
			return room_member_info$field;
		}

		/**
		 *  @private
		 */
		public static const CAMP_BATTLE_CARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.com.BattleMemberInfo.camp_battle_cards", "campBattleCards", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CampBattleCard; });

		[ArrayElementType("proto.com.CampBattleCard")]
		public var campBattleCards:Array = [];

		/**
		 *  @private
		 */
		public static const CARD_BAG_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.BattleMemberInfo.card_bag_index", "cardBagIndex", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var card_bag_index$field:int;

		private var hasField$0:uint = 0;

		public function clearCardBagIndex():void {
			hasField$0 &= 0xfffffffe;
			card_bag_index$field = new int();
		}

		public function get hasCardBagIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cardBagIndex(value:int):void {
			hasField$0 |= 0x1;
			card_bag_index$field = value;
		}

		public function get cardBagIndex():int {
			return card_bag_index$field;
		}

		/**
		 *  @private
		 */
		public static const USE_BAG_CARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.BattleMemberInfo.use_bag_card", "useBagCard", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var use_bag_card$field:Boolean;

		public function clearUseBagCard():void {
			hasField$0 &= 0xfffffffd;
			use_bag_card$field = new Boolean();
		}

		public function get hasUseBagCard():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set useBagCard(value:Boolean):void {
			hasField$0 |= 0x2;
			use_bag_card$field = value;
		}

		public function get useBagCard():Boolean {
			return use_bag_card$field;
		}

		/**
		 *  @private
		 */
		public static const CAMP_LEVELS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.com.BattleMemberInfo.camp_levels", "campLevels", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CampLevel; });

		[ArrayElementType("proto.com.CampLevel")]
		public var campLevels:Array = [];

		/**
		 *  @private
		 */
		public static const IS_ROBOT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.BattleMemberInfo.is_robot", "isRobot", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_robot$field:Boolean;

		public function clearIsRobot():void {
			hasField$0 &= 0xfffffffb;
			is_robot$field = new Boolean();
		}

		public function get hasIsRobot():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isRobot(value:Boolean):void {
			hasField$0 |= 0x4;
			is_robot$field = value;
		}

		public function get isRobot():Boolean {
			return is_robot$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TRUSTEESHIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.BattleMemberInfo.is_trusteeship", "isTrusteeship", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_trusteeship$field:Boolean;

		public function clearIsTrusteeship():void {
			hasField$0 &= 0xfffffff7;
			is_trusteeship$field = new Boolean();
		}

		public function get hasIsTrusteeship():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isTrusteeship(value:Boolean):void {
			hasField$0 |= 0x8;
			is_trusteeship$field = value;
		}

		public function get isTrusteeship():Boolean {
			return is_trusteeship$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, uid$field);
			}
			if (hasRoleInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_info$field);
			}
			if (hasRoomMemberInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room_member_info$field);
			}
			for (var campBattleCards$index:uint = 0; campBattleCards$index < this.campBattleCards.length; ++campBattleCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.campBattleCards[campBattleCards$index]);
			}
			if (hasCardBagIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, card_bag_index$field);
			}
			if (hasUseBagCard) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, use_bag_card$field);
			}
			for (var campLevels$index:uint = 0; campLevels$index < this.campLevels.length; ++campLevels$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.campLevels[campLevels$index]);
			}
			if (hasIsRobot) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_robot$field);
			}
			if (hasIsTrusteeship) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_trusteeship$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var uid$count:uint = 0;
			var role_info$count:uint = 0;
			var room_member_info$count:uint = 0;
			var card_bag_index$count:uint = 0;
			var use_bag_card$count:uint = 0;
			var is_robot$count:uint = 0;
			var is_trusteeship$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (role_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.roleInfo cannot be set twice.');
					}
					++role_info$count;
					this.roleInfo = new proto.com.RoleInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleInfo);
					break;
				case 4:
					if (room_member_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.roomMemberInfo cannot be set twice.');
					}
					++room_member_info$count;
					this.roomMemberInfo = new proto.com.RoomMemberInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roomMemberInfo);
					break;
				case 5:
					this.campBattleCards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CampBattleCard()));
					break;
				case 6:
					if (card_bag_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.cardBagIndex cannot be set twice.');
					}
					++card_bag_index$count;
					this.cardBagIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (use_bag_card$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.useBagCard cannot be set twice.');
					}
					++use_bag_card$count;
					this.useBagCard = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 8:
					this.campLevels.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CampLevel()));
					break;
				case 10:
					if (is_robot$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.isRobot cannot be set twice.');
					}
					++is_robot$count;
					this.isRobot = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 11:
					if (is_trusteeship$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleMemberInfo.isTrusteeship cannot be set twice.');
					}
					++is_trusteeship$count;
					this.isTrusteeship = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
