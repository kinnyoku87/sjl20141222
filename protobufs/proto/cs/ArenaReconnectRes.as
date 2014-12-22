package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.UpdateMonsterNtf;
	import proto.cs.RoleReconnectCardInfo;
	import proto.com.BattleMemberInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ArenaReconnectRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BATTLE_MEMBERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.ArenaReconnectRes.battle_members", "battleMembers", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.BattleMemberInfo; });

		[ArrayElementType("proto.com.BattleMemberInfo")]
		public var battleMembers:Array = [];

		/**
		 *  @private
		 */
		public static const MONSTERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.ArenaReconnectRes.monsters", "monsters", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.UpdateMonsterNtf; });

		[ArrayElementType("proto.cs.UpdateMonsterNtf")]
		public var monsters:Array = [];

		/**
		 *  @private
		 */
		public static const ROLE_CARD_INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.ArenaReconnectRes.role_card_infos", "roleCardInfos", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleReconnectCardInfo; });

		[ArrayElementType("proto.cs.RoleReconnectCardInfo")]
		public var roleCardInfos:Array = [];

		/**
		 *  @private
		 */
		public static const SELF_HAND_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.ArenaReconnectRes.self_hand_cards", "selfHandCards", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var selfHandCards:Array = [];

		/**
		 *  @private
		 */
		public static const SELF_DIE_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.ArenaReconnectRes.self_die_cards", "selfDieCards", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var selfDieCards:Array = [];

		/**
		 *  @private
		 */
		public static const SELF_IDENTITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ArenaReconnectRes.self_identity", "selfIdentity", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var self_identity$field:int;

		private var hasField$0:uint = 0;

		public function clearSelfIdentity():void {
			hasField$0 &= 0xfffffffe;
			self_identity$field = new int();
		}

		public function get hasSelfIdentity():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set selfIdentity(value:int):void {
			hasField$0 |= 0x1;
			self_identity$field = value;
		}

		public function get selfIdentity():int {
			return self_identity$field;
		}

		/**
		 *  @private
		 */
		public static const GAME_STATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ArenaReconnectRes.game_state", "gameState", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var game_state$field:int;

		public function clearGameState():void {
			hasField$0 &= 0xfffffffd;
			game_state$field = new int();
		}

		public function get hasGameState():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set gameState(value:int):void {
			hasField$0 |= 0x2;
			game_state$field = value;
		}

		public function get gameState():int {
			return game_state$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_SELECT_CAMP_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ArenaReconnectRes.cur_select_camp_role_id", "curSelectCampRoleId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_select_camp_role_id$field:UInt64;

		public function clearCurSelectCampRoleId():void {
			cur_select_camp_role_id$field = null;
		}

		public function get hasCurSelectCampRoleId():Boolean {
			return cur_select_camp_role_id$field != null;
		}

		public function set curSelectCampRoleId(value:UInt64):void {
			cur_select_camp_role_id$field = value;
		}

		public function get curSelectCampRoleId():UInt64 {
			return cur_select_camp_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_BOUT_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ArenaReconnectRes.cur_bout_role_id", "curBoutRoleId", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_bout_role_id$field:UInt64;

		public function clearCurBoutRoleId():void {
			cur_bout_role_id$field = null;
		}

		public function get hasCurBoutRoleId():Boolean {
			return cur_bout_role_id$field != null;
		}

		public function set curBoutRoleId(value:UInt64):void {
			cur_bout_role_id$field = value;
		}

		public function get curBoutRoleId():UInt64 {
			return cur_bout_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_BOUT_LAST_MP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ArenaReconnectRes.cur_bout_last_mp", "curBoutLastMp", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_bout_last_mp$field:int;

		public function clearCurBoutLastMp():void {
			hasField$0 &= 0xfffffffb;
			cur_bout_last_mp$field = new int();
		}

		public function get hasCurBoutLastMp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set curBoutLastMp(value:int):void {
			hasField$0 |= 0x4;
			cur_bout_last_mp$field = value;
		}

		public function get curBoutLastMp():int {
			return cur_bout_last_mp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var battleMembers$index:uint = 0; battleMembers$index < this.battleMembers.length; ++battleMembers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.battleMembers[battleMembers$index]);
			}
			for (var monsters$index:uint = 0; monsters$index < this.monsters.length; ++monsters$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.monsters[monsters$index]);
			}
			for (var roleCardInfos$index:uint = 0; roleCardInfos$index < this.roleCardInfos.length; ++roleCardInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.roleCardInfos[roleCardInfos$index]);
			}
			for (var selfHandCards$index:uint = 0; selfHandCards$index < this.selfHandCards.length; ++selfHandCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.selfHandCards[selfHandCards$index]);
			}
			for (var selfDieCards$index:uint = 0; selfDieCards$index < this.selfDieCards.length; ++selfDieCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.selfDieCards[selfDieCards$index]);
			}
			if (hasSelfIdentity) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, self_identity$field);
			}
			if (hasGameState) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, game_state$field);
			}
			if (hasCurSelectCampRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, cur_select_camp_role_id$field);
			}
			if (hasCurBoutRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, cur_bout_role_id$field);
			}
			if (hasCurBoutLastMp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_bout_last_mp$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var self_identity$count:uint = 0;
			var game_state$count:uint = 0;
			var cur_select_camp_role_id$count:uint = 0;
			var cur_bout_role_id$count:uint = 0;
			var cur_bout_last_mp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.battleMembers.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.BattleMemberInfo()));
					break;
				case 2:
					this.monsters.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.UpdateMonsterNtf()));
					break;
				case 3:
					this.roleCardInfos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.RoleReconnectCardInfo()));
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.selfHandCards);
						break;
					}
					this.selfHandCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.selfDieCards);
						break;
					}
					this.selfDieCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 6:
					if (self_identity$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaReconnectRes.selfIdentity cannot be set twice.');
					}
					++self_identity$count;
					this.selfIdentity = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (game_state$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaReconnectRes.gameState cannot be set twice.');
					}
					++game_state$count;
					this.gameState = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (cur_select_camp_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaReconnectRes.curSelectCampRoleId cannot be set twice.');
					}
					++cur_select_camp_role_id$count;
					this.curSelectCampRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 10:
					if (cur_bout_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaReconnectRes.curBoutRoleId cannot be set twice.');
					}
					++cur_bout_role_id$count;
					this.curBoutRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 11:
					if (cur_bout_last_mp$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaReconnectRes.curBoutLastMp cannot be set twice.');
					}
					++cur_bout_last_mp$count;
					this.curBoutLastMp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
