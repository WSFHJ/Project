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

	// ���۽���
	public void operate(User u) {
		System.out.println("------���Խ��еĲ���---------");
		while (true) {
			System.out.println("1.������Ϣ�޸�(���������޸�)");
			System.out.println("2.���۹���");
			System.out.println("3.�˳���ǰϵͳ");

			System.out.println("---------��ѡ�����---------");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			switch (change) {
			case "1":
				System.out.println("����û����ǣ�" + u.getUsername());
				System.out.println("��������ǣ�" + u.getUsername());
				System.out.println("��������ǣ�" + u.getUserroot());

				String message;
				while (true) {
					System.out.println("��Ҫ�޸ĵ�һ����ʲô");
					message = sc.nextLine();
					if (message.equals("user") || message.equals("password") || message.equals("power")) {
						System.out.println("��Ҫ�޸ĵ���" + message);
						break;
					} else {
						System.out.println("�������ֻ������user����password����power");
					}
				}

				System.out.println("�ĳ�ʲô");
				String mess = sc.nextLine();
				ControllerImpl c1 = new ControllerImpl();
				c1.change(u, message, mess);
				break;

			case "2":
				sell(u);
				break;

			case "3":
				System.out.println("�ɹ�������Ա�����˳�");
				System.exit(1);
				break;

			default:
				System.out.println("�������������ѡ����");
				break;
			}
		}
	}

	// ���۹���
	// @Test
	@Override
	public void sell(User u) {
		while (true) {
			System.out.println();
			System.out.println("---------���۹���---------");
			System.out.println("1.���������Ʒ");
			System.out.println("2.ɾ��������Ʒ");
			System.out.println("3.���˰�ť");
			System.out.println("4.�˳�ϵͳ");

			goods g = new goodsImpl();
			g.find(u);

			System.out.println("��ѡ����Ҫ�Ĺ��ܣ�");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();

			goodsImpl g2 = new goodsImpl();
			BuyGoods bg = new BuyGoodsImpl();
			BuyGoodsImpl bgi = new BuyGoodsImpl();

			switch (change) {
			case "1":
				System.out.println("----���������Ʒ----");
				while (true) {
					System.out.println("�Ƿ�Ҫ������Ʒ");
					String y = sc.nextLine();
					if (y.equals("y")) {
						buy();
					} else if (y.equals("n")) {
						break;
					} else {
						System.out.println("ֻ�������ǣ�y�����߷�n��");
					}
				}
				break;

			case "2":
				System.out.println("----ɾ��������Ʒ----");
				String id;
				while (true) {
					System.out.println("��������Ҫɾ������Ʒ��id");
					id = sc.nextLine();
					if (bgi.have3(id)) {
						System.out.println();
						break;
					} else {
						System.out.println("û��Ҫɾ������Ʒ,����������");
					}
				}
				bg.buydelete(id);
				break;

			case "3":
				System.out.println("----���˰�ť----");
				if (bg.buysale()) {
					System.out.println("����y����yes���ˣ����򲻽���");
					String check = sc.nextLine();
					if (check.equals("y") || check.equals("yes")) {
						bgi.buysale2();
						System.out.println("лл�����´�����");
						System.out.println();
						break;
					} else {
						System.out.println("��û�н��ˣ��������������");
						g.find(u);
						System.out.println();
						break;
					}
				} else {
					break;
				}

			case "4":
				System.out.println("�˳��󣬶����������棬�Ƿ��˳�");
				System.out.println("����y����yes�˳��������˳�");
				String check2 = sc.nextLine();
				if (check2.equals("y") || check2.equals("yes")) {
					bgi.biaoDelete();
					System.out.println("���۹���ҳ���˳��ɹ�");
					System.exit(1);

				} else {
					System.out.println("��û���˳���������ٲ���");
					break;
				}

			default:
				System.out.println("���빦��ѡ�����");
				break;
			}
		}
	}

	// ������Ʒ
	public void buy() {

		BuyGoods bg = new BuyGoodsImpl();
		Scanner sc = new Scanner(System.in);
		goodsImpl g2 = new goodsImpl();

		System.out.println("��������Ʒ���(id)");
		String id;
		while (true) {
			id = sc.nextLine();
			String regex = "[0-9]{1,4}";
			if (id.matches(regex)) {
				System.out.println("���������Ʒ�ı����" + id);
				if (g2.have(id)) {
					break;
				} else {
					System.out.println("�Բ�����ʱû�������Ʒ������ϵ����Ա���");
					System.out.println("������������Ʒ���");
				}
			} else {
				System.out.println("������Ʒ��Ÿ�ʽ����ȷ,��������");
			}
		}

		System.out.println("��������Ʒ����");

		String fullNumber;
		while (true) {
			fullNumber = sc.nextLine();
			String regex = "[0-9]{1,3}";
			if (fullNumber.matches(regex)) {
				if (Integer.parseInt(fullNumber) > 0) {
					System.out.println("���������Ʒ��������" + fullNumber);
					if (g2.have2(id, fullNumber)) {
						break;
					}
				} else {
					System.out.println("������Ʒ����Ҫ���ڲ�����0,��������");
				}
			} else {
				System.out.println("������Ʒ������ʽ����ȷ,��������");
			}
		}

		bg.buyadd(id, fullNumber);
	}

}
