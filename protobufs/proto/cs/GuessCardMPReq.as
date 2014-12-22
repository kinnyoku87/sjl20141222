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
	public dynamic final class GuessCardMPReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GUESS_MP_VALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardMPReq.guess_mp_value", "guessMpValue", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guess_mp_value$field:int;

		private var hasField$0:uint = 0;

		public function clearGuessMpValue():void {
			hasField$0 &= 0xfffffffe;
			guess_mp_value$field = new int();
		}

		public function get hasGuessMpValue():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set guessMpValue(value:int):void {
			hasField$0 |= 0x1;
			guess_mp_value$field = value;
		}

		public function get guessMpValue():int {
			return guess_mp_value$field;
		}

		/**
		 *  @private
		 */
		public static const SELECT_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardMPReq.select_uid", "selectUid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var select_uid$field:UInt64;

		public function clearSelectUid():void {
			select_uid$field = null;
		}

		public function get hasSelectUid():Boolean {
			return select_uid$field != null;
		}

		public function set selectUid(value:UInt64):void {
			select_uid$field = value;
		}

		public function get selectUid():UInt64 {
			return select_uid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGuessMpValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guess_mp_value$field);
			}
			if (hasSelectUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, select_uid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var guess_mp_value$count:uint = 0;
			var select_uid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (guess_mp_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPReq.guessMpValue cannot be set twice.');
					}
					++guess_mp_value$count;
					this.guessMpValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (select_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPReq.selectUid cannot be set twice.');
					}
					++select_uid$count;
					this.selectUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
