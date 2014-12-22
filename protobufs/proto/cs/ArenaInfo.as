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
	public dynamic final class ArenaInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ARENA_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ArenaInfo.arena_id", "arenaId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var arena_id$field:int;

		private var hasField$0:uint = 0;

		public function clearArenaId():void {
			hasField$0 &= 0xfffffffe;
			arena_id$field = new int();
		}

		public function get hasArenaId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set arenaId(value:int):void {
			hasField$0 |= 0x1;
			arena_id$field = value;
		}

		public function get arenaId():int {
			return arena_id$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ArenaInfo.arena_name", "arenaName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var arena_name$field:String;

		public function clearArenaName():void {
			arena_name$field = null;
		}

		public function get hasArenaName():Boolean {
			return arena_name$field != null;
		}

		public function set arenaName(value:String):void {
			arena_name$field = value;
		}

		public function get arenaName():String {
			return arena_name$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_IP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ArenaInfo.arena_ip", "arenaIp", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var arena_ip$field:String;

		public function clearArenaIp():void {
			arena_ip$field = null;
		}

		public function get hasArenaIp():Boolean {
			return arena_ip$field != null;
		}

		public function set arenaIp(value:String):void {
			arena_ip$field = value;
		}

		public function get arenaIp():String {
			return arena_ip$field;
		}

		/**
		 *  @private
		 */
		public static const STATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ArenaInfo.state", "state", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var state$field:int;

		public function clearState():void {
			hasField$0 &= 0xfffffffd;
			state$field = new int();
		}

		public function get hasState():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set state(value:int):void {
			hasField$0 |= 0x2;
			state$field = value;
		}

		public function get state():int {
			return state$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasArenaId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, arena_id$field);
			}
			if (hasArenaName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, arena_name$field);
			}
			if (hasArenaIp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, arena_ip$field);
			}
			if (hasState) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, state$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var arena_id$count:uint = 0;
			var arena_name$count:uint = 0;
			var arena_ip$count:uint = 0;
			var state$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (arena_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaInfo.arenaId cannot be set twice.');
					}
					++arena_id$count;
					this.arenaId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (arena_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaInfo.arenaName cannot be set twice.');
					}
					++arena_name$count;
					this.arenaName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (arena_ip$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaInfo.arenaIp cannot be set twice.');
					}
					++arena_ip$count;
					this.arenaIp = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (state$count != 0) {
						throw new flash.errors.IOError('Bad data format: ArenaInfo.state cannot be set twice.');
					}
					++state$count;
					this.state = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
