﻿using System;
using System.Data;
using Npgsql;
using Serilog;

using RetailAnalytics.Data;
using Markdown.Common.Settings;
using Markdown.Common.Settings.Interfaces;

namespace Markdown.Function.Common
{
    public class DbConnectionProvider : IDbConnectionProvider
    {
        private readonly ILogger _logger;
        private IDbConnection _connection;
        private readonly Lazy<IDbConnection> _lazyConnection;
        public IDbConnection Connection => _lazyConnection.Value;

        public DbConnectionProvider(ILogger logger, ISqlSettings settings)
        {
            _logger = logger;
            _lazyConnection = new Lazy<IDbConnection>(() =>
            {
                if (_connection != null)
                    return _connection;

                _connection = CreateConnection(settings);
                return _connection;
            });
        }

        private IDbConnection CreateConnection(ISqlSettings settings)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            
            var pgSql = new NpgsqlConnection(settings.EphemeralConnectionString);
            pgSql.Notice += (sender, args) => _logger.Information("psql NOTICE: {Notice} at {Where}", args.Notice.MessageText, args.Notice.Where);

            try
            {
                _logger.Information("Opening SQL Connection");
                pgSql.Open();
                _logger.Information("SQL Connection ({ProcessId}/{ServerVersion}) state: {State}", pgSql.ProcessID, pgSql.PostgreSqlVersion, pgSql.FullState);
            }
            catch (Exception ex)
            {
                throw new Exception("Error opening SQL Connection to database (" + settings.EphemeralConnectionString + "): " + ex.Message, ex);
            }

            return pgSql;
        }

        public void Dispose()
        {
            try
            {
                _connection?.Close();
                _connection?.Dispose();
                _connection = null;

                _logger.Information("SQL connection disposed");
            }
            catch (Exception e)
            {
                _logger.Error(e, "Exception disposing DbConnectionProvider. Probably OK to ignore.");
            }
        }
    }
}
