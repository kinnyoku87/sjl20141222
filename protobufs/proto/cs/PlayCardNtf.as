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
	import proto.cs.SkillUseReq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PlayCardNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.PlayCardNtf.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.PlayCardNtf.card_id", "cardId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const COST_MP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.PlayCardNtf.cost_mp", "costMp", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost_mp$field:int;

		public function clearCostMp():void {
			hasField$0 &= 0xfffffffd;
			cost_mp$field = new int();
		}

		public function get hasCostMp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set costMp(value:int):void {
			hasField$0 |= 0x2;
			cost_mp$field = value;
		}

		public function get costMp():int {
			return cost_mp$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_MP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.PlayCardNtf.last_mp", "lastMp", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_mp$field:int;

		public function clearLastMp():void {
			hasField$0 &= 0xfffffffb;
			last_mp$field = new int();
		}

		public function get hasLastMp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lastMp(value:int):void {
			hasField$0 |= 0x4;
			last_mp$field = value;
		}

		public function get lastMp():int {
			return last_mp$field;
		}

		/**
		 *  @private
		 */
		public static const CHESS_POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.PlayCardNtf.chess_pos", "chessPos", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChessPos; });

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
		public static const SKILL_USE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.PlayCardNtf.skill_use_req", "skillUseReq", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SkillUseReq; });

		private var skill_use_req$field:proto.cs.SkillUseReq;

		public function clearSkillUseReq():void {
			skill_use_req$field = null;
		}

		public function get hasSkillUseReq():Boolean {
			return skill_use_req$field != null;
		}

		public function set skillUseReq(value:proto.cs.SkillUseReq):void {
			skill_use_req$field = value;
		}

		public function get skillUseReq():proto.cs.SkillUseReq {
			return skill_use_req$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, card_id$field);
			}
			if (hasCostMp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cost_mp$field);
			}
			if (hasLastMp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, last_mp$field);
			}
			if (hasChessPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chess_pos$field);
			}
			if (hasSkillUseReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, skill_use_req$field);
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
			var card_id$count:uint = 0;
			var cost_mp$count:uint = 0;
			var last_mp$count:uint = 0;
			var chess_pos$count:uint = 0;
			var skill_use_req$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayCardNtf.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayCardNtf.cardId cannot be set twice.');
					}
					++card_id$count;
					this.cardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (cost_mp$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayCardNtf.costMp cannot be set twice.');
					}
					++cost_mp$count;
					this.costMp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (last_mp$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayCardNtf.lastMp cannot be set twice.');
					}
					++last_mp$count;
					this.lastMp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (chess_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayCardNtf.chessPos cannot be set twice.');
					}
					++chess_pos$count;
					this.chessPos = new proto.cs.ChessPos();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chessPos);
					break;
				case 6:
					if (skill_use_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayCardNtf.skillUseReq cannot be set twice.');
					}
					++skill_use_req$count;
					this.skillUseReq = new proto.cs.SkillUseReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skillUseReq);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
