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
	public dynamic final class StartBattleRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROUND_ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.StartBattleRes.round_id", "roundId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var round_id$field:uint;

		private var hasField$0:uint = 0;

		public function clearRoundId():void {
			hasField$0 &= 0xfffffffe;
			round_id$field = new uint();
		}

		public function get hasRoundId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set roundId(value:uint):void {
			hasField$0 |= 0x1;
			round_id$field = value;
		}

		public function get roundId():uint {
			return round_id$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.StartBattleRes.battle_type", "battleType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var battle_type$field:int;

		public function clearBattleType():void {
			hasField$0 &= 0xfffffffd;
			battle_type$field = new int();
		}

		public function get hasBattleType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set battleType(value:int):void {
			hasField$0 |= 0x2;
			battle_type$field = value;
		}

		public function get battleType():int {
			return battle_type$field;
		}

		/**
		 *  @private
		 */
		public static const DELAY_TEST_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.StartBattleRes.delay_test_time", "delayTestTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var delay_test_time$field:uint;

		public function clearDelayTestTime():void {
			hasField$0 &= 0xfffffffb;
			delay_test_time$field = new uint();
		}

		public function get hasDelayTestTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set delayTestTime(value:uint):void {
			hasField$0 |= 0x4;
			delay_test_time$field = value;
		}

		public function get delayTestTime():uint {
			return delay_test_time$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_BOSS_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.StartBattleRes.role_boss_id", "roleBossId", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var role_boss_id$field:UInt64;

		public function clearRoleBossId():void {
			role_boss_id$field = null;
		}

		public function get hasRoleBossId():Boolean {
			return role_boss_id$field != null;
		}

		public function set roleBossId(value:UInt64):void {
			role_boss_id$field = value;
		}

		public function get roleBossId():UInt64 {
			return role_boss_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoundId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, round_id$field);
			}
			if (hasBattleType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, battle_type$field);
			}
			if (hasDelayTestTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, delay_test_time$field);
			}
			if (hasRoleBossId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_boss_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var round_id$count:uint = 0;
			var battle_type$count:uint = 0;
			var delay_test_time$count:uint = 0;
			var role_boss_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (round_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StartBattleRes.roundId cannot be set twice.');
					}
					++round_id$count;
					this.roundId = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (battle_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: StartBattleRes.battleType cannot be set twice.');
					}
					++battle_type$count;
					this.battleType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (delay_test_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: StartBattleRes.delayTestTime cannot be set twice.');
					}
					++delay_test_time$count;
					this.delayTestTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 10:
					if (role_boss_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StartBattleRes.roleBossId cannot be set twice.');
					}
					++role_boss_id$count;
					this.roleBossId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
