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
	public dynamic final class MailMoneyExtraReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.MailMoneyExtraReq.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:uint;

		private var hasField$0:uint = 0;

		public function clearTime():void {
			hasField$0 &= 0xfffffffe;
			time$field = new uint();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set time(value:uint):void {
			hasField$0 |= 0x1;
			time$field = value;
		}

		public function get time():uint {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.MailMoneyExtraReq.money_type", "moneyType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_type$field:int;

		public function clearMoneyType():void {
			hasField$0 &= 0xfffffffd;
			money_type$field = new int();
		}

		public function get hasMoneyType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set moneyType(value:int):void {
			hasField$0 |= 0x2;
			money_type$field = value;
		}

		public function get moneyType():int {
			return money_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, time$field);
			}
			if (hasMoneyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time$count:uint = 0;
			var money_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailMoneyExtraReq.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (money_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailMoneyExtraReq.moneyType cannot be set twice.');
					}
					++money_type$count;
					this.moneyType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
