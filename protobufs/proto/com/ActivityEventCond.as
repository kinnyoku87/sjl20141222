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
	public dynamic final class ActivityEventCond extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EVENT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ActivityEventCond.event_id", "eventId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var event_id$field:int;

		private var hasField$0:uint = 0;

		public function clearEventId():void {
			hasField$0 &= 0xfffffffe;
			event_id$field = new int();
		}

		public function get hasEventId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set eventId(value:int):void {
			hasField$0 |= 0x1;
			event_id$field = value;
		}

		public function get eventId():int {
			return event_id$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ActivityEventCond.value", "value", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var value$field:int;

		public function clearValue():void {
			hasField$0 &= 0xfffffffd;
			value$field = new int();
		}

		public function get hasValue():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set value(value:int):void {
			hasField$0 |= 0x2;
			value$field = value;
		}

		public function get value():int {
			return value$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEventId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, event_id$field);
			}
			if (hasValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, value$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var event_id$count:uint = 0;
			var value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (event_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActivityEventCond.eventId cannot be set twice.');
					}
					++event_id$count;
					this.eventId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActivityEventCond.value cannot be set twice.');
					}
					++value$count;
					this.value = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
