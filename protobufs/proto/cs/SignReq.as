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
	public dynamic final class SignReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SignReq.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var uid$field:UInt64;

		public function clearUid():void {
			uid$field = null;
		}

		public function get hasUid():Boolean {
			return uid$field != null;
		}

		public function set uid(value:UInt64):void {
			uid$field = value;
		}

		public function get uid():UInt64 {
			return uid$field;
		}

		/**
		 *  @private
		 */
		public static const SIGN_STR:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.SignReq.sign_str", "signStr", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sign_str$field:String;

		public function clearSignStr():void {
			sign_str$field = null;
		}

		public function get hasSignStr():Boolean {
			return sign_str$field != null;
		}

		public function set signStr(value:String):void {
			sign_str$field = value;
		}

		public function get signStr():String {
			return sign_str$field;
		}

		/**
		 *  @private
		 */
		public static const CB_DATA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SignReq.cb_data", "cbData", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cb_data$field:int;

		private var hasField$0:uint = 0;

		public function clearCbData():void {
			hasField$0 &= 0xfffffffe;
			cb_data$field = new int();
		}

		public function get hasCbData():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cbData(value:int):void {
			hasField$0 |= 0x1;
			cb_data$field = value;
		}

		public function get cbData():int {
			return cb_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, uid$field);
			}
			if (hasSignStr) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, sign_str$field);
			}
			if (hasCbData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cb_data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var uid$count:uint = 0;
			var sign_str$count:uint = 0;
			var cb_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: SignReq.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (sign_str$count != 0) {
						throw new flash.errors.IOError('Bad data format: SignReq.signStr cannot be set twice.');
					}
					++sign_str$count;
					this.signStr = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (cb_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: SignReq.cbData cannot be set twice.');
					}
					++cb_data$count;
					this.cbData = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
