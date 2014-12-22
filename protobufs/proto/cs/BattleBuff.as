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
	public dynamic final class BattleBuff extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OBJECT_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.BattleBuff.object_uid", "objectUid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ADD_OR_REMOVE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.add_or_remove", "addOrRemove", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_or_remove$field:int;

		private var hasField$0:uint = 0;

		public function clearAddOrRemove():void {
			hasField$0 &= 0xfffffffe;
			add_or_remove$field = new int();
		}

		public function get hasAddOrRemove():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set addOrRemove(value:int):void {
			hasField$0 |= 0x1;
			add_or_remove$field = value;
		}

		public function get addOrRemove():int {
			return add_or_remove$field;
		}

		/**
		 *  @private
		 */
		public static const BUFF_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.buff_id", "buffId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buff_id$field:int;

		public function clearBuffId():void {
			hasField$0 &= 0xfffffffd;
			buff_id$field = new int();
		}

		public function get hasBuffId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set buffId(value:int):void {
			hasField$0 |= 0x2;
			buff_id$field = value;
		}

		public function get buffId():int {
			return buff_id$field;
		}

		/**
		 *  @private
		 */
		public static const BUFF_VALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.buff_value", "buffValue", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buff_value$field:int;

		public function clearBuffValue():void {
			hasField$0 &= 0xfffffffb;
			buff_value$field = new int();
		}

		public function get hasBuffValue():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set buffValue(value:int):void {
			hasField$0 |= 0x4;
			buff_value$field = value;
		}

		public function get buffValue():int {
			return buff_value$field;
		}

		/**
		 *  @private
		 */
		public static const BUFF_LAST_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.buff_last_time", "buffLastTime", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buff_last_time$field:int;

		public function clearBuffLastTime():void {
			hasField$0 &= 0xfffffff7;
			buff_last_time$field = new int();
		}

		public function get hasBuffLastTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set buffLastTime(value:int):void {
			hasField$0 |= 0x8;
			buff_last_time$field = value;
		}

		public function get buffLastTime():int {
			return buff_last_time$field;
		}

		/**
		 *  @private
		 */
		public static const REMAIN_HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.remain_hp", "remainHp", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remain_hp$field:int;

		public function clearRemainHp():void {
			hasField$0 &= 0xffffffef;
			remain_hp$field = new int();
		}

		public function get hasRemainHp():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set remainHp(value:int):void {
			hasField$0 |= 0x10;
			remain_hp$field = value;
		}

		public function get remainHp():int {
			return remain_hp$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.attack", "attack", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack$field:int;

		public function clearAttack():void {
			hasField$0 &= 0xffffffdf;
			attack$field = new int();
		}

		public function get hasAttack():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set attack(value:int):void {
			hasField$0 |= 0x20;
			attack$field = value;
		}

		public function get attack():int {
			return attack$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.move", "move", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var move$field:int;

		public function clearMove():void {
			hasField$0 &= 0xffffffbf;
			move$field = new int();
		}

		public function get hasMove():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set move(value:int):void {
			hasField$0 |= 0x40;
			move$field = value;
		}

		public function get move():int {
			return move$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.BattleBuff.max_hp", "maxHp", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hp$field:int;

		public function clearMaxHp():void {
			hasField$0 &= 0xffffff7f;
			max_hp$field = new int();
		}

		public function get hasMaxHp():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set maxHp(value:int):void {
			hasField$0 |= 0x80;
			max_hp$field = value;
		}

		public function get maxHp():int {
			return max_hp$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.BattleBuff.from_uid", "fromUid", (10 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const FROM_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.BattleBuff.from_role_id", "fromRoleId", (11 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasObjectUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, object_uid$field);
			}
			if (hasAddOrRemove) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, add_or_remove$field);
			}
			if (hasBuffId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, buff_id$field);
			}
			if (hasBuffValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, buff_value$field);
			}
			if (hasBuffLastTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, buff_last_time$field);
			}
			if (hasRemainHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, remain_hp$field);
			}
			if (hasAttack) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, attack$field);
			}
			if (hasMove) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, move$field);
			}
			if (hasMaxHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_hp$field);
			}
			if (hasFromUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_uid$field);
			}
			if (hasFromRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_role_id$field);
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
			var add_or_remove$count:uint = 0;
			var buff_id$count:uint = 0;
			var buff_value$count:uint = 0;
			var buff_last_time$count:uint = 0;
			var remain_hp$count:uint = 0;
			var attack$count:uint = 0;
			var move$count:uint = 0;
			var max_hp$count:uint = 0;
			var from_uid$count:uint = 0;
			var from_role_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (object_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.objectUid cannot be set twice.');
					}
					++object_uid$count;
					this.objectUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (add_or_remove$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.addOrRemove cannot be set twice.');
					}
					++add_or_remove$count;
					this.addOrRemove = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (buff_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.buffId cannot be set twice.');
					}
					++buff_id$count;
					this.buffId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (buff_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.buffValue cannot be set twice.');
					}
					++buff_value$count;
					this.buffValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (buff_last_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.buffLastTime cannot be set twice.');
					}
					++buff_last_time$count;
					this.buffLastTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (remain_hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.remainHp cannot be set twice.');
					}
					++remain_hp$count;
					this.remainHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (attack$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.attack cannot be set twice.');
					}
					++attack$count;
					this.attack = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (move$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.move cannot be set twice.');
					}
					++move$count;
					this.move = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (max_hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.maxHp cannot be set twice.');
					}
					++max_hp$count;
					this.maxHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (from_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.fromUid cannot be set twice.');
					}
					++from_uid$count;
					this.fromUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 11:
					if (from_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBuff.fromRoleId cannot be set twice.');
					}
					++from_role_id$count;
					this.fromRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
