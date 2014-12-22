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
	public dynamic final class BattleEffect extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OBJECT_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.BattleEffect.object_uid", "objectUid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var object_uid$field:UInt64;

		public function clearObjectUid():void {
			object_uid$field = null;
		}

		public function get hasObjectUid():Boolean {
			return object_uid$field != null;
		}

		public function set objectUid(value:UInt64):void {
			object_uid$field = value;
		}

		public function get objectUid():UInt64 {
			return object_uid$field;
		}

		/**
		 *  @private
		 */
		public static const EFFECT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleEffect.effect_id", "effectId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var effect_id$field:int;

		private var hasField$0:uint = 0;

		public function clearEffectId():void {
			hasField$0 &= 0xfffffffe;
			effect_id$field = new int();
		}

		public function get hasEffectId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set effectId(value:int):void {
			hasField$0 |= 0x1;
			effect_id$field = value;
		}

		public function get effectId():int {
			return effect_id$field;
		}

		/**
		 *  @private
		 */
		public static const EFFECT_VALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleEffect.effect_value", "effectValue", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var effect_value$field:int;

		public function clearEffectValue():void {
			hasField$0 &= 0xfffffffd;
			effect_value$field = new int();
		}

		public function get hasEffectValue():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set effectValue(value:int):void {
			hasField$0 |= 0x2;
			effect_value$field = value;
		}

		public function get effectValue():int {
			return effect_value$field;
		}

		/**
		 *  @private
		 */
		public static const REMAIN_HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleEffect.remain_hp", "remainHp", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remain_hp$field:int;

		public function clearRemainHp():void {
			hasField$0 &= 0xfffffffb;
			remain_hp$field = new int();
		}

		public function get hasRemainHp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set remainHp(value:int):void {
			hasField$0 |= 0x4;
			remain_hp$field = value;
		}

		public function get remainHp():int {
			return remain_hp$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleEffect.attack", "attack", (5 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const MOVE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleEffect.move", "move", (6 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const MAX_HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleEffect.max_hp", "maxHp", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hp$field:int;

		public function clearMaxHp():void {
			hasField$0 &= 0xffffffdf;
			max_hp$field = new int();
		}

		public function get hasMaxHp():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set maxHp(value:int):void {
			hasField$0 |= 0x20;
			max_hp$field = value;
		}

		public function get maxHp():int {
			return max_hp$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.BattleEffect.from_uid", "fromUid", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_uid$field:UInt64;

		public function clearFromUid():void {
			from_uid$field = null;
		}

		public function get hasFromUid():Boolean {
			return from_uid$field != null;
		}

		public function set fromUid(value:UInt64):void {
			from_uid$field = value;
		}

		public function get fromUid():UInt64 {
			return from_uid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasObjectUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, object_uid$field);
			}
			if (hasEffectId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, effect_id$field);
			}
			if (hasEffectValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, effect_value$field);
			}
			if (hasRemainHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, remain_hp$field);
			}
			if (hasAttack) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, attack$field);
			}
			if (hasMove) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, move$field);
			}
			if (hasMaxHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_hp$field);
			}
			if (hasFromUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_uid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var object_uid$count:uint = 0;
			var effect_id$count:uint = 0;
			var effect_value$count:uint = 0;
			var remain_hp$count:uint = 0;
			var attack$count:uint = 0;
			var move$count:uint = 0;
			var max_hp$count:uint = 0;
			var from_uid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (object_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.objectUid cannot be set twice.');
					}
					++object_uid$count;
					this.objectUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (effect_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.effectId cannot be set twice.');
					}
					++effect_id$count;
					this.effectId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (effect_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.effectValue cannot be set twice.');
					}
					++effect_value$count;
					this.effectValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (remain_hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.remainHp cannot be set twice.');
					}
					++remain_hp$count;
					this.remainHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (attack$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.attack cannot be set twice.');
					}
					++attack$count;
					this.attack = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (move$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.move cannot be set twice.');
					}
					++move$count;
					this.move = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (max_hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.maxHp cannot be set twice.');
					}
					++max_hp$count;
					this.maxHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (from_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.fromUid cannot be set twice.');
					}
					++from_uid$count;
					this.fromUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
