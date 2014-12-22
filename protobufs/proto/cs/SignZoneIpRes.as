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
	public dynamic final class SignZoneIpRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ZONE_IP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.SignZoneIpRes.zone_ip", "zoneIp", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var zone_ip$field:String;

		public function clearZoneIp():void {
			zone_ip$field = null;
		}

		public function get hasZoneIp():Boolean {
			return zone_ip$field != null;
		}

		public function set zoneIp(value:String):void {
			zone_ip$field = value;
		}

		public function get zoneIp():String {
			return zone_ip$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasZoneIp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, zone_ip$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var zone_ip$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (zone_ip$count != 0) {
						throw new flash.errors.IOError('Bad data format: SignZoneIpRes.zoneIp cannot be set twice.');
					}
					++zone_ip$count;
					this.zoneIp = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
