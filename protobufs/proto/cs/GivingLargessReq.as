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
	public dynamic final class GivingLargessReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GIVING_ITEM_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.GivingLargessReq.giving_item_id", "givingItemId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var giving_item_id$field:int;

		private var hasField$0:uint = 0;

		public function clearGivingItemId():void {
			hasField$0 &= 0xfffffffe;
			giving_item_id$field = new int();
		}

		public function get hasGivingItemId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set givingItemId(value:int):void {
			hasField$0 |= 0x1;
			giving_item_id$field = value;
		}

		public function get givingItemId():int {
			return giving_item_id$field;
		}

		/**
		 *  @private
		 */
		public static const FRIEND_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GivingLargessReq.friend_id", "friendId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const REQUESTER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GivingLargessReq.requester_id", "requesterId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var requester_id$field:UInt64;

		public function clearRequesterId():void {
			requester_id$field = null;
		}

		public function get hasRequesterId():Boolean {
			return requester_id$field != null;
		}

		public function set requesterId(value:UInt64):void {
			requester_id$field = value;
		}

		public function get requesterId():UInt64 {
			return requester_id$field;
		}

		/**
		 *  @private
		 */
		public static const RAND_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GivingLargessReq.rand_uid", "randUid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rand_uid$field:UInt64;

		public function clearRandUid():void {
			rand_uid$field = null;
		}

		public function get hasRandUid():Boolean {
			return rand_uid$field != null;
		}

		public function set randUid(value:UInt64):void {
			rand_uid$field = value;
		}

		public function get randUid():UInt64 {
			return rand_uid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGivingItemId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, giving_item_id$field);
			}
			if (hasFriendId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, friend_id$field);
			}
			if (hasRequesterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, requester_id$field);
			}
			if (hasRandUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, rand_uid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var giving_item_id$count:uint = 0;
			var friend_id$count:uint = 0;
			var requester_id$count:uint = 0;
			var rand_uid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (giving_item_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessReq.givingItemId cannot be set twice.');
					}
					++giving_item_id$count;
					this.givingItemId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (friend_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessReq.friendId cannot be set twice.');
					}
					++friend_id$count;
					this.friendId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (requester_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessReq.requesterId cannot be set twice.');
					}
					++requester_id$count;
					this.requesterId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (rand_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessReq.randUid cannot be set twice.');
					}
					++rand_uid$count;
					this.randUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
