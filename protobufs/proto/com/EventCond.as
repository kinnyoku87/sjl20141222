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
	public dynamic final class EventCond extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EVENT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.EventCond.event_id", "eventId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TARGET_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.EventCond.target_id", "targetId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var target_id$field:int;

		public function clearTargetId():void {
			hasField$0 &= 0xfffffffd;
			target_id$field = new int();
		}

		public function get hasTargetId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set targetId(value:int):void {
			hasField$0 |= 0x2;
			target_id$field = value;
		}

		public function get targetId():int {
			return target_id$field;
		}

		/**
		 *  @private
		 */
		public static const RES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.EventCond.res_id", "resId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_id$field:int;

		public function clearResId():void {
			hasField$0 &= 0xfffffffb;
			res_id$field = new int();
		}

		public function get hasResId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set resId(value:int):void {
			hasField$0 |= 0x4;
			res_id$field = value;
		}

		public function get resId():int {
			return res_id$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.EventCond.value", "value", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var value$field:int;

		public function clearValue():void {
			hasField$0 &= 0xfffffff7;
			value$field = new int();
		}

		public function get hasValue():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set value(value:int):void {
			hasField$0 |= 0x8;
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
			if (hasTargetId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, target_id$field);
			}
			if (hasResId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_id$field);
			}
			if (hasValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
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
			var target_id$count:uint = 0;
			var res_id$count:uint = 0;
			var value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (event_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EventCond.eventId cannot be set twice.');
					}
					++event_id$count;
					this.eventId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (target_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EventCond.targetId cannot be set twice.');
					}
					++target_id$count;
					this.targetId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (res_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EventCond.resId cannot be set twice.');
					}
					++res_id$count;
					this.resId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: EventCond.value cannot be set twice.');
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
