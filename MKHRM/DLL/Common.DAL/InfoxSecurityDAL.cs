using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.DAL
{

    public class InfoxSecurityDAL
    {
        private SqlConnection dbConnection;
        private string _errorMsg = string.Empty;
        private int _errorNo = 0;
        private bool _isError = false;
        private string _userId;
        private bool _isSuccess = false;
        private string _result = string.Empty;
        private string _companyName = string.Empty;

        private long _loggedUserEmployeeId;
        private string _loggedUserEmployeeCode;
        private string _loggedUserEmployeeName;
        private int _loggedUserUserType;
        private string _loggedUserUserName;
        private int _loggedUserCompanyId;

        public string ErrorMsg
        {
            get { return _errorMsg; }
        }

        public int ErrorNo
        {
            get { return _errorNo; }
        }

        public bool IsError
        {
            get { return _isError; }
        }

        public string UserId
        {
            get { return _userId; }
        }
        public bool IsSuccess
        {
            get { return _isSuccess; }
        }

        public string Result
        {
            get { return _result; }
        }

        public string CompanyName
        {
            get { return _companyName; }
        }

        #region Logged User Properties
        public long LoggedUserEmployeeId
        {
            get { return _loggedUserEmployeeId; }
        }

        public string LoggedUserEmployeeCode
        {
            get { return _loggedUserEmployeeCode; }
        }

        public string LoggedUserEmployeeName
        {
            get { return _loggedUserEmployeeName; }
        }

        public int LoggedUserUserType
        {
            get { return _loggedUserUserType; }
        }

        public string LoggedUserUserName
        {
            get { return _loggedUserUserName; }
        }

        public int LoggedUserCompanyId
        {
            get { return _loggedUserCompanyId; }
        }
        #endregion

        public InfoxSecurityDAL()
        {
            dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString);
        }

        private void OpenDb()
        {
            if (dbConnection.State != ConnectionState.Open)
            {
                dbConnection.Open();
            }
            InitializeFields();
        }

        private void InitializeFields()
        {
            _isError = false;
            _isSuccess = false;
            _errorMsg = string.Empty;
            _errorNo = 0;
            _result = string.Empty;
        }

        private void SetError(SqlException Ex)
        {
            _isSuccess = false;
            _isError = true;
            _errorMsg = Ex.Message;
            _result = string.Empty;

            switch (Ex.Number)
            {
                case 2601: _errorMsg = "Can not Update!." + Environment.NewLine + " Duplicate Record!";
                    break;
                case 2627: _errorMsg = "Can not Update!." + Environment.NewLine + " Duplicate Record!";
                    break;
                case 547: _errorMsg = "Can not Delete. Alredy Assign!";
                    break;
                default: break;
            }
        }


    }
}
