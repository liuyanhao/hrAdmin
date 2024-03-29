package com.lxc.plugin;

import com.lxc.entity.Page;
import com.lxc.util.ReflectHelper;
import com.lxc.util.Tools;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;

import javax.xml.bind.PropertyException;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
/**
 * 
* 类名称：分页插件
* 类描述： 
* @author lxc
* 作者单位： 北京颜豪科技有限公司
* 联系方式：qq1094921525
* 修改时间：2018年2月1日
* @version 1.0
 */
@Intercepts({@Signature(type=StatementHandler.class,method="prepare",args={Connection.class})})
public class PagePlugin implements Interceptor {

	// 数据库方言
	private static String dialect = "";
	// mapper.xml中需要拦截的ID(正则匹配)
	private static String pageSqlId = "";

	@Override
	public Object intercept(Invocation ivk) throws Throwable {
		// TODO Auto-generated method stub
		if(ivk.getTarget() instanceof RoutingStatementHandler){
			RoutingStatementHandler statementHandler = (RoutingStatementHandler)ivk.getTarget();
			BaseStatementHandler delegate = (BaseStatementHandler) ReflectHelper.getValueByFieldName(statementHandler, "delegate");
			MappedStatement mappedStatement = (MappedStatement) ReflectHelper.getValueByFieldName(delegate, "mappedStatement");

			//拦截需要分页的SQL
			if(mappedStatement.getId().matches(pageSqlId)){
				BoundSql boundSql = delegate.getBoundSql();
				//分页SQL<select>中parameterType属性对应的实体参数，即Mapper接口中执行分页方法的参数,该参数不得为空
				Object parameterObject = boundSql.getParameterObject();
				if(parameterObject==null){
					throw new NullPointerException("parameterObject尚未实例化！");
				}else{
					Connection connection = (Connection) ivk.getArgs()[0];
					String sql = boundSql.getSql();
					//记录统计
					//String countSql = "select count(0) from (" + sql+ ") as tmp_count";
					String lxcsql = sql;
					//记录统计 == oracle 加 as 报错(SQL command not properly ended)
					String countSql = "select count(0) from (" + lxcsql+ ")  tmp_count";
					PreparedStatement countStmt = connection.prepareStatement(countSql);
					BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(),countSql,boundSql.getParameterMappings(),parameterObject);
					setParameters(countStmt,mappedStatement,countBS,parameterObject);
					ResultSet rs = countStmt.executeQuery();
					int count = 0;
					if (rs.next()) {
						count = rs.getInt(1);
					}
					rs.close();
					countStmt.close();
					// System.out.println(count);
					Page page = null;
					//参数就是Page实体
					if(parameterObject instanceof Page){
						 page = (Page) parameterObject;
						 page.setEntityOrField(true);	 
						 page.setTotalResult(count);
					}else{
						//参数为某个实体，该实体拥有Page属性
						Field pageField = ReflectHelper.getFieldByFieldName(parameterObject,"page");
						if(pageField!=null){
							page = (Page) ReflectHelper.getValueByFieldName(parameterObject,"page");
							if(page == null) {
								page = new Page();
							}
							page.setEntityOrField(false); 
							page.setTotalResult(count);
							//通过反射，对实体对象设置分页对象
							ReflectHelper.setValueByFieldName(parameterObject,"page", page);
						}else{
							throw new NoSuchFieldException(parameterObject.getClass().getName() + "不存在 page 属性！");
						}
					}
					String pageSql = generatePageSql(sql,page);
					//将分页sql语句反射回BoundSql.
					ReflectHelper.setValueByFieldName(boundSql, "sql", pageSql);
				}
			}
		}
		return ivk.proceed();
	}

	
	/**
	 * 对SQL参数(?)设值,参考org.apache.ibatis.executor.parameter.DefaultParameterHandler
	 * @param ps  PreparedStatement
	 * @param mappedStatement  MappedStatement
	 * @param boundSql  BoundSql
	 * @param parameterObject Object
	 * @throws SQLException SQL异常
	 */
	private void setParameters(PreparedStatement ps,MappedStatement mappedStatement,BoundSql boundSql,Object parameterObject) throws SQLException {
		ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		if (parameterMappings != null) {
			Configuration configuration = mappedStatement.getConfiguration();
			TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
			MetaObject metaObject = parameterObject == null ? null: configuration.newMetaObject(parameterObject);
			for (int i = 0; i < parameterMappings.size(); i++) {
				ParameterMapping parameterMapping = parameterMappings.get(i);
				if (parameterMapping.getMode() != ParameterMode.OUT) {
					Object value;
					String propertyName = parameterMapping.getProperty();
					PropertyTokenizer prop = new PropertyTokenizer(propertyName);
					if (parameterObject == null) {
						value = null;
					} else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
						value = parameterObject;
					} else if (boundSql.hasAdditionalParameter(propertyName)) {
						value = boundSql.getAdditionalParameter(propertyName);
					} else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)&& boundSql.hasAdditionalParameter(prop.getName())) {
						value = boundSql.getAdditionalParameter(prop.getName());
						if (value != null) {
							value = configuration.newMetaObject(value).getValue(propertyName.substring(prop.getName().length()));
						}
					} else {
						value = metaObject == null ? null : metaObject.getValue(propertyName);
					}
					TypeHandler typeHandler = parameterMapping.getTypeHandler();
					if (typeHandler == null) {
						throw new ExecutorException("There was no TypeHandler found for parameter "+ propertyName + " of statement "+ mappedStatement.getId());
					}
					typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
				}
			}
		}
	}
	
	/**
	 * 根据数据库方言，生成特定的分页sql
	 * @param sql SQL
	 * @param page 分页
	 * @return String
	 */
	private String generatePageSql(String sql,Page page){
		if(page!=null && Tools.notEmpty(dialect)){
			StringBuffer pageSql = new StringBuffer();
			if("mysql".equals(dialect)){
				pageSql.append(sql);
				pageSql.append(" limit " + page.getCurrentResult() + "," + page.getShowCount());
			}
			return pageSql.toString();
		}else{
			return sql;
		}
	}

	@Override
	public Object plugin(Object arg0) {
		// TODO Auto-generated method stub
		return Plugin.wrap(arg0, this);
	}

	@Override
	public void setProperties(Properties p) {
		dialect = p.getProperty("dialect");
		if (Tools.isEmpty(dialect)) {
			try {
				throw new PropertyException("dialect property is not found!");
			} catch (PropertyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		pageSqlId = p.getProperty("pageSqlId");
		if (Tools.isEmpty(pageSqlId)) {
			try {
				throw new PropertyException("pageSqlId property is not found!");
			} catch (PropertyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
