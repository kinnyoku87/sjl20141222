package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.GetRoleRes;
	import proto.cs.GetRoleIdRes;
	import proto.cs.GetRoleListReq;
	import proto.cs.GetRoleListRes;
	import proto.cs.GetRoleReq;
	import proto.cs.RoleVerificateRes;
	import proto.cs.GetSimpleRoleRes;
	import proto.cs.CreateRoleRes;
	import proto.cs.GetSimpleRoleReq;
	import proto.cs.RoleVerificateReq;
	import proto.cs.CreateRoleReq;
	import proto.cs.GetRoleIdReq;
	import proto.cs.RoleAttrNtf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoleBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GET_ROLE_LIST_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_role_list_req", "getRoleListReq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetRoleListReq; });

		private var get_role_list_req$field:proto.cs.GetRoleListReq;

		public function clearGetRoleListReq():void {
			get_role_list_req$field = null;
		}

		public function get hasGetRoleListReq():Boolean {
			return get_role_list_req$field != null;
		}

		public function set getRoleListReq(value:proto.cs.GetRoleListReq):void {
			get_role_list_req$field = value;
		}

		public function get getRoleListReq():proto.cs.GetRoleListReq {
			return get_role_list_req$field;
		}

		/**
		 *  @private
		 */
		public static const GET_ROLE_LIST_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_role_list_res", "getRoleListRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetRoleListRes; });

		private var get_role_list_res$field:proto.cs.GetRoleListRes;

		public function clearGetRoleListRes():void {
			get_role_list_res$field = null;
		}

		public function get hasGetRoleListRes():Boolean {
			return get_role_list_res$field != null;
		}

		public function set getRoleListRes(value:proto.cs.GetRoleListRes):void {
			get_role_list_res$field = value;
		}

		public function get getRoleListRes():proto.cs.GetRoleListRes {
			return get_role_list_res$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_ROLE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.create_role_req", "createRoleReq", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CreateRoleReq; });

		private var create_role_req$field:proto.cs.CreateRoleReq;

		public function clearCreateRoleReq():void {
			create_role_req$field = null;
		}

		public function get hasCreateRoleReq():Boolean {
			return create_role_req$field != null;
		}

		public function set createRoleReq(value:proto.cs.CreateRoleReq):void {
			create_role_req$field = value;
		}

		public function get createRoleReq():proto.cs.CreateRoleReq {
			return create_role_req$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_ROLE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.create_role_res", "createRoleRes", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CreateRoleRes; });

		private var create_role_res$field:proto.cs.CreateRoleRes;

		public function clearCreateRoleRes():void {
			create_role_res$field = null;
		}

		public function get hasCreateRoleRes():Boolean {
			return create_role_res$field != null;
		}

		public function set createRoleRes(value:proto.cs.CreateRoleRes):void {
			create_role_res$field = value;
		}

		public function get createRoleRes():proto.cs.CreateRoleRes {
			return create_role_res$field;
		}

		/**
		 *  @private
		 */
		public static const GET_ROLE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_role_req", "getRoleReq", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetRoleReq; });

		private var get_role_req$field:proto.cs.GetRoleReq;

		public function clearGetRoleReq():void {
			get_role_req$field = null;
		}

		public function get hasGetRoleReq():Boolean {
			return get_role_req$field != null;
		}

		public function set getRoleReq(value:proto.cs.GetRoleReq):void {
			get_role_req$field = value;
		}

		public function get getRoleReq():proto.cs.GetRoleReq {
			return get_role_req$field;
		}

		/**
		 *  @private
		 */
		public static const GET_ROLE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_role_res", "getRoleRes", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetRoleRes; });

		private var get_role_res$field:proto.cs.GetRoleRes;

		public function clearGetRoleRes():void {
			get_role_res$field = null;
		}

		public function get hasGetRoleRes():Boolean {
			return get_role_res$field != null;
		}

		public function set getRoleRes(value:proto.cs.GetRoleRes):void {
			get_role_res$field = value;
		}

		public function get getRoleRes():proto.cs.GetRoleRes {
			return get_role_res$field;
		}

		/**
		 *  @private
		 */
		public static const GET_SIMPLE_ROLE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_simple_role_req", "getSimpleRoleReq", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetSimpleRoleReq; });

		private var get_simple_role_req$field:proto.cs.GetSimpleRoleReq;

		public function clearGetSimpleRoleReq():void {
			get_simple_role_req$field = null;
		}

		public function get hasGetSimpleRoleReq():Boolean {
			return get_simple_role_req$field != null;
		}

		public function set getSimpleRoleReq(value:proto.cs.GetSimpleRoleReq):void {
			get_simple_role_req$field = value;
		}

		public function get getSimpleRoleReq():proto.cs.GetSimpleRoleReq {
			return get_simple_role_req$field;
		}

		/**
		 *  @private
		 */
		public static const GET_SIMPLE_ROLE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_simple_role_res", "getSimpleRoleRes", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetSimpleRoleRes; });

		private var get_simple_role_res$field:proto.cs.GetSimpleRoleRes;

		public function clearGetSimpleRoleRes():void {
			get_simple_role_res$field = null;
		}

		public function get hasGetSimpleRoleRes():Boolean {
			return get_simple_role_res$field != null;
		}

		public function set getSimpleRoleRes(value:proto.cs.GetSimpleRoleRes):void {
			get_simple_role_res$field = value;
		}

		public function get getSimpleRoleRes():proto.cs.GetSimpleRoleRes {
			return get_simple_role_res$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_ATTR_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.role_attr_ntf", "roleAttrNtf", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleAttrNtf; });

		private var role_attr_ntf$field:proto.cs.RoleAttrNtf;

		public function clearRoleAttrNtf():void {
			role_attr_ntf$field = null;
		}

		public function get hasRoleAttrNtf():Boolean {
			return role_attr_ntf$field != null;
		}

		public function set roleAttrNtf(value:proto.cs.RoleAttrNtf):void {
			role_attr_ntf$field = value;
		}

		public function get roleAttrNtf():proto.cs.RoleAttrNtf {
			return role_attr_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GET_ROLE_ID_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_role_id_req", "getRoleIdReq", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetRoleIdReq; });

		private var get_role_id_req$field:proto.cs.GetRoleIdReq;

		public function clearGetRoleIdReq():void {
			get_role_id_req$field = null;
		}

		public function get hasGetRoleIdReq():Boolean {
			return get_role_id_req$field != null;
		}

		public function set getRoleIdReq(value:proto.cs.GetRoleIdReq):void {
			get_role_id_req$field = value;
		}

		public function get getRoleIdReq():proto.cs.GetRoleIdReq {
			return get_role_id_req$field;
		}

		/**
		 *  @private
		 */
		public static const GET_ROLE_ID_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.get_role_id_res", "getRoleIdRes", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetRoleIdRes; });

		private var get_role_id_res$field:proto.cs.GetRoleIdRes;

		public function clearGetRoleIdRes():void {
			get_role_id_res$field = null;
		}

		public function get hasGetRoleIdRes():Boolean {
			return get_role_id_res$field != null;
		}

		public function set getRoleIdRes(value:proto.cs.GetRoleIdRes):void {
			get_role_id_res$field = value;
		}

		public function get getRoleIdRes():proto.cs.GetRoleIdRes {
			return get_role_id_res$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_VERIFICATE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.role_verificate_req", "roleVerificateReq", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleVerificateReq; });

		private var role_verificate_req$field:proto.cs.RoleVerificateReq;

		public function clearRoleVerificateReq():void {
			role_verificate_req$field = null;
		}

		public function get hasRoleVerificateReq():Boolean {
			return role_verificate_req$field != null;
		}

		public function set roleVerificateReq(value:proto.cs.RoleVerificateReq):void {
			role_verificate_req$field = value;
		}

		public function get roleVerificateReq():proto.cs.RoleVerificateReq {
			return role_verificate_req$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_VERIFICATE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoleBody.role_verificate_res", "roleVerificateRes", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleVerificateRes; });

		private var role_verificate_res$field:proto.cs.RoleVerificateRes;

		public function clearRoleVerificateRes():void {
			role_verificate_res$field = null;
		}

		public function get hasRoleVerificateRes():Boolean {
			return role_verificate_res$field != null;
		}

		public function set roleVerificateRes(value:proto.cs.RoleVerificateRes):void {
			role_verificate_res$field = value;
		}

		public function get roleVerificateRes():proto.cs.RoleVerificateRes {
			return role_verificate_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGetRoleListReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_role_list_req$field);
			}
			if (hasGetRoleListRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_role_list_res$field);
			}
			if (hasCreateRoleReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, create_role_req$field);
			}
			if (hasCreateRoleRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, create_role_res$field);
			}
			if (hasGetRoleReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_role_req$field);
			}
			if (hasGetRoleRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_role_res$field);
			}
			if (hasGetSimpleRoleReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_simple_role_req$field);
			}
			if (hasGetSimpleRoleRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_simple_role_res$field);
			}
			if (hasRoleAttrNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_attr_ntf$field);
			}
			if (hasGetRoleIdReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_role_id_req$field);
			}
			if (hasGetRoleIdRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_role_id_res$field);
			}
			if (hasRoleVerificateReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_verificate_req$field);
			}
			if (hasRoleVerificateRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_verificate_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var get_role_list_req$count:uint = 0;
			var get_role_list_res$count:uint = 0;
			var create_role_req$count:uint = 0;
			var create_role_res$count:uint = 0;
			var get_role_req$count:uint = 0;
			var get_role_res$count:uint = 0;
			var get_simple_role_req$count:uint = 0;
			var get_simple_role_res$count:uint = 0;
			var role_attr_ntf$count:uint = 0;
			var get_role_id_req$count:uint = 0;
			var get_role_id_res$count:uint = 0;
			var role_verificate_req$count:uint = 0;
			var role_verificate_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (get_role_list_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getRoleListReq cannot be set twice.');
					}
					++get_role_list_req$count;
					this.getRoleListReq = new proto.cs.GetRoleListReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getRoleListReq);
					break;
				case 2:
					if (get_role_list_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getRoleListRes cannot be set twice.');
					}
					++get_role_list_res$count;
					this.getRoleListRes = new proto.cs.GetRoleListRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getRoleListRes);
					break;
				case 3:
					if (create_role_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.createRoleReq cannot be set twice.');
					}
					++create_role_req$count;
					this.createRoleReq = new proto.cs.CreateRoleReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.createRoleReq);
					break;
				case 4:
					if (create_role_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.createRoleRes cannot be set twice.');
					}
					++create_role_res$count;
					this.createRoleRes = new proto.cs.CreateRoleRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.createRoleRes);
					break;
				case 5:
					if (get_role_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getRoleReq cannot be set twice.');
					}
					++get_role_req$count;
					this.getRoleReq = new proto.cs.GetRoleReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getRoleReq);
					break;
				case 6:
					if (get_role_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getRoleRes cannot be set twice.');
					}
					++get_role_res$count;
					this.getRoleRes = new proto.cs.GetRoleRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getRoleRes);
					break;
				case 7:
					if (get_simple_role_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getSimpleRoleReq cannot be set twice.');
					}
					++get_simple_role_req$count;
					this.getSimpleRoleReq = new proto.cs.GetSimpleRoleReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getSimpleRoleReq);
					break;
				case 8:
					if (get_simple_role_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getSimpleRoleRes cannot be set twice.');
					}
					++get_simple_role_res$count;
					this.getSimpleRoleRes = new proto.cs.GetSimpleRoleRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getSimpleRoleRes);
					break;
				case 9:
					if (role_attr_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.roleAttrNtf cannot be set twice.');
					}
					++role_attr_ntf$count;
					this.roleAttrNtf = new proto.cs.RoleAttrNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleAttrNtf);
					break;
				case 10:
					if (get_role_id_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getRoleIdReq cannot be set twice.');
					}
					++get_role_id_req$count;
					this.getRoleIdReq = new proto.cs.GetRoleIdReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getRoleIdReq);
					break;
				case 11:
					if (get_role_id_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.getRoleIdRes cannot be set twice.');
					}
					++get_role_id_res$count;
					this.getRoleIdRes = new proto.cs.GetRoleIdRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getRoleIdRes);
					break;
				case 12:
					if (role_verificate_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.roleVerificateReq cannot be set twice.');
					}
					++role_verificate_req$count;
					this.roleVerificateReq = new proto.cs.RoleVerificateReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleVerificateReq);
					break;
				case 13:
					if (role_verificate_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleBody.roleVerificateRes cannot be set twice.');
					}
					++role_verificate_res$count;
					this.roleVerificateRes = new proto.cs.RoleVerificateRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleVerificateRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
