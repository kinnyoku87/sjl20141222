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
	public dynamic final class AcceptFriendNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_AGREE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.AcceptFriendNtf.is_agree", "isAgree", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_agree$field:uint;

		private var hasField$0:uint = 0;

		public function clearIsAgree():void {
			hasField$0 &= 0xfffffffe;
			is_agree$field = new uint();
		}

		public function get hasIsAgree():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isAgree(value:uint):void {
			hasField$0 |= 0x1;
			is_agree$field = value;
		}

		public function get isAgree():uint {
			return is_agree$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.AcceptFriendNtf.accept_role_id", "acceptRoleId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accept_role_id$field:UInt64;

		public function clearAcceptRoleId():void {
			accept_role_id$field = null;
		}

		public function get hasAcceptRoleId():Boolean {
			return accept_role_id$field != null;
		}

		public function set acceptRoleId(value:UInt64):void {
			accept_role_id$field = value;
		}

		public function get acceptRoleId():UInt64 {
			return accept_role_id$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.AcceptFriendNtf.accept_name", "acceptName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var accept_name$field:String;

		public function clearAcceptName():void {
			accept_name$field = null;
		}

		public function get hasAcceptName():Boolean {
			return accept_name$field != null;
		}

		public function set acceptName(value:String):void {
			accept_name$field = value;
		}

		public function get acceptName():String {
			return accept_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsAgree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, is_agree$field);
			}
			if (hasAcceptRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, accept_role_id$field);
			}
			if (hasAcceptName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, accept_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_agree$count:uint = 0;
			var accept_role_id$count:uint = 0;
			var accept_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_agree$count != 0) {
						throw new flash.errors.IOError('Bad data format: AcceptFriendNtf.isAgree cannot be set twice.');
					}
					++is_agree$count;
					this.isAgree = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (accept_role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AcceptFriendNtf.acceptRoleId cannot be set twice.');
					}
					++accept_role_id$count;
					this.acceptRoleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (accept_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: AcceptFriendNtf.acceptName cannot be set twice.');
					}
					++accept_name$count;
					this.acceptName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
