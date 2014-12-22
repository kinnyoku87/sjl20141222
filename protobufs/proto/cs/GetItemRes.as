package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.CoolTime;
	import proto.com.ItemInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GetItemRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ITEM_INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetItemRes.item_infos", "itemInfos", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.ItemInfo; });

		[ArrayElementType("proto.com.ItemInfo")]
		public var itemInfos:Array = [];

		/**
		 *  @private
		 */
		public static const BAG_IDS:RepeatedFieldDescriptor$TYPE_UINT64 = new RepeatedFieldDescriptor$TYPE_UINT64("proto.cs.GetItemRes.bag_ids", "bagIds", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("UInt64")]
		public var bagIds:Array = [];

		/**
		 *  @private
		 */
		public static const COOL_TIMES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetItemRes.cool_times", "coolTimes", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CoolTime; });

		[ArrayElementType("proto.com.CoolTime")]
		public var coolTimes:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var itemInfos$index:uint = 0; itemInfos$index < this.itemInfos.length; ++itemInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.itemInfos[itemInfos$index]);
			}
			for (var bagIds$index:uint = 0; bagIds$index < this.bagIds.length; ++bagIds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, this.bagIds[bagIds$index]);
			}
			for (var coolTimes$index:uint = 0; coolTimes$index < this.coolTimes.length; ++coolTimes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.coolTimes[coolTimes$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.itemInfos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.ItemInfo()));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_UINT64, this.bagIds);
						break;
					}
					this.bagIds.push(com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input));
					break;
				case 3:
					this.coolTimes.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CoolTime()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
