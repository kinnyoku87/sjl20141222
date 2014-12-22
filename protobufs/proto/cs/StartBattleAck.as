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
	public dynamic final class StartBattleAck extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAME_TIME_TICK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.StartBattleAck.game_time_tick", "gameTimeTick", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var game_time_tick$field:uint;

		private var hasField$0:uint = 0;

		public function clearGameTimeTick():void {
			hasField$0 &= 0xfffffffe;
			game_time_tick$field = new uint();
		}

		public function get hasGameTimeTick():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gameTimeTick(value:uint):void {
			hasField$0 |= 0x1;
			game_time_tick$field = value;
		}

		public function get gameTimeTick():uint {
			return game_time_tick$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGameTimeTick) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, game_time_tick$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var game_time_tick$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (game_time_tick$count != 0) {
						throw new flash.errors.IOError('Bad data format: StartBattleAck.gameTimeTick cannot be set twice.');
					}
					++game_time_tick$count;
					this.gameTimeTick = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
