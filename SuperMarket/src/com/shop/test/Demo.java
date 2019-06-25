package com.shop.test;

import java.util.Scanner;

import com.shop.Controller.goods;
import com.shop.Controller.Impl.ControllerImpl;
import com.shop.Controller.Impl.goodsImpl;
import com.shop.UserDao.UserDao;
import com.shop.UserDao.Impl.UserDaoImpl;
import com.shop.entity.User;
import com.shop.salesman.Impl.SalesmanImpl;

public class Demo {
	public static void main(String[] args) {
		System.out.println("--------------��ӭ��������԰���й���ϵͳ----------------");
		while (true) {
			System.out.println("1ע��");
			System.out.println("2��¼");
			System.out.println("3�˳�");

			System.out.println("����������Ҫ���ܵı��:");

			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			switch (change) {
			case "1":
				while (true) {
					System.out.println("��������Ҫע����˺�:");
					String username = sc.nextLine();
					System.out.println("��������Ҫע�������:");
					String userpassword = sc.nextLine();
					System.out.println("����Ա������root������Ա������user: ");
					System.out.println("(���������ַ�,Ĭ��Ϊuser)");
					String userroot = sc.nextLine();

					// ���˺ź������װ�ɶ���
					User u = new User();
					u.setUsername(username);
					u.setUserpassword(userpassword);
					u.setUserroot(userroot);

					UserDaoImpl dao = new UserDaoImpl();
					if (dao.login2(u.getUsername(), u.getUserroot())) {
						System.out.println("�û��Ѵ���,������ע��");
						System.out.println();
					} else {
						dao.regesiter(u);
						System.out.println("ע��ɹ�");
						System.out.println();
						break;
					}
				}

				break;
			case "2":
				System.out.println("��������Ҫ��¼���˺�:");
				String newusername = sc.nextLine();
				System.out.println("��������Ҫ��¼������:");
				String newuserpassword = sc.nextLine();
				System.out.println("����Ա������root������Ա������user: ");
				System.out.println("(���������ַ�,Ĭ��Ϊuser)");
				String newuserroot = sc.nextLine();

				UserDao dao1 = new UserDaoImpl();
				goods g = new goodsImpl();
				if (dao1.login(newusername, newuserpassword, newuserroot)) {
					System.out.println("�û���¼�ɹ�~~");
					System.out.println();
					if (newuserroot.equals("root")) {
						System.out.println("��ӭ" + newusername + "��������Ա���棺");
						
						ControllerImpl c = new ControllerImpl();
						User u2 = new User();
						u2.setUsername(newusername);
						u2.setUserpassword(newuserpassword);
						u2.setUserroot(newuserroot);
						c.operate(u2);

						break;
					} else {
						System.out.println("��ӭ" + newusername + "��������Ա���棺");
						SalesmanImpl c = new SalesmanImpl();
						User u2 = new User();
						u2.setUsername(newusername);
						u2.setUserpassword(newuserpassword);
						u2.setUserroot(newuserroot);
						g.find(u2);// ��Ʒ����ʾ
						c.operate(u2);
						break;
					}
				} else {
					System.out.println("�û���¼ʧ��! �˺Ż����������Ȩ��д��!");
					System.out.println();
				}
				break;

			case "3":
				System.out.println("ϣ����ʹ��ϵͳ��죬�´��ټ�");
				System.exit(1);
				break;

			default:
				System.out.println("�������������ѡ����");
				break;
			}

		}

	}

}
