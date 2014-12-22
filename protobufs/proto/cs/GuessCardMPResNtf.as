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
	public dynamic final class GuessCardMPResNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_RIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.GuessCardMPResNtf.is_right", "isRight", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const FROM_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardMPResNtf.from_role_id", "fromRoleId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_role_id$field:UInt64;

		public function clearFromRoleId():void {
			from_role_id$field = null;
		}

		public function get hasFromRoleId():Boolean {
			return from_role_id$field != null;
		}

		public function set fromRoleId(value:UInt64):void {
			from_role_id$field = value;
		}

		public function get fromRoleId():UInt64 {
			return from_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GuessCardMPResNtf.target_role_id", "targetRoleId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var target_role_id$field:UInt64;

		public function clearTargetRoleId():void {
			target_role_id$field = null;
		}

		public function get hasTargetRoleId():Boolean {
			return target_role_id$field != null;
		}

		public function set targetRoleId(value:UInt64):void {
			target_role_id$field = value;
		}

		public function get targetRoleId():UInt64 {
			return target_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_MP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardMPResNtf.guess_mp", "guessMp", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guess_mp$field:int;

		public function clearGuessMp():void {
			hasField$0 &= 0xfffffffd;
			guess_mp$field = new int();
		}

		public function get hasGuessMp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set guessMp(value:int):void {
			hasField$0 |= 0x2;
			guess_mp$field = value;
		}

		public function get guessMp():int {
			return guess_mp$field;
		}

		/**
		 *  @private
		 */
		public static const REAL_CARD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GuessCardMPResNtf.real_card_id", "realCardId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsRight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_right$field);
			}
			if (hasFromRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_role_id$field);
			}
			if (hasTargetRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_role_id$field);
			}
			if (hasGuessMp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guess_mp$field);
			}
			if (hasRealCardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, real_card_id$field);
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
			var from_role_id$count:uint = 0;
			var target_role_id$count:uint = 0;
			var guess_mp$count:uint = 0;
			var real_card_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_right$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPResNtf.isRight cannot be set twice.');
					}
					++is_right$count;
					this.isRight = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (from_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPResNtf.fromRoleId cannot be set twice.');
					}
					++from_role_id$count;
					this.fromRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (target_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPResNtf.targetRoleId cannot be set twice.');
					}
					++target_role_id$count;
					this.targetRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (guess_mp$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPResNtf.guessMp cannot be set twice.');
					}
					++guess_mp$count;
					this.guessMp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (real_card_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuessCardMPResNtf.realCardId cannot be set twice.');
					}
					++real_card_id$count;
					this.realCardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
