package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.ChessPos;
	import proto.cs.BattleBuff;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UpdateMonsterNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.UpdateMonsterNtf.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.UpdateMonsterNtf.guid", "guid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guid$field:UInt64;

		public function clearGuid():void {
			guid$field = null;
		}

		public function get hasGuid():Boolean {
			return guid$field != null;
		}

		public function set guid(value:UInt64):void {
			guid$field = value;
		}

		public function get guid():UInt64 {
			return guid$field;
		}

		/**
		 *  @private
		 */
		public static const CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.card_id", "cardId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var card_id$field:int;

		private var hasField$0:uint = 0;

		public function clearCardId():void {
			hasField$0 &= 0xfffffffe;
			card_id$field = new int();
		}

		public function get hasCardId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cardId(value:int):void {
			hasField$0 |= 0x1;
			card_id$field = value;
		}

		public function get cardId():int {
			return card_id$field;
		}

		/**
		 *  @private
		 */
		public static const HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.hp", "hp", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hp$field:int;

		public function clearHp():void {
			hasField$0 &= 0xfffffffd;
			hp$field = new int();
		}

		public function get hasHp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set hp(value:int):void {
			hasField$0 |= 0x2;
			hp$field = value;
		}

		public function get hp():int {
			return hp$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.max_hp", "maxHp", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hp$field:int;

		public function clearMaxHp():void {
			hasField$0 &= 0xfffffffb;
			max_hp$field = new int();
		}

		public function get hasMaxHp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set maxHp(value:int):void {
			hasField$0 |= 0x4;
			max_hp$field = value;
		}

		public function get maxHp():int {
			return max_hp$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.attack", "attack", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack$field:int;

		public function clearAttack():void {
			hasField$0 &= 0xfffffff7;
			attack$field = new int();
		}

		public function get hasAttack():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set attack(value:int):void {
			hasField$0 |= 0x8;
			attack$field = value;
		}

		public function get attack():int {
			return attack$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.move", "move", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var move$field:int;

		public function clearMove():void {
			hasField$0 &= 0xffffffef;
			move$field = new int();
		}

		public function get hasMove():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set move(value:int):void {
			hasField$0 |= 0x10;
			move$field = value;
		}

		public function get move():int {
			return move$field;
		}

		/**
		 *  @private
		 */
		public static const CHESS_POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.UpdateMonsterNtf.chess_pos", "chessPos", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChessPos; });

		private var chess_pos$field:proto.cs.ChessPos;

		public function clearChessPos():void {
			chess_pos$field = null;
		}

		public function get hasChessPos():Boolean {
			return chess_pos$field != null;
		}

		public function set chessPos(value:proto.cs.ChessPos):void {
			chess_pos$field = value;
		}

		public function get chessPos():proto.cs.ChessPos {
			return chess_pos$field;
		}

		/**
		 *  @private
		 */
		public static const BUFFS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.UpdateMonsterNtf.buffs", "buffs", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleBuff; });

		[ArrayElementType("proto.cs.BattleBuff")]
		public var buffs:Array = [];

		/**
		 *  @private
		 */
		public static const EQUIP_CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.equip_card_id", "equipCardId", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equip_card_id$field:int;

		public function clearEquipCardId():void {
			hasField$0 &= 0xffffffdf;
			equip_card_id$field = new int();
		}

		public function get hasEquipCardId():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set equipCardId(value:int):void {
			hasField$0 |= 0x20;
			equip_card_id$field = value;
		}

		public function get equipCardId():int {
			return equip_card_id$field;
		}

		/**
		 *  @private
		 */
		public static const CARRY_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.UpdateMonsterNtf.carry_guid", "carryGuid", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var carry_guid$field:UInt64;

		public function clearCarryGuid():void {
			carry_guid$field = null;
		}

		public function get hasCarryGuid():Boolean {
			return carry_guid$field != null;
		}

		public function set carryGuid(value:UInt64):void {
			carry_guid$field = value;
		}

		public function get carryGuid():UInt64 {
			return carry_guid$field;
		}

		/**
		 *  @private
		 */
		public static const CARRY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.carry_type", "carryType", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var carry_type$field:int;

		public function clearCarryType():void {
			hasField$0 &= 0xffffffbf;
			carry_type$field = new int();
		}

		public function get hasCarryType():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set carryType(value:int):void {
			hasField$0 |= 0x40;
			carry_type$field = value;
		}

		public function get carryType():int {
			return carry_type$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE_GRID_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.move_grid_count", "moveGridCount", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var move_grid_count$field:int;

		public function clearMoveGridCount():void {
			hasField$0 &= 0xffffff7f;
			move_grid_count$field = new int();
		}

		public function get hasMoveGridCount():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set moveGridCount(value:int):void {
			hasField$0 |= 0x80;
			move_grid_count$field = value;
		}

		public function get moveGridCount():int {
			return move_grid_count$field;
		}

		/**
		 *  @private
		 */
		public static const ACTION_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.UpdateMonsterNtf.action_count", "actionCount", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var action_count$field:int;

		public function clearActionCount():void {
			hasField$0 &= 0xfffffeff;
			action_count$field = new int();
		}

		public function get hasActionCount():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set actionCount(value:int):void {
			hasField$0 |= 0x100;
			action_count$field = value;
		}

		public function get actionCount():int {
			return action_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, guid$field);
			}
			if (hasCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, card_id$field);
			}
			if (hasHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hp$field);
			}
			if (hasMaxHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_hp$field);
			}
			if (hasAttack) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, attack$field);
			}
			if (hasMove) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, move$field);
			}
			if (hasChessPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chess_pos$field);
			}
			for (var buffs$index:uint = 0; buffs$index < this.buffs.length; ++buffs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.buffs[buffs$index]);
			}
			if (hasEquipCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, equip_card_id$field);
			}
			if (hasCarryGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, carry_guid$field);
			}
			if (hasCarryType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, carry_type$field);
			}
			if (hasMoveGridCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, move_grid_count$field);
			}
			if (hasActionCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, action_count$field);
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
			var guid$count:uint = 0;
			var card_id$count:uint = 0;
			var hp$count:uint = 0;
			var max_hp$count:uint = 0;
			var attack$count:uint = 0;
			var move$count:uint = 0;
			var chess_pos$count:uint = 0;
			var equip_card_id$count:uint = 0;
			var carry_guid$count:uint = 0;
			var carry_type$count:uint = 0;
			var move_grid_count$count:uint = 0;
			var action_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.guid cannot be set twice.');
					}
					++guid$count;
					this.guid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.cardId cannot be set twice.');
					}
					++card_id$count;
					this.cardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.hp cannot be set twice.');
					}
					++hp$count;
					this.hp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (max_hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.maxHp cannot be set twice.');
					}
					++max_hp$count;
					this.maxHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (attack$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.attack cannot be set twice.');
					}
					++attack$count;
					this.attack = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (move$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.move cannot be set twice.');
					}
					++move$count;
					this.move = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (chess_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.chessPos cannot be set twice.');
					}
					++chess_pos$count;
					this.chessPos = new proto.cs.ChessPos();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chessPos);
					break;
				case 9:
					this.buffs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.BattleBuff()));
					break;
				case 10:
					if (equip_card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.equipCardId cannot be set twice.');
					}
					++equip_card_id$count;
					this.equipCardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (carry_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.carryGuid cannot be set twice.');
					}
					++carry_guid$count;
					this.carryGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 12:
					if (carry_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.carryType cannot be set twice.');
					}
					++carry_type$count;
					this.carryType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (move_grid_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.moveGridCount cannot be set twice.');
					}
					++move_grid_count$count;
					this.moveGridCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (action_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpdateMonsterNtf.actionCount cannot be set twice.');
					}
					++action_count$count;
					this.actionCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
