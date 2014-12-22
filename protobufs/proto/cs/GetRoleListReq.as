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
	public dynamic final class GetRoleListReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OPEN_ID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.open_id", "openId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const OPEN_KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.open_key", "openKey", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const PF:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.pf", "pf", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pf$field:String;

		public function clearPf():void {
			pf$field = null;
		}

		public function get hasPf():Boolean {
			return pf$field != null;
		}

		public function set pf(value:String):void {
			pf$field = value;
		}

		public function get pf():String {
			return pf$field;
		}

		/**
		 *  @private
		 */
		public static const PF_KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.pf_key", "pfKey", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pf_key$field:String;

		public function clearPfKey():void {
			pf_key$field = null;
		}

		public function get hasPfKey():Boolean {
			return pf_key$field != null;
		}

		public function set pfKey(value:String):void {
			pf_key$field = value;
		}

		public function get pfKey():String {
			return pf_key$field;
		}

		/**
		 *  @private
		 */
		public static const IP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.ip", "ip", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ip$field:String;

		public function clearIp():void {
			ip$field = null;
		}

		public function get hasIp():Boolean {
			return ip$field != null;
		}

		public function set ip(value:String):void {
			ip$field = value;
		}

		public function get ip():String {
			return ip$field;
		}

		/**
		 *  @private
		 */
		public static const INVKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.invkey", "invkey", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var invkey$field:String;

		public function clearInvkey():void {
			invkey$field = null;
		}

		public function get hasInvkey():Boolean {
			return invkey$field != null;
		}

		public function set invkey(value:String):void {
			invkey$field = value;
		}

		public function get invkey():String {
			return invkey$field;
		}

		/**
		 *  @private
		 */
		public static const ITIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.itime", "itime", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IOPENID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.iopenid", "iopenid", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const FREE_GIFT_ID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.GetRoleListReq.free_gift_id", "freeGiftId", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var free_gift_id$field:String;

		public function clearFreeGiftId():void {
			free_gift_id$field = null;
		}

		public function get hasFreeGiftId():Boolean {
			return free_gift_id$field != null;
		}

		public function set freeGiftId(value:String):void {
			free_gift_id$field = value;
		}

		public function get freeGiftId():String {
			return free_gift_id$field;
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
			if (hasPf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pf$field);
			}
			if (hasPfKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pf_key$field);
			}
			if (hasIp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ip$field);
			}
			if (hasInvkey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, invkey$field);
			}
			if (hasItime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, itime$field);
			}
			if (hasIopenid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, iopenid$field);
			}
			if (hasFreeGiftId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, free_gift_id$field);
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
			var pf$count:uint = 0;
			var pf_key$count:uint = 0;
			var ip$count:uint = 0;
			var invkey$count:uint = 0;
			var itime$count:uint = 0;
			var iopenid$count:uint = 0;
			var free_gift_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (open_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.openId cannot be set twice.');
					}
					++open_id$count;
					this.openId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (open_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.openKey cannot be set twice.');
					}
					++open_key$count;
					this.openKey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (pf$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.pf cannot be set twice.');
					}
					++pf$count;
					this.pf = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (pf_key$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.pfKey cannot be set twice.');
					}
					++pf_key$count;
					this.pfKey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (ip$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.ip cannot be set twice.');
					}
					++ip$count;
					this.ip = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (invkey$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.invkey cannot be set twice.');
					}
					++invkey$count;
					this.invkey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (itime$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.itime cannot be set twice.');
					}
					++itime$count;
					this.itime = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (iopenid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.iopenid cannot be set twice.');
					}
					++iopenid$count;
					this.iopenid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 11:
					if (free_gift_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetRoleListReq.freeGiftId cannot be set twice.');
					}
					++free_gift_id$count;
					this.freeGiftId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
