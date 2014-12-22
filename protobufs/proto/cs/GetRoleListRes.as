package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.LoginRoleInfo;
	import proto.com.TXApiParam;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GetRoleListRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OPEN_ID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListRes.open_id", "openId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.GetRoleListRes.uid", "uid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LOGIN_ROLE_INFOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetRoleListRes.login_role_infos", "loginRoleInfos", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.LoginRoleInfo; });

		[ArrayElementType("proto.com.LoginRoleInfo")]
		public var loginRoleInfos:Array = [];

		/**
		 *  @private
		 */
		public static const TX_API_PARAMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetRoleListRes.tx_api_params", "txApiParams", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.TXApiParam; });

		[ArrayElementType("proto.com.TXApiParam")]
		public var txApiParams:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOpenId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, open_id$field);
			}
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, uid$field);
			}
			for (var loginRoleInfos$index:uint = 0; loginRoleInfos$index < this.loginRoleInfos.length; ++loginRoleInfos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.loginRoleInfos[loginRoleInfos$index]);
			}
			for (var txApiParams$index:uint = 0; txApiParams$index < this.txApiParams.length; ++txApiParams$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.txApiParams[txApiParams$index]);
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
			var uid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (open_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListRes.openId cannot be set twice.');
					}
					++open_id$count;
					this.openId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListRes.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					this.loginRoleInfos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.LoginRoleInfo()));
					break;
				case 4:
					this.txApiParams.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.TXApiParam()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
