package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.KickOffRes;
	import proto.cs.SignZoneIpRes;
	import proto.cs.KickOffReq;
	import proto.cs.SignRes;
	import proto.cs.SignReq;
	import proto.cs.SignZoneIpReq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AuthBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SIGN_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AuthBody.sign_req", "signReq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SignReq; });

		private var sign_req$field:proto.cs.SignReq;

		public function clearSignReq():void {
			sign_req$field = null;
		}

		public function get hasSignReq():Boolean {
			return sign_req$field != null;
		}

		public function set signReq(value:proto.cs.SignReq):void {
			sign_req$field = value;
		}

		public function get signReq():proto.cs.SignReq {
			return sign_req$field;
		}

		/**
		 *  @private
		 */
		public static const SIGN_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AuthBody.sign_res", "signRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SignRes; });

		private var sign_res$field:proto.cs.SignRes;

		public function clearSignRes():void {
			sign_res$field = null;
		}

		public function get hasSignRes():Boolean {
			return sign_res$field != null;
		}

		public function set signRes(value:proto.cs.SignRes):void {
			sign_res$field = value;
		}

		public function get signRes():proto.cs.SignRes {
			return sign_res$field;
		}

		/**
		 *  @private
		 */
		public static const SIGN_ZONE_IP_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AuthBody.sign_zone_ip_req", "signZoneIpReq", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SignZoneIpReq; });

		private var sign_zone_ip_req$field:proto.cs.SignZoneIpReq;

		public function clearSignZoneIpReq():void {
			sign_zone_ip_req$field = null;
		}

		public function get hasSignZoneIpReq():Boolean {
			return sign_zone_ip_req$field != null;
		}

		public function set signZoneIpReq(value:proto.cs.SignZoneIpReq):void {
			sign_zone_ip_req$field = value;
		}

		public function get signZoneIpReq():proto.cs.SignZoneIpReq {
			return sign_zone_ip_req$field;
		}

		/**
		 *  @private
		 */
		public static const SIGN_ZONE_IP_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AuthBody.sign_zone_ip_res", "signZoneIpRes", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SignZoneIpRes; });

		private var sign_zone_ip_res$field:proto.cs.SignZoneIpRes;

		public function clearSignZoneIpRes():void {
			sign_zone_ip_res$field = null;
		}

		public function get hasSignZoneIpRes():Boolean {
			return sign_zone_ip_res$field != null;
		}

		public function set signZoneIpRes(value:proto.cs.SignZoneIpRes):void {
			sign_zone_ip_res$field = value;
		}

		public function get signZoneIpRes():proto.cs.SignZoneIpRes {
			return sign_zone_ip_res$field;
		}

		/**
		 *  @private
		 */
		public static const KICK_OFF_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AuthBody.kick_off_req", "kickOffReq", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.KickOffReq; });

		private var kick_off_req$field:proto.cs.KickOffReq;

		public function clearKickOffReq():void {
			kick_off_req$field = null;
		}

		public function get hasKickOffReq():Boolean {
			return kick_off_req$field != null;
		}

		public function set kickOffReq(value:proto.cs.KickOffReq):void {
			kick_off_req$field = value;
		}

		public function get kickOffReq():proto.cs.KickOffReq {
			return kick_off_req$field;
		}

		/**
		 *  @private
		 */
		public static const KICK_OFF_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.AuthBody.kick_off_res", "kickOffRes", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.KickOffRes; });

		private var kick_off_res$field:proto.cs.KickOffRes;

		public function clearKickOffRes():void {
			kick_off_res$field = null;
		}

		public function get hasKickOffRes():Boolean {
			return kick_off_res$field != null;
		}

		public function set kickOffRes(value:proto.cs.KickOffRes):void {
			kick_off_res$field = value;
		}

		public function get kickOffRes():proto.cs.KickOffRes {
			return kick_off_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSignReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sign_req$field);
			}
			if (hasSignRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sign_res$field);
			}
			if (hasSignZoneIpReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sign_zone_ip_req$field);
			}
			if (hasSignZoneIpRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sign_zone_ip_res$field);
			}
			if (hasKickOffReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kick_off_req$field);
			}
			if (hasKickOffRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kick_off_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sign_req$count:uint = 0;
			var sign_res$count:uint = 0;
			var sign_zone_ip_req$count:uint = 0;
			var sign_zone_ip_res$count:uint = 0;
			var kick_off_req$count:uint = 0;
			var kick_off_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sign_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: AuthBody.signReq cannot be set twice.');
					}
					++sign_req$count;
					this.signReq = new proto.cs.SignReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.signReq);
					break;
				case 2:
					if (sign_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AuthBody.signRes cannot be set twice.');
					}
					++sign_res$count;
					this.signRes = new proto.cs.SignRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.signRes);
					break;
				case 3:
					if (sign_zone_ip_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: AuthBody.signZoneIpReq cannot be set twice.');
					}
					++sign_zone_ip_req$count;
					this.signZoneIpReq = new proto.cs.SignZoneIpReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.signZoneIpReq);
					break;
				case 4:
					if (sign_zone_ip_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AuthBody.signZoneIpRes cannot be set twice.');
					}
					++sign_zone_ip_res$count;
					this.signZoneIpRes = new proto.cs.SignZoneIpRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.signZoneIpRes);
					break;
				case 5:
					if (kick_off_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: AuthBody.kickOffReq cannot be set twice.');
					}
					++kick_off_req$count;
					this.kickOffReq = new proto.cs.KickOffReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kickOffReq);
					break;
				case 6:
					if (kick_off_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AuthBody.kickOffRes cannot be set twice.');
					}
					++kick_off_res$count;
					this.kickOffRes = new proto.cs.KickOffRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kickOffRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
