package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.BattleBuff;
	import proto.cs.BattleEffect;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleStatusNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FROM_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.BattleStatusNtf.from_role_id", "fromRoleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_role_id$field:UInt64;

		public function clearFromRoleId():void {
			from_role_id$field = null;
		}

		public function get hasFromRoleId():Boolean {
			return from_role_id$field != null;
		}

		public function set fromRoleId(value:UInt64):void {
			from_role_id$field = value;
		}

		public function get fromRoleId():UInt64 {
			return from_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleStatusNtf.from_type", "fromType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_type$field:int;

		private var hasField$0:uint = 0;

		public function clearFromType():void {
			hasField$0 &= 0xfffffffe;
			from_type$field = new int();
		}

		public function get hasFromType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set fromType(value:int):void {
			hasField$0 |= 0x1;
			from_type$field = value;
		}

		public function get fromType():int {
			return from_type$field;
		}

		/**
		 *  @private
		 */
		public static const CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleStatusNtf.card_id", "cardId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var card_id$field:int;

		public function clearCardId():void {
			hasField$0 &= 0xfffffffd;
			card_id$field = new int();
		}

		public function get hasCardId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set cardId(value:int):void {
			hasField$0 |= 0x2;
			card_id$field = value;
		}

		public function get cardId():int {
			return card_id$field;
		}

		/**
		 *  @private
		 */
		public static const BUFFS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.BattleStatusNtf.buffs", "buffs", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleBuff; });

		[ArrayElementType("proto.cs.BattleBuff")]
		public var buffs:Array = [];

		/**
		 *  @private
		 */
		public static const EFFECTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.BattleStatusNtf.effects", "effects", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleEffect; });

		[ArrayElementType("proto.cs.BattleEffect")]
		public var effects:Array = [];

		/**
		 *  @private
		 */
		public static const SKILL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleStatusNtf.skill_id", "skillId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_id$field:int;

		public function clearSkillId():void {
			hasField$0 &= 0xfffffffb;
			skill_id$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x4;
			skill_id$field = value;
		}

		public function get skillId():int {
			return skill_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFromRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_role_id$field);
			}
			if (hasFromType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, from_type$field);
			}
			if (hasCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, card_id$field);
			}
			for (var buffs$index:uint = 0; buffs$index < this.buffs.length; ++buffs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.buffs[buffs$index]);
			}
			for (var effects$index:uint = 0; effects$index < this.effects.length; ++effects$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.effects[effects$index]);
			}
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var from_role_id$count:uint = 0;
			var from_type$count:uint = 0;
			var card_id$count:uint = 0;
			var skill_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (from_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleStatusNtf.fromRoleId cannot be set twice.');
					}
					++from_role_id$count;
					this.fromRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (from_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleStatusNtf.fromType cannot be set twice.');
					}
					++from_type$count;
					this.fromType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleStatusNtf.cardId cannot be set twice.');
					}
					++card_id$count;
					this.cardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					this.buffs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.BattleBuff()));
					break;
				case 5:
					this.effects.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.BattleEffect()));
					break;
				case 6:
					if (skill_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleStatusNtf.skillId cannot be set twice.');
					}
					++skill_id$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
