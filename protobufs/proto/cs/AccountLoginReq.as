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
	public dynamic final class AccountLoginReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OPEN_ID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.AccountLoginReq.open_id", "openId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var open_id$field:String;

		public function clearOpenId():void {
			open_id$field = null;
		}

		public function get hasOpenId():Boolean {
			return open_id$field != null;
		}

		public function set openId(value:String):void {
			open_id$field = value;
		}

		public function get openId():String {
			return open_id$field;
		}

		/**
		 *  @private
		 */
		public static const OPEN_KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.AccountLoginReq.open_key", "openKey", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var open_key$field:String;

		public function clearOpenKey():void {
			open_key$field = null;
		}

		public function get hasOpenKey():Boolean {
			return open_key$field != null;
		}

		public function set openKey(value:String):void {
			open_key$field = value;
		}

		public function get openKey():String {
			return open_key$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOpenId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, open_id$field);
			}
			if (hasOpenKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, open_key$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var open_id$count:uint = 0;
			var open_key$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (open_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AccountLoginReq.openId cannot be set twice.');
					}
					++open_id$count;
					this.openId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (open_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: AccountLoginReq.openKey cannot be set twice.');
					}
					++open_key$count;
					this.openKey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
