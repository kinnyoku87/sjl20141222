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
	public dynamic final class ArenaRank extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.ArenaRank.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ARENA_VICTORY_RATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ArenaRank.arena_victory_rate", "arenaVictoryRate", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var arena_victory_rate$field:int;

		private var hasField$0:uint = 0;

		public function clearArenaVictoryRate():void {
			hasField$0 &= 0xfffffffe;
			arena_victory_rate$field = new int();
		}

		public function get hasArenaVictoryRate():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set arenaVictoryRate(value:int):void {
			hasField$0 |= 0x1;
			arena_victory_rate$field = value;
		}

		public function get arenaVictoryRate():int {
			return arena_victory_rate$field;
		}

		/**
		 *  @private
		 */
		public static const VICTORY_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ArenaRank.victory_count", "victoryCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var victory_count$field:int;

		public function clearVictoryCount():void {
			hasField$0 &= 0xfffffffd;
			victory_count$field = new int();
		}

		public function get hasVictoryCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set victoryCount(value:int):void {
			hasField$0 |= 0x2;
			victory_count$field = value;
		}

		public function get victoryCount():int {
			return victory_count$field;
		}

		/**
		 *  @private
		 */
		public static const FAIL_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ArenaRank.fail_count", "failCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fail_count$field:int;

		public function clearFailCount():void {
			hasField$0 &= 0xfffffffb;
			fail_count$field = new int();
		}

		public function get hasFailCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set failCount(value:int):void {
			hasField$0 |= 0x4;
			fail_count$field = value;
		}

		public function get failCount():int {
			return fail_count$field;
		}

		/**
		 *  @private
		 */
		public static const UPDATE_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.ArenaRank.update_time", "updateTime", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var update_time$field:uint;

		public function clearUpdateTime():void {
			hasField$0 &= 0xfffffff7;
			update_time$field = new uint();
		}

		public function get hasUpdateTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set updateTime(value:uint):void {
			hasField$0 |= 0x8;
			update_time$field = value;
		}

		public function get updateTime():uint {
			return update_time$field;
		}

		/**
		 *  @private
		 */
		public static const RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ArenaRank.rank", "rank", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank$field:int;

		public function clearRank():void {
			hasField$0 &= 0xffffffef;
			rank$field = new int();
		}

		public function get hasRank():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set rank(value:int):void {
			hasField$0 |= 0x10;
			rank$field = value;
		}

		public function get rank():int {
			return rank$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasArenaVictoryRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, arena_victory_rate$field);
			}
			if (hasVictoryCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, victory_count$field);
			}
			if (hasFailCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, fail_count$field);
			}
			if (hasUpdateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, update_time$field);
			}
			if (hasRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank$field);
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
			var arena_victory_rate$count:uint = 0;
			var victory_count$count:uint = 0;
			var fail_count$count:uint = 0;
			var update_time$count:uint = 0;
			var rank$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaRank.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (arena_victory_rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaRank.arenaVictoryRate cannot be set twice.');
					}
					++arena_victory_rate$count;
					this.arenaVictoryRate = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (victory_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaRank.victoryCount cannot be set twice.');
					}
					++victory_count$count;
					this.victoryCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (fail_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaRank.failCount cannot be set twice.');
					}
					++fail_count$count;
					this.failCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (update_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaRank.updateTime cannot be set twice.');
					}
					++update_time$count;
					this.updateTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 6:
					if (rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaRank.rank cannot be set twice.');
					}
					++rank$count;
					this.rank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
