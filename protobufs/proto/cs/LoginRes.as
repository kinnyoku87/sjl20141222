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
	public dynamic final class LoginRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SERV_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.LoginRes.serv_time", "servTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var serv_time$field:uint;

		private var hasField$0:uint = 0;

		public function clearServTime():void {
			hasField$0 &= 0xfffffffe;
			serv_time$field = new uint();
		}

		public function get hasServTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set servTime(value:uint):void {
			hasField$0 |= 0x1;
			serv_time$field = value;
		}

		public function get servTime():uint {
			return serv_time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_VARIFICATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.LoginRes.is_varificate", "isVarificate", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_varificate$field:uint;

		public function clearIsVarificate():void {
			hasField$0 &= 0xfffffffd;
			is_varificate$field = new uint();
		}

		public function get hasIsVarificate():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isVarificate(value:uint):void {
			hasField$0 |= 0x2;
			is_varificate$field = value;
		}

		public function get isVarificate():uint {
			return is_varificate$field;
		}

		/**
		 *  @private
		 */
		public static const ONLINE_TIME_ACCUMULATE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("proto.cs.LoginRes.online_time_accumulate", "onlineTimeAccumulate", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var online_time_accumulate$field:Int64;

		public function clearOnlineTimeAccumulate():void {
			online_time_accumulate$field = null;
		}

		public function get hasOnlineTimeAccumulate():Boolean {
			return online_time_accumulate$field != null;
		}

		public function set onlineTimeAccumulate(value:Int64):void {
			online_time_accumulate$field = value;
		}

		public function get onlineTimeAccumulate():Int64 {
			return online_time_accumulate$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasServTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, serv_time$field);
			}
			if (hasIsVarificate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, is_varificate$field);
			}
			if (hasOnlineTimeAccumulate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, online_time_accumulate$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var serv_time$count:uint = 0;
			var is_varificate$count:uint = 0;
			var online_time_accumulate$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (serv_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginRes.servTime cannot be set twice.');
					}
					++serv_time$count;
					this.servTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (is_varificate$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginRes.isVarificate cannot be set twice.');
					}
					++is_varificate$count;
					this.isVarificate = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (online_time_accumulate$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginRes.onlineTimeAccumulate cannot be set twice.');
					}
					++online_time_accumulate$count;
					this.onlineTimeAccumulate = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
