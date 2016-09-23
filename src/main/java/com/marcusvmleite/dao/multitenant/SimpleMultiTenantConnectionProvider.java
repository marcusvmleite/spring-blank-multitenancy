package com.marcusvmleite.dao.multitenant;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.engine.jdbc.connections.spi.MultiTenantConnectionProvider;
import org.hibernate.service.UnknownUnwrapTypeException;
import org.springframework.beans.factory.annotation.Autowired;

public class SimpleMultiTenantConnectionProvider implements MultiTenantConnectionProvider {

    /**
	 * 
	 */
	private static final long serialVersionUID = 4450465211540239800L;
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean isUnwrappableAs(@SuppressWarnings("rawtypes") Class unwrapType) {
		return ConnectionProvider.class.equals( unwrapType ) || 
				MultiTenantConnectionProvider.class.equals( unwrapType ) || 
				SimpleMultiTenantConnectionProvider.class.isAssignableFrom( unwrapType );
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T unwrap(Class<T> unwrapType) {
		if ( isUnwrappableAs( unwrapType ) ) {
            return (T) this;
        }
        else {
            throw new UnknownUnwrapTypeException( unwrapType );
        }
	}

	@Override
	public Connection getAnyConnection() throws SQLException {
		return dataSource.getConnection();
	}

	@Override
	public void releaseAnyConnection(Connection connection) throws SQLException {
		connection.close();
	}

	@Override
	public Connection getConnection(String tenantIdentifier)
			throws SQLException {
		Connection connection = dataSource.getConnection();
		if (session.getAttribute("schemaTemp") != null) {
			connection.createStatement().execute("SET SCHEMA '" + session.getAttribute("schemaTemp") + "'");
		} else if (!"".equals(tenantIdentifier)) {
			connection.createStatement().execute("SET SCHEMA '" + tenantIdentifier + "'");
		}
		return connection;
	}

	@Override
	public void releaseConnection(String tenantIdentifier, Connection connection)
			throws SQLException {
		try {
            this.releaseAnyConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
	}

	@Override
	public boolean supportsAggressiveRelease() {
		return false;
	}

}
