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
	public dynamic final class MsgHead extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEQ:FieldDescriptor$TYPE_FIXED32 = new FieldDescriptor$TYPE_FIXED32("proto.cs.MsgHead.seq", "seq", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var seq$field:uint;

		private var hasField$0:uint = 0;

		public function clearSeq():void {
			hasField$0 &= 0xfffffffe;
			seq$field = new uint();
		}

		public function get hasSeq():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set seq(value:uint):void {
			hasField$0 |= 0x1;
			seq$field = value;
		}

		public function get seq():uint {
			return seq$field;
		}

		/**
		 *  @private
		 */
		public static const CMD:FieldDescriptor$TYPE_FIXED32 = new FieldDescriptor$TYPE_FIXED32("proto.cs.MsgHead.cmd", "cmd", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var cmd$field:uint;

		public function clearCmd():void {
			hasField$0 &= 0xfffffffd;
			cmd$field = new uint();
		}

		public function get hasCmd():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set cmd(value:uint):void {
			hasField$0 |= 0x2;
			cmd$field = value;
		}

		public function get cmd():uint {
			return cmd$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSeq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED32(output, seq$field);
			}
			if (hasCmd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED32(output, cmd$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var seq$count:uint = 0;
			var cmd$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (seq$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgHead.seq cannot be set twice.');
					}
					++seq$count;
					this.seq = com.netease.protobuf.ReadUtils.read$TYPE_FIXED32(input);
					break;
				case 2:
					if (cmd$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgHead.cmd cannot be set twice.');
					}
					++cmd$count;
					this.cmd = com.netease.protobuf.ReadUtils.read$TYPE_FIXED32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
