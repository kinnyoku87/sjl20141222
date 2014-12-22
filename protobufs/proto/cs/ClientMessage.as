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
	public dynamic final class ClientMessage extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEND_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ClientMessage.send_id", "sendId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var send_id$field:UInt64;

		public function clearSendId():void {
			send_id$field = null;
		}

		public function get hasSendId():Boolean {
			return send_id$field != null;
		}

		public function set sendId(value:UInt64):void {
			send_id$field = value;
		}

		public function get sendId():UInt64 {
			return send_id$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE1:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ClientMessage.value1", "value1", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var value1$field:int;

		private var hasField$0:uint = 0;

		public function clearValue1():void {
			hasField$0 &= 0xfffffffe;
			value1$field = new int();
		}

		public function get hasValue1():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set value1(value:int):void {
			hasField$0 |= 0x1;
			value1$field = value;
		}

		public function get value1():int {
			return value1$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE2:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.ClientMessage.value2", "value2", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var value2$field:String;

		public function clearValue2():void {
			value2$field = null;
		}

		public function get hasValue2():Boolean {
			return value2$field != null;
		}

		public function set value2(value:String):void {
			value2$field = value;
		}

		public function get value2():String {
			return value2$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSendId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, send_id$field);
			}
			if (hasValue1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, value1$field);
			}
			if (hasValue2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, value2$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var send_id$count:uint = 0;
			var value1$count:uint = 0;
			var value2$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (send_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientMessage.sendId cannot be set twice.');
					}
					++send_id$count;
					this.sendId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (value1$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientMessage.value1 cannot be set twice.');
					}
					++value1$count;
					this.value1 = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (value2$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientMessage.value2 cannot be set twice.');
					}
					++value2$count;
					this.value2 = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
