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
	import proto.cs.BattleEffect;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SkillUseRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FROM_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SkillUseRes.from_guid", "fromGuid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_guid$field:UInt64;

		public function clearFromGuid():void {
			from_guid$field = null;
		}

		public function get hasFromGuid():Boolean {
			return from_guid$field != null;
		}

		public function set fromGuid(value:UInt64):void {
			from_guid$field = value;
		}

		public function get fromGuid():UInt64 {
			return from_guid$field;
		}

		/**
		 *  @private
		 */
		public static const END_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SkillUseRes.end_guid", "endGuid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end_guid$field:UInt64;

		public function clearEndGuid():void {
			end_guid$field = null;
		}

		public function get hasEndGuid():Boolean {
			return end_guid$field != null;
		}

		public function set endGuid(value:UInt64):void {
			end_guid$field = value;
		}

		public function get endGuid():UInt64 {
			return end_guid$field;
		}

		/**
		 *  @private
		 */
		public static const CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.card_id", "cardId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SKILL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.skill_id", "skillId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_id$field:int;

		public function clearSkillId():void {
			hasField$0 &= 0xfffffffd;
			skill_id$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x2;
			skill_id$field = value;
		}

		public function get skillId():int {
			return skill_id$field;
		}

		/**
		 *  @private
		 */
		public static const EFFECTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.SkillUseRes.effects", "effects", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleEffect; });

		[ArrayElementType("proto.cs.BattleEffect")]
		public var effects:Array = [];

		/**
		 *  @private
		 */
		public static const BUFFS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.SkillUseRes.buffs", "buffs", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleBuff; });

		[ArrayElementType("proto.cs.BattleBuff")]
		public var buffs:Array = [];

		/**
		 *  @private
		 */
		public static const COST_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.cost_cards", "costCards", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var costCards:Array = [];

		/**
		 *  @private
		 */
		public static const SKILL_SOURCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.skill_source", "skillSource", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_source$field:int;

		public function clearSkillSource():void {
			hasField$0 &= 0xfffffffb;
			skill_source$field = new int();
		}

		public function get hasSkillSource():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set skillSource(value:int):void {
			hasField$0 |= 0x4;
			skill_source$field = value;
		}

		public function get skillSource():int {
			return skill_source$field;
		}

		/**
		 *  @private
		 */
		public static const COST_DIE_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.cost_die_cards", "costDieCards", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var costDieCards:Array = [];

		/**
		 *  @private
		 */
		public static const COST_OBJECTS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.cs.SkillUseRes.cost_objects", "costObjects", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("UInt64")]
		public var costObjects:Array = [];

		/**
		 *  @private
		 */
		public static const COST_MP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.cost_mp", "costMp", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost_mp$field:int;

		public function clearCostMp():void {
			hasField$0 &= 0xfffffff7;
			cost_mp$field = new int();
		}

		public function get hasCostMp():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set costMp(value:int):void {
			hasField$0 |= 0x8;
			cost_mp$field = value;
		}

		public function get costMp():int {
			return cost_mp$field;
		}

		/**
		 *  @private
		 */
		public static const SECOND_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SkillUseRes.second_guid", "secondGuid", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var second_guid$field:UInt64;

		public function clearSecondGuid():void {
			second_guid$field = null;
		}

		public function get hasSecondGuid():Boolean {
			return second_guid$field != null;
		}

		public function set secondGuid(value:UInt64):void {
			second_guid$field = value;
		}

		public function get secondGuid():UInt64 {
			return second_guid$field;
		}

		/**
		 *  @private
		 */
		public static const RET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseRes.ret", "ret", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ret$field:int;

		public function clearRet():void {
			hasField$0 &= 0xffffffef;
			ret$field = new int();
		}

		public function get hasRet():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set ret(value:int):void {
			hasField$0 |= 0x10;
			ret$field = value;
		}

		public function get ret():int {
			return ret$field;
		}

		/**
		 *  @private
		 */
		public static const END_CHESS_POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.SkillUseRes.end_chess_pos", "endChessPos", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChessPos; });

		private var end_chess_pos$field:proto.cs.ChessPos;

		public function clearEndChessPos():void {
			end_chess_pos$field = null;
		}

		public function get hasEndChessPos():Boolean {
			return end_chess_pos$field != null;
		}

		public function set endChessPos(value:proto.cs.ChessPos):void {
			end_chess_pos$field = value;
		}

		public function get endChessPos():proto.cs.ChessPos {
			return end_chess_pos$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFromGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_guid$field);
			}
			if (hasEndGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, end_guid$field);
			}
			if (hasCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, card_id$field);
			}
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_id$field);
			}
			for (var effects$index:uint = 0; effects$index < this.effects.length; ++effects$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.effects[effects$index]);
			}
			for (var buffs$index:uint = 0; buffs$index < this.buffs.length; ++buffs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.buffs[buffs$index]);
			}
			for (var costCards$index:uint = 0; costCards$index < this.costCards.length; ++costCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.costCards[costCards$index]);
			}
			if (hasSkillSource) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_source$field);
			}
			for (var costDieCards$index:uint = 0; costDieCards$index < this.costDieCards.length; ++costDieCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.costDieCards[costDieCards$index]);
			}
			for (var costObjects$index:uint = 0; costObjects$index < this.costObjects.length; ++costObjects$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.costObjects[costObjects$index]);
			}
			if (hasCostMp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cost_mp$field);
			}
			if (hasSecondGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, second_guid$field);
			}
			if (hasRet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ret$field);
			}
			if (hasEndChessPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, end_chess_pos$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var from_guid$count:uint = 0;
			var end_guid$count:uint = 0;
			var card_id$count:uint = 0;
			var skill_id$count:uint = 0;
			var skill_source$count:uint = 0;
			var cost_mp$count:uint = 0;
			var second_guid$count:uint = 0;
			var ret$count:uint = 0;
			var end_chess_pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (from_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.fromGuid cannot be set twice.');
					}
					++from_guid$count;
					this.fromGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (end_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.endGuid cannot be set twice.');
					}
					++end_guid$count;
					this.endGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.cardId cannot be set twice.');
					}
					++card_id$count;
					this.cardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (skill_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.skillId cannot be set twice.');
					}
					++skill_id$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					this.effects.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.BattleEffect()));
					break;
				case 6:
					this.buffs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.BattleBuff()));
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.costCards);
						break;
					}
					this.costCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 9:
					if (skill_source$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.skillSource cannot be set twice.');
					}
					++skill_source$count;
					this.skillSource = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.costDieCards);
						break;
					}
					this.costDieCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 11:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT64, this.costObjects);
						break;
					}
					this.costObjects.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input));
					break;
				case 12:
					if (cost_mp$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.costMp cannot be set twice.');
					}
					++cost_mp$count;
					this.costMp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (second_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.secondGuid cannot be set twice.');
					}
					++second_guid$count;
					this.secondGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 14:
					if (ret$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.ret cannot be set twice.');
					}
					++ret$count;
					this.ret = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (end_chess_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseRes.endChessPos cannot be set twice.');
					}
					++end_chess_pos$count;
					this.endChessPos = new proto.cs.ChessPos();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.endChessPos);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
