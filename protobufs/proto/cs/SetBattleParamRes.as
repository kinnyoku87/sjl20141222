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
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SetBattleParamRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAMP_BATTLE_CARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.SetBattleParamRes.camp_battle_card", "campBattleCard", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CampBattleCard; });

		private var camp_battle_card$field:proto.com.CampBattleCard;

		public function clearCampBattleCard():void {
			camp_battle_card$field = null;
		}

		public function get hasCampBattleCard():Boolean {
			return camp_battle_card$field != null;
		}

		public function set campBattleCard(value:proto.com.CampBattleCard):void {
			camp_battle_card$field = value;
		}

		public function get campBattleCard():proto.com.CampBattleCard {
			return camp_battle_card$field;
		}

		/**
		 *  @private
		 */
		public static const IS_DELETE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.SetBattleParamRes.is_delete", "isDelete", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_delete$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsDelete():void {
			hasField$0 &= 0xfffffffe;
			is_delete$field = new Boolean();
		}

		public function get hasIsDelete():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isDelete(value:Boolean):void {
			hasField$0 |= 0x1;
			is_delete$field = value;
		}

		public function get isDelete():Boolean {
			return is_delete$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCampBattleCard) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, camp_battle_card$field);
			}
			if (hasIsDelete) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_delete$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var camp_battle_card$count:uint = 0;
			var is_delete$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (camp_battle_card$count != 0) {
						throw new flash.errors.IOError('Bad data format: SetBattleParamRes.campBattleCard cannot be set twice.');
					}
					++camp_battle_card$count;
					this.campBattleCard = new proto.com.CampBattleCard();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.campBattleCard);
					break;
				case 2:
					if (is_delete$count != 0) {
						throw new flash.errors.IOError('Bad data format: SetBattleParamRes.isDelete cannot be set twice.');
					}
					++is_delete$count;
					this.isDelete = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
