package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.CampBattleCard;
	import proto.com.CardHoldUnit;
	import proto.com.MysticalBoxItem;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GetBattleParamRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAMP_BATTLE_CARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetBattleParamRes.camp_battle_cards", "campBattleCards", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CampBattleCard; });

		[ArrayElementType("proto.com.CampBattleCard")]
		public var campBattleCards:Array = [];

		/**
		 *  @private
		 */
		public static const OTHER_CARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetBattleParamRes.other_cards", "otherCards", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CardHoldUnit; });

		[ArrayElementType("proto.com.CardHoldUnit")]
		public var otherCards:Array = [];

		/**
		 *  @private
		 */
		public static const MYSTICAL_BOXS_CARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetBattleParamRes.mystical_boxs_cards", "mysticalBoxsCards", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.MysticalBoxItem; });

		[ArrayElementType("proto.com.MysticalBoxItem")]
		public var mysticalBoxsCards:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var campBattleCards$index:uint = 0; campBattleCards$index < this.campBattleCards.length; ++campBattleCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.campBattleCards[campBattleCards$index]);
			}
			for (var otherCards$index:uint = 0; otherCards$index < this.otherCards.length; ++otherCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.otherCards[otherCards$index]);
			}
			for (var mysticalBoxsCards$index:uint = 0; mysticalBoxsCards$index < this.mysticalBoxsCards.length; ++mysticalBoxsCards$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.mysticalBoxsCards[mysticalBoxsCards$index]);
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
					this.campBattleCards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CampBattleCard()));
					break;
				case 2:
					this.otherCards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CardHoldUnit()));
					break;
				case 3:
					this.mysticalBoxsCards.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.MysticalBoxItem()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
