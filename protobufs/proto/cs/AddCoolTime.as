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
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AddCoolTime extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COOL_TIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AddCoolTime.cool_time", "coolTime", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CoolTime; });

		private var cool_time$field:proto.com.CoolTime;

		public function clearCoolTime():void {
			cool_time$field = null;
		}

		public function get hasCoolTime():Boolean {
			return cool_time$field != null;
		}

		public function set coolTime(value:proto.com.CoolTime):void {
			cool_time$field = value;
		}

		public function get coolTime():proto.com.CoolTime {
			return cool_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCoolTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, cool_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cool_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cool_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddCoolTime.coolTime cannot be set twice.');
					}
					++cool_time$count;
					this.coolTime = new proto.com.CoolTime();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.coolTime);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
