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
	public dynamic final class GuessCardNameResNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_RIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.GuessCardNameResNtf.is_right", "isRight", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_right$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsRight():void {
			hasField$0 &= 0xfffffffe;
			is_right$field = new Boolean();
		}

		public function get hasIsRight():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isRight(value:Boolean):void {
			hasField$0 |= 0x1;
			is_right$field = value;
		}

		public function get isRight():Boolean {
			return is_right$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardNameResNtf.from_id", "fromId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_id$field:UInt64;

		public function clearFromId():void {
			from_id$field = null;
		}

		public function get hasFromId():Boolean {
			return from_id$field != null;
		}

		public function set fromId(value:UInt64):void {
			from_id$field = value;
		}

		public function get fromId():UInt64 {
			return from_id$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardNameResNtf.target_id", "targetId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var target_id$field:UInt64;

		public function clearTargetId():void {
			target_id$field = null;
		}

		public function get hasTargetId():Boolean {
			return target_id$field != null;
		}

		public function set targetId(value:UInt64):void {
			target_id$field = value;
		}

		public function get targetId():UInt64 {
			return target_id$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardNameResNtf.guess_card_id", "guessCardId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guess_card_id$field:int;

		public function clearGuessCardId():void {
			hasField$0 &= 0xfffffffd;
			guess_card_id$field = new int();
		}

		public function get hasGuessCardId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set guessCardId(value:int):void {
			hasField$0 |= 0x2;
			guess_card_id$field = value;
		}

		public function get guessCardId():int {
			return guess_card_id$field;
		}

		/**
		 *  @private
		 */
		public static const REAL_CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardNameResNtf.real_card_id", "realCardId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var real_card_id$field:int;

		public function clearRealCardId():void {
			hasField$0 &= 0xfffffffb;
			real_card_id$field = new int();
		}

		public function get hasRealCardId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set realCardId(value:int):void {
			hasField$0 |= 0x4;
			real_card_id$field = value;
		}

		public function get realCardId():int {
			return real_card_id$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_CARD_LIST:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.GuessCardNameResNtf.guess_card_list", "guessCardList", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var guessCardList:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsRight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_right$field);
			}
			if (hasFromId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_id$field);
			}
			if (hasTargetId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_id$field);
			}
			if (hasGuessCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guess_card_id$field);
			}
			if (hasRealCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, real_card_id$field);
			}
			for (var guessCardList$index:uint = 0; guessCardList$index < this.guessCardList.length; ++guessCardList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.guessCardList[guessCardList$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_right$count:uint = 0;
			var from_id$count:uint = 0;
			var target_id$count:uint = 0;
			var guess_card_id$count:uint = 0;
			var real_card_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_right$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameResNtf.isRight cannot be set twice.');
					}
					++is_right$count;
					this.isRight = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (from_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameResNtf.fromId cannot be set twice.');
					}
					++from_id$count;
					this.fromId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (target_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameResNtf.targetId cannot be set twice.');
					}
					++target_id$count;
					this.targetId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (guess_card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameResNtf.guessCardId cannot be set twice.');
					}
					++guess_card_id$count;
					this.guessCardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (real_card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameResNtf.realCardId cannot be set twice.');
					}
					++real_card_id$count;
					this.realCardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.guessCardList);
						break;
					}
					this.guessCardList.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
