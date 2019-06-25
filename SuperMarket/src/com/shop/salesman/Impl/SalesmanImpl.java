package com.shop.salesman.Impl;

import java.util.Scanner;

import org.junit.Test;

import com.shop.Controller.goods;
import com.shop.Controller.Impl.ControllerImpl;
import com.shop.Controller.Impl.goodsImpl;
import com.shop.entity.User;
import com.shop.salesman.BuyGoods;
import com.shop.salesman.Salesman;

public class SalesmanImpl implements Salesman {

	// 销售界面
	public void operate(User u) {
		System.out.println("------可以进行的操作---------");
		while (true) {
			System.out.println("1.个人信息修改(包括密码修改)");
			System.out.println("2.销售管理");
			System.out.println("3.退出当前系统");

			System.out.println("---------请选择操作---------");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			switch (change) {
			case "1":
				System.out.println("你的用户名是：" + u.getUsername());
				System.out.println("你的密码是：" + u.getUsername());
				System.out.println("你的密码是：" + u.getUserroot());

				String message;
				while (true) {
					System.out.println("你要修改的一项是什么");
					message = sc.nextLine();
					if (message.equals("user") || message.equals("password") || message.equals("power")) {
						System.out.println("你要修改的是" + message);
						break;
					} else {
						System.out.println("输入错误，只能输入user或者password或者power");
					}
				}

				System.out.println("改成什么");
				String mess = sc.nextLine();
				ControllerImpl c1 = new ControllerImpl();
				c1.change(u, message, mess);
				break;

			case "2":
				sell(u);
				break;

			case "3":
				System.out.println("成功由销售员界面退出");
				System.exit(1);
				break;

			default:
				System.out.println("输入错误，请重新选择功能");
				break;
			}
		}
	}

	// 销售管理
	// @Test
	@Override
	public void sell(User u) {
		while (true) {
			System.out.println();
			System.out.println("---------销售管理---------");
			System.out.println("1.添加销售商品");
			System.out.println("2.删除销售商品");
			System.out.println("3.结账按钮");
			System.out.println("4.退出系统");

			goods g = new goodsImpl();
			g.find(u);

			System.out.println("请选择你要的功能：");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();

			goodsImpl g2 = new goodsImpl();
			BuyGoods bg = new BuyGoodsImpl();
			BuyGoodsImpl bgi = new BuyGoodsImpl();

			switch (change) {
			case "1":
				System.out.println("----添加销售商品----");
				while (true) {
					System.out.println("是否要购买商品");
					String y = sc.nextLine();
					if (y.equals("y")) {
						buy();
					} else if (y.equals("n")) {
						break;
					} else {
						System.out.println("只能输入是（y）或者否（n）");
					}
				}
				break;

			case "2":
				System.out.println("----删除销售商品----");
				String id;
				while (true) {
					System.out.println("请输入你要删除的商品的id");
					id = sc.nextLine();
					if (bgi.have3(id)) {
						System.out.println();
						break;
					} else {
						System.out.println("没有要删除的商品,请重新输入");
					}
				}
				bg.buydelete(id);
				break;

			case "3":
				System.out.println("----结账按钮----");
				if (bg.buysale()) {
					System.out.println("输入y或者yes结账，否则不结账");
					String check = sc.nextLine();
					if (check.equals("y") || check.equals("yes")) {
						bgi.buysale2();
						System.out.println("谢谢购买，下次再来");
						System.out.println();
						break;
					} else {
						System.out.println("还没有结账，你可以再挑挑看");
						g.find(u);
						System.out.println();
						break;
					}
				} else {
					break;
				}

			case "4":
				System.out.println("退出后，订单将不保存，是否退出");
				System.out.println("输入y或者yes退出，否则不退出");
				String check2 = sc.nextLine();
				if (check2.equals("y") || check2.equals("yes")) {
					bgi.biaoDelete();
					System.out.println("销售管理页面退出成功");
					System.exit(1);

				} else {
					System.out.println("还没有退出，你可以再操作");
					break;
				}

			default:
				System.out.println("输入功能选择错误");
				break;
			}
		}
	}

	// 购买商品
	public void buy() {

		BuyGoods bg = new BuyGoodsImpl();
		Scanner sc = new Scanner(System.in);
		goodsImpl g2 = new goodsImpl();

		System.out.println("请输入商品编号(id)");
		String id;
		while (true) {
			id = sc.nextLine();
			String regex = "[0-9]{1,4}";
			if (id.matches(regex)) {
				System.out.println("你输入的商品的编号是" + id);
				if (g2.have(id)) {
					break;
				} else {
					System.out.println("对不起，暂时没有这件商品，请联系管理员添加");
					System.out.println("请重新输入商品编号");
				}
			} else {
				System.out.println("输入商品编号格式不正确,重新输入");
			}
		}

		System.out.println("请输入商品数量");

		String fullNumber;
		while (true) {
			fullNumber = sc.nextLine();
			String regex = "[0-9]{1,3}";
			if (fullNumber.matches(regex)) {
				if (Integer.parseInt(fullNumber) > 0) {
					System.out.println("你输入的商品的数量是" + fullNumber);
					if (g2.have2(id, fullNumber)) {
						break;
					}
				} else {
					System.out.println("输入商品数量要大于不等于0,重新输入");
				}
			} else {
				System.out.println("输入商品数量格式不正确,重新输入");
			}
		}

		bg.buyadd(id, fullNumber);
	}

}
