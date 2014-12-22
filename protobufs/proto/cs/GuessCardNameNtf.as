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
	public dynamic final class GuessCardNameNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GUESS_CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.GuessCardNameNtf.guess_cards", "guessCards", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var guessCards:Array = [];

		/**
		 *  @private
		 */
		public static const FROM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardNameNtf.from_id", "fromId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TARGET_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardNameNtf.target_id", "targetId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var guessCards$index:uint = 0; guessCards$index < this.guessCards.length; ++guessCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.guessCards[guessCards$index]);
			}
			if (hasFromId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_id$field);
			}
			if (hasTargetId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var from_id$count:uint = 0;
			var target_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.guessCards);
						break;
					}
					this.guessCards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 2:
					if (from_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameNtf.fromId cannot be set twice.');
					}
					++from_id$count;
					this.fromId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (target_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameNtf.targetId cannot be set twice.');
					}
					++target_id$count;
					this.targetId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
