package com.taobao.test;

import java.util.Scanner;

import com.taobao.UserDao.UserDao;
import com.taobao.UserDao.Impl.UserDaoImpl;
import com.taobao.entity.User;

public class Demo {
	public static void main(String[] args) {
while(true){
		System.out.println("==========��ӭʹ�ü���԰����ϵͳ===========");
		System.out.println("1ע��");
		System.out.println("2��¼");
		System.out.println("3�˳�");
		System.out.println("����������Ҫ���ܵı��:");

		Scanner sc = new Scanner(System.in);
		String change = sc.nextLine();
		// switch ��jdk 1.7�������п���ʹ���ַ����ж�
		switch (change) {
		case "1":
			System.out.println("��������Ҫע����˺�:");
			String username = sc.nextLine();
			System.out.println("��������Ҫע�������:");
			String userpassword = sc.nextLine();

			// ���˺ź������װ�ɶ���
			User u = new User();
			u.setUsername(username);
			u.setUserpassword(userpassword);

			UserDao dao = new UserDaoImpl();
			dao.regesiter(u);
			System.out.println("ע��ɹ�");
			break;
		case "2":
			// boolean b = dao.login(username, userpassword);
			System.out.println("��������Ҫ��¼���˺�:");
			String newusername = sc.nextLine();
			System.out.println("��������Ҫ��¼������:");
			String newuserpassword = sc.nextLine();

			// boolean b = dao.login(newusername, newuserpassword);
			// if(b)
			// {
			//
			// }

			UserDao dao1 = new UserDaoImpl();
			if (dao1.login(newusername, newuserpassword)) {
				System.out.println("�û���¼�ɹ�~~");
				// break;
				// return;
				// ǿ�ƹر�jvm�����

				// ����Ϸ
				// Game.statrt();
				System.exit(1);
			} else {
				System.out.println("�û���¼ʧ��!");
			}
			break;
		case "3":
			System.out.println("лл���٣��´��ټ���");
			System.exit(1);
			break;
		default:
			break;
		}

}		
	}

}
