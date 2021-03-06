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
	public dynamic final class MysticalBoxOpenRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SHOP_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.MysticalBoxOpenRes.shop_id", "shopId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CARDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.MysticalBoxOpenRes.cards", "cards", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var cards:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasShopId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shop_id$field);
			}
			for (var cards$index:uint = 0; cards$index < this.cards.length; ++cards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.cards[cards$index]);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (shop_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MysticalBoxOpenRes.shopId cannot be set twice.');
					}
					++shop_id$count;
					this.shopId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.cards);
						break;
					}
					this.cards.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
