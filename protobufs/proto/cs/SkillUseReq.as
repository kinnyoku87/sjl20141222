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
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SkillUseReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FROM_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SkillUseReq.from_guid", "fromGuid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const END_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SkillUseReq.end_guid", "endGuid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SKILL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseReq.skill_id", "skillId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSkillId():void {
			hasField$0 &= 0xfffffffe;
			skill_id$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x1;
			skill_id$field = value;
		}

		public function get skillId():int {
			return skill_id$field;
		}

		/**
		 *  @private
		 */
		public static const COST_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.SkillUseReq.cost_cards", "costCards", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var costCards:Array = [];

		/**
		 *  @private
		 */
		public static const SKILL_SOURCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SkillUseReq.skill_source", "skillSource", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_source$field:int;

		public function clearSkillSource():void {
			hasField$0 &= 0xfffffffd;
			skill_source$field = new int();
		}

		public function get hasSkillSource():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set skillSource(value:int):void {
			hasField$0 |= 0x2;
			skill_source$field = value;
		}

		public function get skillSource():int {
			return skill_source$field;
		}

		/**
		 *  @private
		 */
		public static const COST_DIE_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.SkillUseReq.cost_die_cards", "costDieCards", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var costDieCards:Array = [];

		/**
		 *  @private
		 */
		public static const COST_OBJECTS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.cs.SkillUseReq.cost_objects", "costObjects", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("UInt64")]
		public var costObjects:Array = [];

		/**
		 *  @private
		 */
		public static const SECOND_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SkillUseReq.second_guid", "secondGuid", (8 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const END_CHESS_POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.SkillUseReq.end_chess_pos", "endChessPos", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChessPos; });

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
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_id$field);
			}
			for (var costCards$index:uint = 0; costCards$index < this.costCards.length; ++costCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.costCards[costCards$index]);
			}
			if (hasSkillSource) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_source$field);
			}
			for (var costDieCards$index:uint = 0; costDieCards$index < this.costDieCards.length; ++costDieCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.costDieCards[costDieCards$index]);
			}
			for (var costObjects$index:uint = 0; costObjects$index < this.costObjects.length; ++costObjects$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.costObjects[costObjects$index]);
			}
			if (hasSecondGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, second_guid$field);
			}
			if (hasEndChessPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
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
			var skill_id$count:uint = 0;
			var skill_source$count:uint = 0;
			var second_guid$count:uint = 0;
			var end_chess_pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (from_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseReq.fromGuid cannot be set twice.');
					}
					++from_guid$count;
					this.fromGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (end_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseReq.endGuid cannot be set twice.');
					}
					++end_guid$count;
					this.endGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (skill_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseReq.skillId cannot be set twice.');
					}
					++skill_id$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.costCards);
						break;
					}
					this.costCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 5:
					if (skill_source$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseReq.skillSource cannot be set twice.');
					}
					++skill_source$count;
					this.skillSource = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.costDieCards);
						break;
					}
					this.costDieCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT64, this.costObjects);
						break;
					}
					this.costObjects.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input));
					break;
				case 8:
					if (second_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseReq.secondGuid cannot be set twice.');
					}
					++second_guid$count;
					this.secondGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 9:
					if (end_chess_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseReq.endChessPos cannot be set twice.');
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
