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
	public dynamic final class EnterArenaRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RAND_BULLET_SEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.cs.EnterArenaRes.rand_bullet_seed", "randBulletSeed", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rand_bullet_seed$field:uint;

		private var hasField$0:uint = 0;

		public function clearRandBulletSeed():void {
			hasField$0 &= 0xfffffffe;
			rand_bullet_seed$field = new uint();
		}

		public function get hasRandBulletSeed():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set randBulletSeed(value:uint):void {
			hasField$0 |= 0x1;
			rand_bullet_seed$field = value;
		}

		public function get randBulletSeed():uint {
			return rand_bullet_seed$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRandBulletSeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, rand_bullet_seed$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rand_bullet_seed$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rand_bullet_seed$count != 0) {
						throw new flash.errors.IOError('Bad data format: EnterArenaRes.randBulletSeed cannot be set twice.');
					}
					++rand_bullet_seed$count;
					this.randBulletSeed = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
