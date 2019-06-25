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

	//{1} 根据  "角色 ID" 来获取  "角色菜单", 拼装成为一个 "List" 集合
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
		List<ViewMenu> list = getRoleMenus("*");    //{ps} 查询管理员
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

	//{2} 负责解析上面取得的 List, 转化为 Map 数据。
	public Map<String,Menu> parseList(List<ViewMenu> list){
		//{ps} 迭代这一个列表, 把里面的数据拆解出来
		Map<String,Menu> menuMap = new HashMap();
		//{1} 第一次迭代: 处理了所有的 Menu 对象
		for ( ViewMenu vm : list ) {
			String menuId = vm.getMenuId();
			boolean ret = menuMap.containsKey(menuId);   //{ps} 是否包含 相同的 key
			if( !ret ){
				//{ps} 创建一个 Menu 对象
				Menu menu = new Menu( menuId, vm.getMenuName());
				//{ps} 放入 menuMap 中
				menuMap.put(menuId, menu);
			}
		}
		//{ps} 第二次迭代: 处理了所有的  MenuItem 对象, 并把  MenuItem 存入到  Menu 的 set 中..
		for (ViewMenu vm : list) {
			String menuId = vm.getMenuId();   //{ps} 看它归属哪一个主菜单
			Menu menu = menuMap.get( menuId );   //{获取对应的  menu 对象}
			if( menu!=null ){
				//{ps} 创建了 MenuItem 对象
				MenuItem mi = new MenuItem( vm.getItemName(), 
							  vm.getUrlLink(), vm.getVisible() );
				//{ps} 把  MenuItem 存入到  Menu 的 set 中..
				menu.addMenuItem( mi );
			}
		}
		return menuMap;
	}

	//{3} 提供外部程序 (Service) 调用。
	//{ps} 查询指定角色的  Menu (Map)
	public Map<String,Menu> getRoleMenuMap(String roleId){
		List<ViewMenu> list = getRoleMenus(roleId);       
		Map<String, Menu> menuMap = parseList( list );
		return menuMap;
	}

	//{4} 获取权限的信息, 从数据库取数据, 调用下面的方法。
	public Set<String> getRoleAuthrity(String roleId){
		return null;
	}

	//{5} 解析 ViewMenu 生成二级菜单项。
	public Set<String> parseMenuItem(String roleId, List<ViewMenu> list){
		return null;
	}
}
