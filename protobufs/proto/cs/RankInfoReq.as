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
	public dynamic final class RankInfoReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RANK_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.rank_type", "rankType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank_type$field:int;

		private var hasField$0:uint = 0;

		public function clearRankType():void {
			hasField$0 &= 0xfffffffe;
			rank_type$field = new int();
		}

		public function get hasRankType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set rankType(value:int):void {
			hasField$0 |= 0x1;
			rank_type$field = value;
		}

		public function get rankType():int {
			return rank_type$field;
		}

		/**
		 *  @private
		 */
		public static const PAGE_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.page_index", "pageIndex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var page_index$field:int;

		public function clearPageIndex():void {
			hasField$0 &= 0xfffffffd;
			page_index$field = new int();
		}

		public function get hasPageIndex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set pageIndex(value:int):void {
			hasField$0 |= 0x2;
			page_index$field = value;
		}

		public function get pageIndex():int {
			return page_index$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffb;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x4;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_CAPACITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.fighting_capacity", "fightingCapacity", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_capacity$field:int;

		public function clearFightingCapacity():void {
			hasField$0 &= 0xfffffff7;
			fighting_capacity$field = new int();
		}

		public function get hasFightingCapacity():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set fightingCapacity(value:int):void {
			hasField$0 |= 0x8;
			fighting_capacity$field = value;
		}

		public function get fightingCapacity():int {
			return fighting_capacity$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_VICTORY_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.arena_victory_count", "arenaVictoryCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var arena_victory_count$field:int;

		public function clearArenaVictoryCount():void {
			hasField$0 &= 0xffffffef;
			arena_victory_count$field = new int();
		}

		public function get hasArenaVictoryCount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set arenaVictoryCount(value:int):void {
			hasField$0 |= 0x10;
			arena_victory_count$field = value;
		}

		public function get arenaVictoryCount():int {
			return arena_victory_count$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_FAIL_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.arena_fail_count", "arenaFailCount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var arena_fail_count$field:int;

		public function clearArenaFailCount():void {
			hasField$0 &= 0xffffffdf;
			arena_fail_count$field = new int();
		}

		public function get hasArenaFailCount():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set arenaFailCount(value:int):void {
			hasField$0 |= 0x20;
			arena_fail_count$field = value;
		}

		public function get arenaFailCount():int {
			return arena_fail_count$field;
		}

		/**
		 *  @private
		 */
		public static const ARCHIEVE_POINTS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.archieve_points", "archievePoints", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var archieve_points$field:int;

		public function clearArchievePoints():void {
			hasField$0 &= 0xffffffbf;
			archieve_points$field = new int();
		}

		public function get hasArchievePoints():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set archievePoints(value:int):void {
			hasField$0 |= 0x40;
			archieve_points$field = value;
		}

		public function get archievePoints():int {
			return archieve_points$field;
		}

		/**
		 *  @private
		 */
		public static const ROUND_AVE_SCORE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.round_ave_score", "roundAveScore", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var round_ave_score$field:int;

		public function clearRoundAveScore():void {
			hasField$0 &= 0xffffff7f;
			round_ave_score$field = new int();
		}

		public function get hasRoundAveScore():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set roundAveScore(value:int):void {
			hasField$0 |= 0x80;
			round_ave_score$field = value;
		}

		public function get roundAveScore():int {
			return round_ave_score$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ROUND_STARS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoReq.total_round_stars", "totalRoundStars", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_round_stars$field:int;

		public function clearTotalRoundStars():void {
			hasField$0 &= 0xfffffeff;
			total_round_stars$field = new int();
		}

		public function get hasTotalRoundStars():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set totalRoundStars(value:int):void {
			hasField$0 |= 0x100;
			total_round_stars$field = value;
		}

		public function get totalRoundStars():int {
			return total_round_stars$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRankType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank_type$field);
			}
			if (hasPageIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, page_index$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasFightingCapacity) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, fighting_capacity$field);
			}
			if (hasArenaVictoryCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, arena_victory_count$field);
			}
			if (hasArenaFailCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, arena_fail_count$field);
			}
			if (hasArchievePoints) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, archieve_points$field);
			}
			if (hasRoundAveScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, round_ave_score$field);
			}
			if (hasTotalRoundStars) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_round_stars$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rank_type$count:uint = 0;
			var page_index$count:uint = 0;
			var level$count:uint = 0;
			var fighting_capacity$count:uint = 0;
			var arena_victory_count$count:uint = 0;
			var arena_fail_count$count:uint = 0;
			var archieve_points$count:uint = 0;
			var round_ave_score$count:uint = 0;
			var total_round_stars$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rank_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.rankType cannot be set twice.');
					}
					++rank_type$count;
					this.rankType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (page_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.pageIndex cannot be set twice.');
					}
					++page_index$count;
					this.pageIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (fighting_capacity$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.fightingCapacity cannot be set twice.');
					}
					++fighting_capacity$count;
					this.fightingCapacity = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (arena_victory_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.arenaVictoryCount cannot be set twice.');
					}
					++arena_victory_count$count;
					this.arenaVictoryCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (arena_fail_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.arenaFailCount cannot be set twice.');
					}
					++arena_fail_count$count;
					this.arenaFailCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (archieve_points$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.archievePoints cannot be set twice.');
					}
					++archieve_points$count;
					this.archievePoints = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (round_ave_score$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.roundAveScore cannot be set twice.');
					}
					++round_ave_score$count;
					this.roundAveScore = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (total_round_stars$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoReq.totalRoundStars cannot be set twice.');
					}
					++total_round_stars$count;
					this.totalRoundStars = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
