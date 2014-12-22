package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.FightingCapacityRank;
	import proto.com.LevelRank;
	import proto.com.RoundAveScoreRank;
	import proto.com.AchievePointsRank;
	import proto.com.RoundTotalStarRank;
	import proto.com.ArenaRank;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RankInfoRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RANK_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoRes.rank_type", "rankType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CUR_PAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoRes.cur_page", "curPage", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_page$field:int;

		public function clearCurPage():void {
			hasField$0 &= 0xfffffffd;
			cur_page$field = new int();
		}

		public function get hasCurPage():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set curPage(value:int):void {
			hasField$0 |= 0x2;
			cur_page$field = value;
		}

		public function get curPage():int {
			return cur_page$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_PAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.RankInfoRes.max_page", "maxPage", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_page$field:int;

		public function clearMaxPage():void {
			hasField$0 &= 0xfffffffb;
			max_page$field = new int();
		}

		public function get hasMaxPage():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set maxPage(value:int):void {
			hasField$0 |= 0x4;
			max_page$field = value;
		}

		public function get maxPage():int {
			return max_page$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RankInfoRes.level_ranks", "levelRanks", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.LevelRank; });

		[ArrayElementType("proto.com.LevelRank")]
		public var levelRanks:Array = [];

		/**
		 *  @private
		 */
		public static const FIGHTING_CAPACITY_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RankInfoRes.fighting_capacity_ranks", "fightingCapacityRanks", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.FightingCapacityRank; });

		[ArrayElementType("proto.com.FightingCapacityRank")]
		public var fightingCapacityRanks:Array = [];

		/**
		 *  @private
		 */
		public static const ARENA_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RankInfoRes.arena_ranks", "arenaRanks", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.ArenaRank; });

		[ArrayElementType("proto.com.ArenaRank")]
		public var arenaRanks:Array = [];

		/**
		 *  @private
		 */
		public static const ACHIEVE_POINTS_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RankInfoRes.achieve_points_ranks", "achievePointsRanks", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.AchievePointsRank; });

		[ArrayElementType("proto.com.AchievePointsRank")]
		public var achievePointsRanks:Array = [];

		/**
		 *  @private
		 */
		public static const ROUND_TOTAL_STAR_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RankInfoRes.round_total_star_ranks", "roundTotalStarRanks", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoundTotalStarRank; });

		[ArrayElementType("proto.com.RoundTotalStarRank")]
		public var roundTotalStarRanks:Array = [];

		/**
		 *  @private
		 */
		public static const ROUND_AVE_SCORE_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.RankInfoRes.round_ave_score_ranks", "roundAveScoreRanks", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoundAveScoreRank; });

		[ArrayElementType("proto.com.RoundAveScoreRank")]
		public var roundAveScoreRanks:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRankType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank_type$field);
			}
			if (hasCurPage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_page$field);
			}
			if (hasMaxPage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_page$field);
			}
			for (var levelRanks$index:uint = 0; levelRanks$index < this.levelRanks.length; ++levelRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.levelRanks[levelRanks$index]);
			}
			for (var fightingCapacityRanks$index:uint = 0; fightingCapacityRanks$index < this.fightingCapacityRanks.length; ++fightingCapacityRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.fightingCapacityRanks[fightingCapacityRanks$index]);
			}
			for (var arenaRanks$index:uint = 0; arenaRanks$index < this.arenaRanks.length; ++arenaRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.arenaRanks[arenaRanks$index]);
			}
			for (var achievePointsRanks$index:uint = 0; achievePointsRanks$index < this.achievePointsRanks.length; ++achievePointsRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.achievePointsRanks[achievePointsRanks$index]);
			}
			for (var roundTotalStarRanks$index:uint = 0; roundTotalStarRanks$index < this.roundTotalStarRanks.length; ++roundTotalStarRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.roundTotalStarRanks[roundTotalStarRanks$index]);
			}
			for (var roundAveScoreRanks$index:uint = 0; roundAveScoreRanks$index < this.roundAveScoreRanks.length; ++roundAveScoreRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.roundAveScoreRanks[roundAveScoreRanks$index]);
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
			var cur_page$count:uint = 0;
			var max_page$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rank_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoRes.rankType cannot be set twice.');
					}
					++rank_type$count;
					this.rankType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (cur_page$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoRes.curPage cannot be set twice.');
					}
					++cur_page$count;
					this.curPage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (max_page$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankInfoRes.maxPage cannot be set twice.');
					}
					++max_page$count;
					this.maxPage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					this.levelRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.LevelRank()));
					break;
				case 5:
					this.fightingCapacityRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.FightingCapacityRank()));
					break;
				case 6:
					this.arenaRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.ArenaRank()));
					break;
				case 7:
					this.achievePointsRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.AchievePointsRank()));
					break;
				case 8:
					this.roundTotalStarRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.RoundTotalStarRank()));
					break;
				case 9:
					this.roundAveScoreRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.RoundAveScoreRank()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
