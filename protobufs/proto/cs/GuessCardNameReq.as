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
	public dynamic final class GuessCardNameReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GUESS_CARD_IDX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardNameReq.guess_card_idx", "guessCardIdx", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guess_card_idx$field:int;

		private var hasField$0:uint = 0;

		public function clearGuessCardIdx():void {
			hasField$0 &= 0xfffffffe;
			guess_card_idx$field = new int();
		}

		public function get hasGuessCardIdx():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set guessCardIdx(value:int):void {
			hasField$0 |= 0x1;
			guess_card_idx$field = value;
		}

		public function get guessCardIdx():int {
			return guess_card_idx$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardNameReq.guess_card_id", "guessCardId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGuessCardIdx) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guess_card_idx$field);
			}
			if (hasGuessCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guess_card_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var guess_card_idx$count:uint = 0;
			var guess_card_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (guess_card_idx$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameReq.guessCardIdx cannot be set twice.');
					}
					++guess_card_idx$count;
					this.guessCardIdx = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (guess_card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardNameReq.guessCardId cannot be set twice.');
					}
					++guess_card_id$count;
					this.guessCardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
