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
	public dynamic final class WishInfoNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.WishInfoNtf.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var role_id$field:UInt64;

		public function clearRoleId():void {
			role_id$field = null;
		}

		public function get hasRoleId():Boolean {
			return role_id$field != null;
		}

		public function set roleId(value:UInt64):void {
			role_id$field = value;
		}

		public function get roleId():UInt64 {
			return role_id$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_WISH_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.WishInfoNtf.cur_wish_count", "curWishCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_wish_count$field:int;

		private var hasField$0:uint = 0;

		public function clearCurWishCount():void {
			hasField$0 &= 0xfffffffe;
			cur_wish_count$field = new int();
		}

		public function get hasCurWishCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set curWishCount(value:int):void {
			hasField$0 |= 0x1;
			cur_wish_count$field = value;
		}

		public function get curWishCount():int {
			return cur_wish_count$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_WISH_ITEM_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.WishInfoNtf.cur_wish_item_id", "curWishItemId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_wish_item_id$field:int;

		public function clearCurWishItemId():void {
			hasField$0 &= 0xfffffffd;
			cur_wish_item_id$field = new int();
		}

		public function get hasCurWishItemId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set curWishItemId(value:int):void {
			hasField$0 |= 0x2;
			cur_wish_item_id$field = value;
		}

		public function get curWishItemId():int {
			return cur_wish_item_id$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_BLESS_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.WishInfoNtf.cur_bless_count", "curBlessCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_bless_count$field:int;

		public function clearCurBlessCount():void {
			hasField$0 &= 0xfffffffb;
			cur_bless_count$field = new int();
		}

		public function get hasCurBlessCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set curBlessCount(value:int):void {
			hasField$0 |= 0x4;
			cur_bless_count$field = value;
		}

		public function get curBlessCount():int {
			return cur_bless_count$field;
		}

		/**
		 *  @private
		 */
		public static const BLESS_FRIENDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.cs.WishInfoNtf.bless_friends", "blessFriends", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("UInt64")]
		public var blessFriends:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasCurWishCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_wish_count$field);
			}
			if (hasCurWishItemId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_wish_item_id$field);
			}
			if (hasCurBlessCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_bless_count$field);
			}
			for (var blessFriends$index:uint = 0; blessFriends$index < this.blessFriends.length; ++blessFriends$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.blessFriends[blessFriends$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var role_id$count:uint = 0;
			var cur_wish_count$count:uint = 0;
			var cur_wish_item_id$count:uint = 0;
			var cur_bless_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: WishInfoNtf.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (cur_wish_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: WishInfoNtf.curWishCount cannot be set twice.');
					}
					++cur_wish_count$count;
					this.curWishCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (cur_wish_item_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: WishInfoNtf.curWishItemId cannot be set twice.');
					}
					++cur_wish_item_id$count;
					this.curWishItemId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (cur_bless_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: WishInfoNtf.curBlessCount cannot be set twice.');
					}
					++cur_bless_count$count;
					this.curBlessCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT64, this.blessFriends);
						break;
					}
					this.blessFriends.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
