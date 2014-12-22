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
	public dynamic final class QQInviteInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IOPENID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.QQInviteInfo.iopenid", "iopenid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var iopenid$field:String;

		public function clearIopenid():void {
			iopenid$field = null;
		}

		public function get hasIopenid():Boolean {
			return iopenid$field != null;
		}

		public function set iopenid(value:String):void {
			iopenid$field = value;
		}

		public function get iopenid():String {
			return iopenid$field;
		}

		/**
		 *  @private
		 */
		public static const ITIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.QQInviteInfo.itime", "itime", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var itime$field:String;

		public function clearItime():void {
			itime$field = null;
		}

		public function get hasItime():Boolean {
			return itime$field != null;
		}

		public function set itime(value:String):void {
			itime$field = value;
		}

		public function get itime():String {
			return itime$field;
		}

		/**
		 *  @private
		 */
		public static const FREE_GIFT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.QQInviteInfo.free_gift_id", "freeGiftId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var free_gift_id$field:int;

		private var hasField$0:uint = 0;

		public function clearFreeGiftId():void {
			hasField$0 &= 0xfffffffe;
			free_gift_id$field = new int();
		}

		public function get hasFreeGiftId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set freeGiftId(value:int):void {
			hasField$0 |= 0x1;
			free_gift_id$field = value;
		}

		public function get freeGiftId():int {
			return free_gift_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIopenid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, iopenid$field);
			}
			if (hasItime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, itime$field);
			}
			if (hasFreeGiftId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, free_gift_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var iopenid$count:uint = 0;
			var itime$count:uint = 0;
			var free_gift_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (iopenid$count != 0) {
						throw new flash.errors.IOError('Bad data format: QQInviteInfo.iopenid cannot be set twice.');
					}
					++iopenid$count;
					this.iopenid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (itime$count != 0) {
						throw new flash.errors.IOError('Bad data format: QQInviteInfo.itime cannot be set twice.');
					}
					++itime$count;
					this.itime = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (free_gift_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: QQInviteInfo.freeGiftId cannot be set twice.');
					}
					++free_gift_id$count;
					this.freeGiftId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
