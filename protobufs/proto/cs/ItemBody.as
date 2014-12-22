package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.ConfirmBoxReq;
	import proto.cs.MysticalBoxOpenReq;
	import proto.cs.RemoveCoolTime;
	import proto.cs.MysticalBoxOpenRes;
	import proto.cs.AddItemNtf;
	import proto.cs.UseItemReq;
	import proto.cs.ItemShopGetLimitListRes;
	import proto.cs.ConfirmBoxRes;
	import proto.cs.UseItemRes;
	import proto.cs.TXBuyGoodsNtf;
	import proto.cs.GetItemRes;
	import proto.cs.AddCoolTime;
	import proto.cs.DropItemReq;
	import proto.cs.GetOtherCardNtf;
	import proto.cs.ItemUpdateNtf;
	import proto.cs.ItemRemoveNtf;
	import proto.cs.GetBalanceRes;
	import proto.cs.ItemShopBuyReq;
	import proto.cs.ItemShopBuyRes;
	import proto.cs.SaleItemReq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ItemBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GET_ITEM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.get_item_res", "getItemRes", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetItemRes; });

		private var get_item_res$field:proto.cs.GetItemRes;

		public function clearGetItemRes():void {
			get_item_res$field = null;
		}

		public function get hasGetItemRes():Boolean {
			return get_item_res$field != null;
		}

		public function set getItemRes(value:proto.cs.GetItemRes):void {
			get_item_res$field = value;
		}

		public function get getItemRes():proto.cs.GetItemRes {
			return get_item_res$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_ITEM_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.add_item_ntf", "addItemNtf", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AddItemNtf; });

		private var add_item_ntf$field:proto.cs.AddItemNtf;

		public function clearAddItemNtf():void {
			add_item_ntf$field = null;
		}

		public function get hasAddItemNtf():Boolean {
			return add_item_ntf$field != null;
		}

		public function set addItemNtf(value:proto.cs.AddItemNtf):void {
			add_item_ntf$field = value;
		}

		public function get addItemNtf():proto.cs.AddItemNtf {
			return add_item_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const USE_ITEM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.use_item_req", "useItemReq", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.UseItemReq; });

		private var use_item_req$field:proto.cs.UseItemReq;

		public function clearUseItemReq():void {
			use_item_req$field = null;
		}

		public function get hasUseItemReq():Boolean {
			return use_item_req$field != null;
		}

		public function set useItemReq(value:proto.cs.UseItemReq):void {
			use_item_req$field = value;
		}

		public function get useItemReq():proto.cs.UseItemReq {
			return use_item_req$field;
		}

		/**
		 *  @private
		 */
		public static const USE_ITEM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.use_item_res", "useItemRes", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.UseItemRes; });

		private var use_item_res$field:proto.cs.UseItemRes;

		public function clearUseItemRes():void {
			use_item_res$field = null;
		}

		public function get hasUseItemRes():Boolean {
			return use_item_res$field != null;
		}

		public function set useItemRes(value:proto.cs.UseItemRes):void {
			use_item_res$field = value;
		}

		public function get useItemRes():proto.cs.UseItemRes {
			return use_item_res$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_ITEM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.drop_item_req", "dropItemReq", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.DropItemReq; });

		private var drop_item_req$field:proto.cs.DropItemReq;

		public function clearDropItemReq():void {
			drop_item_req$field = null;
		}

		public function get hasDropItemReq():Boolean {
			return drop_item_req$field != null;
		}

		public function set dropItemReq(value:proto.cs.DropItemReq):void {
			drop_item_req$field = value;
		}

		public function get dropItemReq():proto.cs.DropItemReq {
			return drop_item_req$field;
		}

		/**
		 *  @private
		 */
		public static const SALE_ITEM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.sale_item_req", "saleItemReq", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SaleItemReq; });

		private var sale_item_req$field:proto.cs.SaleItemReq;

		public function clearSaleItemReq():void {
			sale_item_req$field = null;
		}

		public function get hasSaleItemReq():Boolean {
			return sale_item_req$field != null;
		}

		public function set saleItemReq(value:proto.cs.SaleItemReq):void {
			sale_item_req$field = value;
		}

		public function get saleItemReq():proto.cs.SaleItemReq {
			return sale_item_req$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_REMOVE_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.item_remove_ntf", "itemRemoveNtf", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ItemRemoveNtf; });

		private var item_remove_ntf$field:proto.cs.ItemRemoveNtf;

		public function clearItemRemoveNtf():void {
			item_remove_ntf$field = null;
		}

		public function get hasItemRemoveNtf():Boolean {
			return item_remove_ntf$field != null;
		}

		public function set itemRemoveNtf(value:proto.cs.ItemRemoveNtf):void {
			item_remove_ntf$field = value;
		}

		public function get itemRemoveNtf():proto.cs.ItemRemoveNtf {
			return item_remove_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_COOL_TIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.add_cool_time", "addCoolTime", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AddCoolTime; });

		private var add_cool_time$field:proto.cs.AddCoolTime;

		public function clearAddCoolTime():void {
			add_cool_time$field = null;
		}

		public function get hasAddCoolTime():Boolean {
			return add_cool_time$field != null;
		}

		public function set addCoolTime(value:proto.cs.AddCoolTime):void {
			add_cool_time$field = value;
		}

		public function get addCoolTime():proto.cs.AddCoolTime {
			return add_cool_time$field;
		}

		/**
		 *  @private
		 */
		public static const REMOVE_TIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.remove_time", "removeTime", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RemoveCoolTime; });

		private var remove_time$field:proto.cs.RemoveCoolTime;

		public function clearRemoveTime():void {
			remove_time$field = null;
		}

		public function get hasRemoveTime():Boolean {
			return remove_time$field != null;
		}

		public function set removeTime(value:proto.cs.RemoveCoolTime):void {
			remove_time$field = value;
		}

		public function get removeTime():proto.cs.RemoveCoolTime {
			return remove_time$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_SHOP_GET_LIMIT_LIST_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.item_shop_get_limit_list_res", "itemShopGetLimitListRes", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ItemShopGetLimitListRes; });

		private var item_shop_get_limit_list_res$field:proto.cs.ItemShopGetLimitListRes;

		public function clearItemShopGetLimitListRes():void {
			item_shop_get_limit_list_res$field = null;
		}

		public function get hasItemShopGetLimitListRes():Boolean {
			return item_shop_get_limit_list_res$field != null;
		}

		public function set itemShopGetLimitListRes(value:proto.cs.ItemShopGetLimitListRes):void {
			item_shop_get_limit_list_res$field = value;
		}

		public function get itemShopGetLimitListRes():proto.cs.ItemShopGetLimitListRes {
			return item_shop_get_limit_list_res$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_SHOP_BUY_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.item_shop_buy_req", "itemShopBuyReq", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ItemShopBuyReq; });

		private var item_shop_buy_req$field:proto.cs.ItemShopBuyReq;

		public function clearItemShopBuyReq():void {
			item_shop_buy_req$field = null;
		}

		public function get hasItemShopBuyReq():Boolean {
			return item_shop_buy_req$field != null;
		}

		public function set itemShopBuyReq(value:proto.cs.ItemShopBuyReq):void {
			item_shop_buy_req$field = value;
		}

		public function get itemShopBuyReq():proto.cs.ItemShopBuyReq {
			return item_shop_buy_req$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_SHOP_BUY_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.item_shop_buy_res", "itemShopBuyRes", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ItemShopBuyRes; });

		private var item_shop_buy_res$field:proto.cs.ItemShopBuyRes;

		public function clearItemShopBuyRes():void {
			item_shop_buy_res$field = null;
		}

		public function get hasItemShopBuyRes():Boolean {
			return item_shop_buy_res$field != null;
		}

		public function set itemShopBuyRes(value:proto.cs.ItemShopBuyRes):void {
			item_shop_buy_res$field = value;
		}

		public function get itemShopBuyRes():proto.cs.ItemShopBuyRes {
			return item_shop_buy_res$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_UPDATE_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.item_update_ntf", "itemUpdateNtf", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ItemUpdateNtf; });

		private var item_update_ntf$field:proto.cs.ItemUpdateNtf;

		public function clearItemUpdateNtf():void {
			item_update_ntf$field = null;
		}

		public function get hasItemUpdateNtf():Boolean {
			return item_update_ntf$field != null;
		}

		public function set itemUpdateNtf(value:proto.cs.ItemUpdateNtf):void {
			item_update_ntf$field = value;
		}

		public function get itemUpdateNtf():proto.cs.ItemUpdateNtf {
			return item_update_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GET_BALANCE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.get_balance_res", "getBalanceRes", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetBalanceRes; });

		private var get_balance_res$field:proto.cs.GetBalanceRes;

		public function clearGetBalanceRes():void {
			get_balance_res$field = null;
		}

		public function get hasGetBalanceRes():Boolean {
			return get_balance_res$field != null;
		}

		public function set getBalanceRes(value:proto.cs.GetBalanceRes):void {
			get_balance_res$field = value;
		}

		public function get getBalanceRes():proto.cs.GetBalanceRes {
			return get_balance_res$field;
		}

		/**
		 *  @private
		 */
		public static const TX_BUY_GOODS_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.tx_buy_goods_ntf", "txBuyGoodsNtf", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.TXBuyGoodsNtf; });

		private var tx_buy_goods_ntf$field:proto.cs.TXBuyGoodsNtf;

		public function clearTxBuyGoodsNtf():void {
			tx_buy_goods_ntf$field = null;
		}

		public function get hasTxBuyGoodsNtf():Boolean {
			return tx_buy_goods_ntf$field != null;
		}

		public function set txBuyGoodsNtf(value:proto.cs.TXBuyGoodsNtf):void {
			tx_buy_goods_ntf$field = value;
		}

		public function get txBuyGoodsNtf():proto.cs.TXBuyGoodsNtf {
			return tx_buy_goods_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GET_OTHER_CARD_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.get_other_card_ntf", "getOtherCardNtf", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetOtherCardNtf; });

		private var get_other_card_ntf$field:proto.cs.GetOtherCardNtf;

		public function clearGetOtherCardNtf():void {
			get_other_card_ntf$field = null;
		}

		public function get hasGetOtherCardNtf():Boolean {
			return get_other_card_ntf$field != null;
		}

		public function set getOtherCardNtf(value:proto.cs.GetOtherCardNtf):void {
			get_other_card_ntf$field = value;
		}

		public function get getOtherCardNtf():proto.cs.GetOtherCardNtf {
			return get_other_card_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const MYSTICAL_BOX_OPEN_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.mystical_box_open_req", "mysticalBoxOpenReq", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MysticalBoxOpenReq; });

		private var mystical_box_open_req$field:proto.cs.MysticalBoxOpenReq;

		public function clearMysticalBoxOpenReq():void {
			mystical_box_open_req$field = null;
		}

		public function get hasMysticalBoxOpenReq():Boolean {
			return mystical_box_open_req$field != null;
		}

		public function set mysticalBoxOpenReq(value:proto.cs.MysticalBoxOpenReq):void {
			mystical_box_open_req$field = value;
		}

		public function get mysticalBoxOpenReq():proto.cs.MysticalBoxOpenReq {
			return mystical_box_open_req$field;
		}

		/**
		 *  @private
		 */
		public static const MYSTICAL_BOX_OPEN_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.mystical_box_open_res", "mysticalBoxOpenRes", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MysticalBoxOpenRes; });

		private var mystical_box_open_res$field:proto.cs.MysticalBoxOpenRes;

		public function clearMysticalBoxOpenRes():void {
			mystical_box_open_res$field = null;
		}

		public function get hasMysticalBoxOpenRes():Boolean {
			return mystical_box_open_res$field != null;
		}

		public function set mysticalBoxOpenRes(value:proto.cs.MysticalBoxOpenRes):void {
			mystical_box_open_res$field = value;
		}

		public function get mysticalBoxOpenRes():proto.cs.MysticalBoxOpenRes {
			return mystical_box_open_res$field;
		}

		/**
		 *  @private
		 */
		public static const CONFIRM_BOX_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.confirm_box_req", "confirmBoxReq", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ConfirmBoxReq; });

		private var confirm_box_req$field:proto.cs.ConfirmBoxReq;

		public function clearConfirmBoxReq():void {
			confirm_box_req$field = null;
		}

		public function get hasConfirmBoxReq():Boolean {
			return confirm_box_req$field != null;
		}

		public function set confirmBoxReq(value:proto.cs.ConfirmBoxReq):void {
			confirm_box_req$field = value;
		}

		public function get confirmBoxReq():proto.cs.ConfirmBoxReq {
			return confirm_box_req$field;
		}

		/**
		 *  @private
		 */
		public static const CONFIRM_BOX_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ItemBody.confirm_box_res", "confirmBoxRes", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ConfirmBoxRes; });

		private var confirm_box_res$field:proto.cs.ConfirmBoxRes;

		public function clearConfirmBoxRes():void {
			confirm_box_res$field = null;
		}

		public function get hasConfirmBoxRes():Boolean {
			return confirm_box_res$field != null;
		}

		public function set confirmBoxRes(value:proto.cs.ConfirmBoxRes):void {
			confirm_box_res$field = value;
		}

		public function get confirmBoxRes():proto.cs.ConfirmBoxRes {
			return confirm_box_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGetItemRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_item_res$field);
			}
			if (hasAddItemNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, add_item_ntf$field);
			}
			if (hasUseItemReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, use_item_req$field);
			}
			if (hasUseItemRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, use_item_res$field);
			}
			if (hasDropItemReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, drop_item_req$field);
			}
			if (hasSaleItemReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, sale_item_req$field);
			}
			if (hasItemRemoveNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item_remove_ntf$field);
			}
			if (hasAddCoolTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, add_cool_time$field);
			}
			if (hasRemoveTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, remove_time$field);
			}
			if (hasItemShopGetLimitListRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item_shop_get_limit_list_res$field);
			}
			if (hasItemShopBuyReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item_shop_buy_req$field);
			}
			if (hasItemShopBuyRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item_shop_buy_res$field);
			}
			if (hasItemUpdateNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item_update_ntf$field);
			}
			if (hasGetBalanceRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_balance_res$field);
			}
			if (hasTxBuyGoodsNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, tx_buy_goods_ntf$field);
			}
			if (hasGetOtherCardNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_other_card_ntf$field);
			}
			if (hasMysticalBoxOpenReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mystical_box_open_req$field);
			}
			if (hasMysticalBoxOpenRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mystical_box_open_res$field);
			}
			if (hasConfirmBoxReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, confirm_box_req$field);
			}
			if (hasConfirmBoxRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, confirm_box_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var get_item_res$count:uint = 0;
			var add_item_ntf$count:uint = 0;
			var use_item_req$count:uint = 0;
			var use_item_res$count:uint = 0;
			var drop_item_req$count:uint = 0;
			var sale_item_req$count:uint = 0;
			var item_remove_ntf$count:uint = 0;
			var add_cool_time$count:uint = 0;
			var remove_time$count:uint = 0;
			var item_shop_get_limit_list_res$count:uint = 0;
			var item_shop_buy_req$count:uint = 0;
			var item_shop_buy_res$count:uint = 0;
			var item_update_ntf$count:uint = 0;
			var get_balance_res$count:uint = 0;
			var tx_buy_goods_ntf$count:uint = 0;
			var get_other_card_ntf$count:uint = 0;
			var mystical_box_open_req$count:uint = 0;
			var mystical_box_open_res$count:uint = 0;
			var confirm_box_req$count:uint = 0;
			var confirm_box_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (get_item_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.getItemRes cannot be set twice.');
					}
					++get_item_res$count;
					this.getItemRes = new proto.cs.GetItemRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getItemRes);
					break;
				case 2:
					if (add_item_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.addItemNtf cannot be set twice.');
					}
					++add_item_ntf$count;
					this.addItemNtf = new proto.cs.AddItemNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.addItemNtf);
					break;
				case 3:
					if (use_item_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.useItemReq cannot be set twice.');
					}
					++use_item_req$count;
					this.useItemReq = new proto.cs.UseItemReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.useItemReq);
					break;
				case 4:
					if (use_item_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.useItemRes cannot be set twice.');
					}
					++use_item_res$count;
					this.useItemRes = new proto.cs.UseItemRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.useItemRes);
					break;
				case 5:
					if (drop_item_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.dropItemReq cannot be set twice.');
					}
					++drop_item_req$count;
					this.dropItemReq = new proto.cs.DropItemReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.dropItemReq);
					break;
				case 6:
					if (sale_item_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.saleItemReq cannot be set twice.');
					}
					++sale_item_req$count;
					this.saleItemReq = new proto.cs.SaleItemReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.saleItemReq);
					break;
				case 7:
					if (item_remove_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.itemRemoveNtf cannot be set twice.');
					}
					++item_remove_ntf$count;
					this.itemRemoveNtf = new proto.cs.ItemRemoveNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.itemRemoveNtf);
					break;
				case 8:
					if (add_cool_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.addCoolTime cannot be set twice.');
					}
					++add_cool_time$count;
					this.addCoolTime = new proto.cs.AddCoolTime();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.addCoolTime);
					break;
				case 9:
					if (remove_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.removeTime cannot be set twice.');
					}
					++remove_time$count;
					this.removeTime = new proto.cs.RemoveCoolTime();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.removeTime);
					break;
				case 14:
					if (item_shop_get_limit_list_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.itemShopGetLimitListRes cannot be set twice.');
					}
					++item_shop_get_limit_list_res$count;
					this.itemShopGetLimitListRes = new proto.cs.ItemShopGetLimitListRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.itemShopGetLimitListRes);
					break;
				case 15:
					if (item_shop_buy_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.itemShopBuyReq cannot be set twice.');
					}
					++item_shop_buy_req$count;
					this.itemShopBuyReq = new proto.cs.ItemShopBuyReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.itemShopBuyReq);
					break;
				case 16:
					if (item_shop_buy_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.itemShopBuyRes cannot be set twice.');
					}
					++item_shop_buy_res$count;
					this.itemShopBuyRes = new proto.cs.ItemShopBuyRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.itemShopBuyRes);
					break;
				case 17:
					if (item_update_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.itemUpdateNtf cannot be set twice.');
					}
					++item_update_ntf$count;
					this.itemUpdateNtf = new proto.cs.ItemUpdateNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.itemUpdateNtf);
					break;
				case 18:
					if (get_balance_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.getBalanceRes cannot be set twice.');
					}
					++get_balance_res$count;
					this.getBalanceRes = new proto.cs.GetBalanceRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getBalanceRes);
					break;
				case 19:
					if (tx_buy_goods_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.txBuyGoodsNtf cannot be set twice.');
					}
					++tx_buy_goods_ntf$count;
					this.txBuyGoodsNtf = new proto.cs.TXBuyGoodsNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.txBuyGoodsNtf);
					break;
				case 20:
					if (get_other_card_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.getOtherCardNtf cannot be set twice.');
					}
					++get_other_card_ntf$count;
					this.getOtherCardNtf = new proto.cs.GetOtherCardNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getOtherCardNtf);
					break;
				case 21:
					if (mystical_box_open_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.mysticalBoxOpenReq cannot be set twice.');
					}
					++mystical_box_open_req$count;
					this.mysticalBoxOpenReq = new proto.cs.MysticalBoxOpenReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mysticalBoxOpenReq);
					break;
				case 22:
					if (mystical_box_open_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.mysticalBoxOpenRes cannot be set twice.');
					}
					++mystical_box_open_res$count;
					this.mysticalBoxOpenRes = new proto.cs.MysticalBoxOpenRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mysticalBoxOpenRes);
					break;
				case 23:
					if (confirm_box_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.confirmBoxReq cannot be set twice.');
					}
					++confirm_box_req$count;
					this.confirmBoxReq = new proto.cs.ConfirmBoxReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.confirmBoxReq);
					break;
				case 24:
					if (confirm_box_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBody.confirmBoxRes cannot be set twice.');
					}
					++confirm_box_res$count;
					this.confirmBoxRes = new proto.cs.ConfirmBoxRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.confirmBoxRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
