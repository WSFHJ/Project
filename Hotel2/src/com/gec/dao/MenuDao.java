package com.gec.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.junit.Test;

import com.gec.model.Menu;
import com.gec.model.MenuItem;
import com.gec.model.ViewMenu;
import com.gec.utils.JdbcUtils;
import com.gec.utils.iTrace;

public class MenuDao extends BaseDao<Menu> {

	//{1} ����  "��ɫ ID" ����ȡ  "��ɫ�˵�", ƴװ��Ϊһ�� "List" ����
	public List<ViewMenu> getRoleMenus(String roleId){
		String sql = "select * from view_menu vm where vm.roleId=?";
		Connection conn = JdbcUtils.getConnection();
		try {
			return getGivenTypeList( conn, sql, ViewMenu.class, roleId );
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JdbcUtils.closeConnection( conn );
		}
		return null;
	}

	@Test
	public void test1(){
		List<ViewMenu> list = getRoleMenus("*");    //{ps} ��ѯ����Ա
//		for (ViewMenu viewMenu : list) {
//			iTrace.print( viewMenu );
//		}
		Map<String, Menu> menuMap = parseList( list );
		Set<Entry<String, Menu>> eSet = menuMap.entrySet();
		for ( Entry<String, Menu> entry : eSet ) {
			String key = entry.getKey();
			Menu menu = entry.getValue();
			iTrace.print( menu );
			System.out.println("---------------------------------------------------------");
			Set<MenuItem> items = menu.getItems();
			for (MenuItem menuItem : items) {
				iTrace.print( menuItem );
			}
			System.out.println("---------------------------------------------------------");			
		}
	}

	//{2} �����������ȡ�õ� List, ת��Ϊ Map ���ݡ�
	public Map<String,Menu> parseList(List<ViewMenu> list){
		//{ps} ������һ���б�, ����������ݲ�����
		Map<String,Menu> menuMap = new HashMap();
		//{1} ��һ�ε���: ���������е� Menu ����
		for ( ViewMenu vm : list ) {
			String menuId = vm.getMenuId();
			boolean ret = menuMap.containsKey(menuId);   //{ps} �Ƿ���� ��ͬ�� key
			if( !ret ){
				//{ps} ����һ�� Menu ����
				Menu menu = new Menu( menuId, vm.getMenuName());
				//{ps} ���� menuMap ��
				menuMap.put(menuId, menu);
			}
		}
		//{ps} �ڶ��ε���: ���������е�  MenuItem ����, ����  MenuItem ���뵽  Menu �� set ��..
		for (ViewMenu vm : list) {
			String menuId = vm.getMenuId();   //{ps} ����������һ�����˵�
			Menu menu = menuMap.get( menuId );   //{��ȡ��Ӧ��  menu ����}
			if( menu!=null ){
				//{ps} ������ MenuItem ����
				MenuItem mi = new MenuItem( vm.getItemName(), 
							  vm.getUrlLink(), vm.getVisible() );
				//{ps} ��  MenuItem ���뵽  Menu �� set ��..
				menu.addMenuItem( mi );
			}
		}
		return menuMap;
	}

	//{3} �ṩ�ⲿ���� (Service) ���á�
	//{ps} ��ѯָ����ɫ��  Menu (Map)
	public Map<String,Menu> getRoleMenuMap(String roleId){
		List<ViewMenu> list = getRoleMenus(roleId);       
		Map<String, Menu> menuMap = parseList( list );
		return menuMap;
	}

	//{4} ��ȡȨ�޵���Ϣ, �����ݿ�ȡ����, ��������ķ�����
	public Set<String> getRoleAuthrity(String roleId){
		return null;
	}

	//{5} ���� ViewMenu ���ɶ����˵��
	public Set<String> parseMenuItem(String roleId, List<ViewMenu> list){
		return null;
	}
}
