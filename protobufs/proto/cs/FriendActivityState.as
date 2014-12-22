package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.FriendActivityStateType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FriendActivityState extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STATE_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.cs.FriendActivityState.state_type", "stateType", (1 << 3) | com.netease.protobuf.WireType.VARINT, proto.cs.FriendActivityStateType);

		private var state_type$field:int;

		private var hasField$0:uint = 0;

		public function clearStateType():void {
			hasField$0 &= 0xfffffffe;
			state_type$field = new int();
		}

		public function get hasStateType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set stateType(value:int):void {
			hasField$0 |= 0x1;
			state_type$field = value;
		}

		public function get stateType():int {
			return state_type$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.FriendActivityState.is_ing", "isIng", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_ing$field:Boolean;

		public function clearIsIng():void {
			hasField$0 &= 0xfffffffd;
			is_ing$field = new Boolean();
		}

		public function get hasIsIng():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isIng(value:Boolean):void {
			hasField$0 |= 0x2;
			is_ing$field = value;
		}

		public function get isIng():Boolean {
			return is_ing$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStateType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, state_type$field);
			}
			if (hasIsIng) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_ing$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var state_type$count:uint = 0;
			var is_ing$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (state_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendActivityState.stateType cannot be set twice.');
					}
					++state_type$count;
					this.stateType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (is_ing$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendActivityState.isIng cannot be set twice.');
					}
					++is_ing$count;
					this.isIng = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
