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
	public dynamic final class ItemShopBuyReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SHOP_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ItemShopBuyReq.shop_id", "shopId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shop_id$field:int;

		private var hasField$0:uint = 0;

		public function clearShopId():void {
			hasField$0 &= 0xfffffffe;
			shop_id$field = new int();
		}

		public function get hasShopId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set shopId(value:int):void {
			hasField$0 |= 0x1;
			shop_id$field = value;
		}

		public function get shopId():int {
			return shop_id$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ItemShopBuyReq.buy_type", "buyType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_type$field:int;

		public function clearBuyType():void {
			hasField$0 &= 0xfffffffd;
			buy_type$field = new int();
		}

		public function get hasBuyType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set buyType(value:int):void {
			hasField$0 |= 0x2;
			buy_type$field = value;
		}

		public function get buyType():int {
			return buy_type$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ItemShopBuyReq.count", "count", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffb;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x4;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const ICON_URL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ItemShopBuyReq.icon_url", "iconUrl", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon_url$field:String;

		public function clearIconUrl():void {
			icon_url$field = null;
		}

		public function get hasIconUrl():Boolean {
			return icon_url$field != null;
		}

		public function set iconUrl(value:String):void {
			icon_url$field = value;
		}

		public function get iconUrl():String {
			return icon_url$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasShopId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shop_id$field);
			}
			if (hasBuyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, buy_type$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, count$field);
			}
			if (hasIconUrl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, icon_url$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var shop_id$count:uint = 0;
			var buy_type$count:uint = 0;
			var count$count:uint = 0;
			var icon_url$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (shop_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemShopBuyReq.shopId cannot be set twice.');
					}
					++shop_id$count;
					this.shopId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (buy_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemShopBuyReq.buyType cannot be set twice.');
					}
					++buy_type$count;
					this.buyType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemShopBuyReq.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (icon_url$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemShopBuyReq.iconUrl cannot be set twice.');
					}
					++icon_url$count;
					this.iconUrl = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
