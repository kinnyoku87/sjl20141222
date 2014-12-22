package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.AccountLoginRes;
	import proto.cs.AccountLoginReq;
	import proto.cs.LogoutReq;
	import proto.cs.LoginSelectArenaRes;
	import proto.cs.LoginReq;
	import proto.cs.LoginSelectArenaReq;
	import proto.cs.LoginRes;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LoginBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LOGIN_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.login_req", "loginReq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.LoginReq; });

		private var login_req$field:proto.cs.LoginReq;

		public function clearLoginReq():void {
			login_req$field = null;
		}

		public function get hasLoginReq():Boolean {
			return login_req$field != null;
		}

		public function set loginReq(value:proto.cs.LoginReq):void {
			login_req$field = value;
		}

		public function get loginReq():proto.cs.LoginReq {
			return login_req$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.login_res", "loginRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.LoginRes; });

		private var login_res$field:proto.cs.LoginRes;

		public function clearLoginRes():void {
			login_res$field = null;
		}

		public function get hasLoginRes():Boolean {
			return login_res$field != null;
		}

		public function set loginRes(value:proto.cs.LoginRes):void {
			login_res$field = value;
		}

		public function get loginRes():proto.cs.LoginRes {
			return login_res$field;
		}

		/**
		 *  @private
		 */
		public static const LOGOUT_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.logout_req", "logoutReq", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.LogoutReq; });

		private var logout_req$field:proto.cs.LogoutReq;

		public function clearLogoutReq():void {
			logout_req$field = null;
		}

		public function get hasLogoutReq():Boolean {
			return logout_req$field != null;
		}

		public function set logoutReq(value:proto.cs.LogoutReq):void {
			logout_req$field = value;
		}

		public function get logoutReq():proto.cs.LogoutReq {
			return logout_req$field;
		}

		/**
		 *  @private
		 */
		public static const ACCOUNT_LOGIN_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.account_login_req", "accountLoginReq", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AccountLoginReq; });

		private var account_login_req$field:proto.cs.AccountLoginReq;

		public function clearAccountLoginReq():void {
			account_login_req$field = null;
		}

		public function get hasAccountLoginReq():Boolean {
			return account_login_req$field != null;
		}

		public function set accountLoginReq(value:proto.cs.AccountLoginReq):void {
			account_login_req$field = value;
		}

		public function get accountLoginReq():proto.cs.AccountLoginReq {
			return account_login_req$field;
		}

		/**
		 *  @private
		 */
		public static const ACCOUNT_LOGIN_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.account_login_res", "accountLoginRes", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AccountLoginRes; });

		private var account_login_res$field:proto.cs.AccountLoginRes;

		public function clearAccountLoginRes():void {
			account_login_res$field = null;
		}

		public function get hasAccountLoginRes():Boolean {
			return account_login_res$field != null;
		}

		public function set accountLoginRes(value:proto.cs.AccountLoginRes):void {
			account_login_res$field = value;
		}

		public function get accountLoginRes():proto.cs.AccountLoginRes {
			return account_login_res$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_SELECT_ARENA_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.login_select_arena_req", "loginSelectArenaReq", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.LoginSelectArenaReq; });

		private var login_select_arena_req$field:proto.cs.LoginSelectArenaReq;

		public function clearLoginSelectArenaReq():void {
			login_select_arena_req$field = null;
		}

		public function get hasLoginSelectArenaReq():Boolean {
			return login_select_arena_req$field != null;
		}

		public function set loginSelectArenaReq(value:proto.cs.LoginSelectArenaReq):void {
			login_select_arena_req$field = value;
		}

		public function get loginSelectArenaReq():proto.cs.LoginSelectArenaReq {
			return login_select_arena_req$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_SELECT_ARENA_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.LoginBody.login_select_arena_res", "loginSelectArenaRes", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.LoginSelectArenaRes; });

		private var login_select_arena_res$field:proto.cs.LoginSelectArenaRes;

		public function clearLoginSelectArenaRes():void {
			login_select_arena_res$field = null;
		}

		public function get hasLoginSelectArenaRes():Boolean {
			return login_select_arena_res$field != null;
		}

		public function set loginSelectArenaRes(value:proto.cs.LoginSelectArenaRes):void {
			login_select_arena_res$field = value;
		}

		public function get loginSelectArenaRes():proto.cs.LoginSelectArenaRes {
			return login_select_arena_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLoginReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, login_req$field);
			}
			if (hasLoginRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, login_res$field);
			}
			if (hasLogoutReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, logout_req$field);
			}
			if (hasAccountLoginReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, account_login_req$field);
			}
			if (hasAccountLoginRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, account_login_res$field);
			}
			if (hasLoginSelectArenaReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, login_select_arena_req$field);
			}
			if (hasLoginSelectArenaRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, login_select_arena_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var login_req$count:uint = 0;
			var login_res$count:uint = 0;
			var logout_req$count:uint = 0;
			var account_login_req$count:uint = 0;
			var account_login_res$count:uint = 0;
			var login_select_arena_req$count:uint = 0;
			var login_select_arena_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (login_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.loginReq cannot be set twice.');
					}
					++login_req$count;
					this.loginReq = new proto.cs.LoginReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginReq);
					break;
				case 2:
					if (login_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.loginRes cannot be set twice.');
					}
					++login_res$count;
					this.loginRes = new proto.cs.LoginRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginRes);
					break;
				case 3:
					if (logout_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.logoutReq cannot be set twice.');
					}
					++logout_req$count;
					this.logoutReq = new proto.cs.LogoutReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.logoutReq);
					break;
				case 11:
					if (account_login_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.accountLoginReq cannot be set twice.');
					}
					++account_login_req$count;
					this.accountLoginReq = new proto.cs.AccountLoginReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.accountLoginReq);
					break;
				case 12:
					if (account_login_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.accountLoginRes cannot be set twice.');
					}
					++account_login_res$count;
					this.accountLoginRes = new proto.cs.AccountLoginRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.accountLoginRes);
					break;
				case 21:
					if (login_select_arena_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.loginSelectArenaReq cannot be set twice.');
					}
					++login_select_arena_req$count;
					this.loginSelectArenaReq = new proto.cs.LoginSelectArenaReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginSelectArenaReq);
					break;
				case 22:
					if (login_select_arena_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginBody.loginSelectArenaRes cannot be set twice.');
					}
					++login_select_arena_res$count;
					this.loginSelectArenaRes = new proto.cs.LoginSelectArenaRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginSelectArenaRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
