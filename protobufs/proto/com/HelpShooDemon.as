package proto.com {
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
	public dynamic final class HelpShooDemon extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FRIEND_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.HelpShooDemon.friend_id", "friendId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var friend_id$field:UInt64;

		public function clearFriendId():void {
			friend_id$field = null;
		}

		public function get hasFriendId():Boolean {
			return friend_id$field != null;
		}

		public function set friendId(value:UInt64):void {
			friend_id$field = value;
		}

		public function get friendId():UInt64 {
			return friend_id$field;
		}

		/**
		 *  @private
		 */
		public static const DEMON_APPEAR_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.HelpShooDemon.demon_appear_time", "demonAppearTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var demon_appear_time$field:uint;

		private var hasField$0:uint = 0;

		public function clearDemonAppearTime():void {
			hasField$0 &= 0xfffffffe;
			demon_appear_time$field = new uint();
		}

		public function get hasDemonAppearTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set demonAppearTime(value:uint):void {
			hasField$0 |= 0x1;
			demon_appear_time$field = value;
		}

		public function get demonAppearTime():uint {
			return demon_appear_time$field;
		}

		/**
		 *  @private
		 */
		public static const DEMON_SHOO_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.HelpShooDemon.demon_shoo_time", "demonShooTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var demon_shoo_time$field:uint;

		public function clearDemonShooTime():void {
			hasField$0 &= 0xfffffffd;
			demon_shoo_time$field = new uint();
		}

		public function get hasDemonShooTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set demonShooTime(value:uint):void {
			hasField$0 |= 0x2;
			demon_shoo_time$field = value;
		}

		public function get demonShooTime():uint {
			return demon_shoo_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFriendId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, friend_id$field);
			}
			if (hasDemonAppearTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, demon_appear_time$field);
			}
			if (hasDemonShooTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, demon_shoo_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var friend_id$count:uint = 0;
			var demon_appear_time$count:uint = 0;
			var demon_shoo_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (friend_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelpShooDemon.friendId cannot be set twice.');
					}
					++friend_id$count;
					this.friendId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (demon_appear_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelpShooDemon.demonAppearTime cannot be set twice.');
					}
					++demon_appear_time$count;
					this.demonAppearTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (demon_shoo_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelpShooDemon.demonShooTime cannot be set twice.');
					}
					++demon_shoo_time$count;
					this.demonShooTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
