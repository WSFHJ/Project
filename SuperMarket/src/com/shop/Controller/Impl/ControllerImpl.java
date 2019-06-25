package com.shop.Controller.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import org.junit.Test;

import com.shop.Controller.Controller;
import com.shop.Controller.goods;
import com.shop.JDBC.JDBCUntils;
import com.shop.UserDao.UserDao;
import com.shop.UserDao.Impl.UserDaoImpl;
import com.shop.entity.User;

public class ControllerImpl implements Controller {
	// ����Ա����
	public void operate(User u) {
		
		while (true) {
			
			UserDao dao1 = new UserDaoImpl();
			dao1.showuser();// �û�����ʾ
			
			System.out.println("------���Խ��еĲ���---------");
			System.out.println("1.��Ա����ɾ��");
			System.out.println("2.�û�ע��");
			System.out.println("3.������Ϣ�޸�(���������޸�)");
			System.out.println("4.��������");
			System.out.println("5.�˳���ǰϵͳ");
		
			System.out.println("---------��ѡ�����---------");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			switch (change) {
			case "1":
				while (true) {
					
					System.out.println("����ɾ���û���Ȩ�ޣ�");
					String root = sc.nextLine();
					System.out.println("����ɾ���û�����");
					String name = sc.nextLine();

					Controller c = new ControllerImpl();
					UserDaoImpl dao = new UserDaoImpl();
					if (dao.login2(u.getUsername(), u.getUserroot())) {
						c.delete(root, name);
						break;
					} else {
						System.out.println("������û�������,����������");
						System.out.println();
					}

				}
				break;

			case "2":
				while (true) {

					System.out.println("��������Ҫע����˺�:");
					String username = sc.nextLine();
					System.out.println("��������Ҫע�������:");
					String userpassword = sc.nextLine();
					System.out.println("����Ա������root������Ա������user: ");
					System.out.println("(���������ַ�,Ĭ��Ϊuser)");
					String userroot = sc.nextLine();

					// ���˺ź������װ�ɶ���
					User u2 = new User();
					u2.setUsername(username);
					u2.setUserpassword(userpassword);
					u2.setUserroot(userroot);

					UserDaoImpl dao = new UserDaoImpl();
					if (dao.login2(u2.getUsername(),u2.getUserroot() )) {
						System.out.println("�û��Ѵ���,������ע��");
					} else {
						dao.regesiter(u2);
						System.out.println("ע��ɹ�");
						System.out.println();
						break;
					}
					
				}

				break;

			case "3":
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

			case "4":

				manage(u);
				break;

			case "5":
				System.out.println("�ɹ��ɹ���Ա�����˳�");
				System.exit(1);
				break;

			default:
				System.out.println("�������������ѡ����");
				break;
			}
		}
	}

	// ɾ������
	@Override
	// @Test
	public void delete(String root, String name) {
		Connection connection = null;
		Statement statement = null;
		int i;

		try {
			connection = JDBCUntils.getConnection();

			// 3.����statement ����
			statement = connection.createStatement();

			String sql;
			if (root.equals("root")) {
				sql = "delete from controller where user = '" + name + "'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("ɾ������Ա��" + i + "�����ݳɹ���");

					sql = "delete from person where user = '" + name + "' and power = 'root'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("ɾ���û���" + i + "�����ݳɹ���");
						System.out.println();
					} else {
						System.out.println("�û���û�и��û�");
					}

				} else {
					System.out.println("ɾ������ʧ��,�û�����Ȩ���������");
				}

			} else if (root.equals("user")) {
				sql = "delete from salesman where user = '" + name + "'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("ɾ������Ա��" + i + "�����ݳɹ���");

					sql = "delete from person where user = '" + name + "' and power = 'user'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("ɾ���û���" + i + "�����ݳɹ���");
						System.out.println();
					} else {
						System.out.println("�û���û�и��û�");
					}

				} else {
					System.out.println("ɾ������ʧ��,�û�����Ȩ���������");
				}
			} else {
				System.out.println("Ȩ�޻��û����������,Ȩ��ֻ��Ϊroot��user");
				System.out.println();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}
	}

	// �ı������Ϣ
	@Override
	public void change(User u, String message, String mess) {
		Connection connection = null;
		Statement statement = null;
		int i;

		try {
			connection = JDBCUntils.getConnection();

			// 3.����statement ����
			statement = connection.createStatement();

			String sql;
			if (u.getUserroot().equals("root")) {
				sql = "update controller set " + message + " = '" + mess + "'where user = '" + u.getUsername() + "'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("�޸Ĺ���Ա��" + i + "�����ݳɹ���");

					sql = "update person set " + message + " = '" + mess + "'where user = '" + u.getUsername()
							+ "'and power = 'root'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("�޸��û���" + i + "�����ݳɹ���");
						System.out.println();
					} else {
						System.out.println("�޸�����ʧ��");
					}

				} else {
					System.out.println("�޸�����ʧ��");
				}

			} else if (u.getUserroot().equals("user")) {
				sql = "update salesman set " + message + " = '" + mess + "'where user = '" + u.getUsername()
						+ "'and power = 'user'";
				i = statement.executeUpdate(sql);
				if (i > 0) {
					System.out.println("�޸�����Ա��" + i + "�����ݳɹ���");

					sql = "update person set " + message + " = '" + mess + "'where user = '" + u.getUsername()
							+ "'and power = 'user'";
					i = statement.executeUpdate(sql);
					if (i > 0) {
						System.out.println("�޸��û���" + i + "�����ݳɹ���");
						System.out.println();
					} else {
						System.out.println("�޸�����ʧ��");
					}

				} else {
					System.out.println("�޸�����ʧ��");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JDBCUntils.Close(null, statement, connection);

		}
	}

	// ��������
	// @Test
	@Override
	public void manage(User u) {
		System.out.println("---------��������---------");
		while (true) {
			System.out.println("1.��ӿ����Ʒ");
			System.out.println("2.ɾ�������Ʒ");
			System.out.println("3.��ѯ�����Ʒ");
			System.out.println("4.�˳���������ҳ��");

			System.out.println("��ѡ����Ҫ�Ĺ��ܣ�");
			Scanner sc = new Scanner(System.in);
			String change = sc.nextLine();
			goods g = new goodsImpl();
			goodsImpl g2 = new goodsImpl();

			switch (change) {
			case "1":
				g.add();
				break;

			case "2":
				System.out.println("----��������Ҫɾ������Ʒ�ı��(id)----");
				String id;
				while (true) {
					id = sc.nextLine();
					String regex = "[0-9]{1,4}";
					if (id.matches(regex)) {
						System.out.println("��Ҫɾ������Ʒ�ı����" + id);
						if (g2.have(id)) {
							break;
						} else {
							System.out.println("û�б��Ϊ" + id + "��Ʒ,����������");
						}
					} else {
						System.out.println("������Ʒ��Ų���ȷ,��������");
					}
				}
				g.remove(id);

				break;

			case "3":
				g.find(u);
				break;

			case "4":
				System.out.println("�ɽ�������ҳ���˳�");
				System.exit(1);

			default:
				System.out.println("���빦��ѡ�����");
				break;
			}
		}
	}

}
