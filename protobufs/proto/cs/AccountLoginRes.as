package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.ArenaInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AccountLoginRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.AccountLoginRes.ret", "ret", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ret$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearRet():void {
			hasField$0 &= 0xfffffffe;
			ret$field = new Boolean();
		}

		public function get hasRet():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ret(value:Boolean):void {
			hasField$0 |= 0x1;
			ret$field = value;
		}

		public function get ret():Boolean {
			return ret$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.AccountLoginRes.desc", "desc", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_SERVERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.AccountLoginRes.arena_servers", "arenaServers", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaInfo; });

		[ArrayElementType("proto.cs.ArenaInfo")]
		public var arenaServers:Array = [];

		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.AccountLoginRes.uid", "uid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var uid$field:UInt64;

		public function clearUid():void {
			uid$field = null;
		}

		public function get hasUid():Boolean {
			return uid$field != null;
		}

		public function set uid(value:UInt64):void {
			uid$field = value;
		}

		public function get uid():UInt64 {
			return uid$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_ARENA_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.AccountLoginRes.last_arena_id", "lastArenaId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_arena_id$field:int;

		public function clearLastArenaId():void {
			hasField$0 &= 0xfffffffd;
			last_arena_id$field = new int();
		}

		public function get hasLastArenaId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set lastArenaId(value:int):void {
			hasField$0 |= 0x2;
			last_arena_id$field = value;
		}

		public function get lastArenaId():int {
			return last_arena_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, ret$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, desc$field);
			}
			for (var arenaServers$index:uint = 0; arenaServers$index < this.arenaServers.length; ++arenaServers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.arenaServers[arenaServers$index]);
			}
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, uid$field);
			}
			if (hasLastArenaId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, last_arena_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var ret$count:uint = 0;
			var desc$count:uint = 0;
			var uid$count:uint = 0;
			var last_arena_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ret$count != 0) {
						throw new flash.errors.IOError('Bad data format: AccountLoginRes.ret cannot be set twice.');
					}
					++ret$count;
					this.ret = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: AccountLoginRes.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					this.arenaServers.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.ArenaInfo()));
					break;
				case 4:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: AccountLoginRes.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 5:
					if (last_arena_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AccountLoginRes.lastArenaId cannot be set twice.');
					}
					++last_arena_id$count;
					this.lastArenaId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
