using Common.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.BL
{
    public class InfoxSecurity
    {

        private string _errorMsg = string.Empty;
        private int _errorNo = 0;
        private bool _isError = false;
        private bool _isSuccess = false;
        private string _result = string.Empty;
        private string _userName = string.Empty;
        private int _companyId = 0;
        private string _companyName = string.Empty;

        InfoxSecurityDAL objInfox_Security;

        DataTable dtTable;



        #region Properties
        /// <summary>
        /// Gets the error MSG.
        /// </summary>
        /// <value>The error MSG.</value>
        public string ErrorMsg
        {
            get { return _errorMsg; }
        }

        public int ErrorNo
        {
            get { return _errorNo; }
        }

        /// <summary>
        /// Gets a value indicating whether this instance is error.
        /// </summary>
        /// <value><c>true</c> if this instance is error; otherwise, <c>false</c>.</value>
        public bool IsError
        {
            get { return _isError; }
        }

        /// <summary>
        /// Gets a value indicating whether this instance is success.
        /// </summary>
        /// <value>
        /// 	<c>true</c> if this instance is success; otherwise, <c>false</c>.
        /// </value>
        public bool IsSuccess
        {
            get { return _isSuccess; }
        }

        public string Result
        {
            get { return _result; }
        }

        public string UserName
        {
            get { return _userName; }
        }

        public int CompanyId
        {
            get { return _companyId; }
        }

        public string CompanyName
        {
            get { return _companyName; }
        }
        #endregion

        #region Constructors
        /// <summary>
        /// Initializes a new instance of the <see cref="MksSecurity"/> class.
        /// </summary>
        public InfoxSecurity()
        {
            objInfox_Security = new InfoxSecurityDAL();
        }
        #endregion

      
        #region Internal
        private void SetValues()
        {
            _isError = objInfox_Security.IsError;
            _errorMsg = objInfox_Security.ErrorMsg;
            _isSuccess = objInfox_Security.IsSuccess;
            _errorNo = objInfox_Security.ErrorNo;
            _result = objInfox_Security.Result;
        }
        #endregion


       

    }
}
