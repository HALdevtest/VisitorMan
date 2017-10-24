using System;
using System.Text;
using System.Collections;
using System.DirectoryServices;

namespace VisitorMan
{
    public class LdapAuthentication
    {

        private string _path;
        private string _filterAttribute;
        private string _username;
        private string _password;
        private string _domain;
        private string _domainAndUsername;
        private DirectoryEntry _entry;
        private DirectorySearcher _search;
        private SearchResult _result;

        public LdapAuthentication(string path, string domain, string username, string password)
        {
            _path = path;
            _domain = domain;
            _username = username;
            _password = password;
            _domainAndUsername = _domain + @"\" + _username;
            _entry = new DirectoryEntry(_path, _domainAndUsername, _password);

        }

        public bool IsAuthenticated()
        {
            try
            {
                Object obj = _entry.NativeObject;
                _search = new DirectorySearcher(_entry);
                _search.Filter = "(SAMAccountName=" + _username + ")";
                _search.PropertiesToLoad.Add("cn");
                _result = _search.FindOne();
                if (null == _result) { return false; }
                _path = _result.Path;
                _filterAttribute = (String)_result.Properties["cn"][0];
            }
            catch (Exception ex) { throw new Exception("Error authenticating user: " + ex.Message); }
            return true;
        }

        public string GetGroups()
        {
            string r = "";
            try
            {
                Object obj = _entry.NativeObject;
                _search = new DirectorySearcher(_path);
                _search.Filter = "(SAMAccountName=" + _username + ")";
                _search.PropertiesToLoad.Add("cn");
                _result = _search.FindOne();
                if (null != _result)
                {
                    _path = _result.Path;
                    _filterAttribute = (String)_result.Properties["cn"][0];
                    _search = new DirectorySearcher(_path);
                    _search.Filter = "(cn=" + _filterAttribute + ")";
                    _search.PropertiesToLoad.Add("memberOf");
                    StringBuilder groupNames = new StringBuilder();
                    _result = _search.FindOne();
                    int propertyCount = _result.Properties["memberOf"].Count;
                    String dn;
                    int equalsIndex, commaIndex;
                    for (int propertyCounter = 0; propertyCounter < propertyCount; propertyCounter++)
                    {
                        dn = (String)_result.Properties["memberOf"][propertyCounter];
                        equalsIndex = dn.IndexOf("=", 1);
                        commaIndex = dn.IndexOf(",", 1);
                        if (-1 == equalsIndex) { return null; }
                        groupNames.Append(dn.Substring((equalsIndex + 1), (commaIndex - equalsIndex) - 1));
                        groupNames.Append("|");
                    }
                    r = groupNames.ToString();
                }
            }
            catch (Exception ex) { throw new Exception("Error obtaining group names: " + ex.Message); }

            return r;
        }

        /*
        private String _path;
        private String _filterAttribute;

        public LdapAuthentication(String path)
        {
            _path = path;
        }

        public bool IsAuthenticated(String domain, String username, String pwd)
        {
            String domainAndUsername = domain + @"\" + username;
            DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);

            try
            {//Bind to the native AdsObject to force authentication.
                Object obj = entry.NativeObject;

                DirectorySearcher search = new DirectorySearcher(entry);

                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();

                if (null == result)
                {
                    return false;
                }

                //Update the new path to the user in the directory.
                _path = result.Path;
                _filterAttribute = (String)result.Properties["cn"][0];
            }
            catch (Exception ex)
            {
                throw new Exception("Error authenticating user. " + ex.Message);
            }

            return true;
        }

        public String GetGroups()
        {
            DirectorySearcher search = new DirectorySearcher(_path);
            search.Filter = "(cn=" + _filterAttribute + ")";
            search.PropertiesToLoad.Add("memberOf");
            StringBuilder groupNames = new StringBuilder();

            try
            {
                SearchResult result = search.FindOne();

                int propertyCount = result.Properties["memberOf"].Count;

                String dn;
                int equalsIndex, commaIndex;

                for (int propertyCounter = 0; propertyCounter < propertyCount; propertyCounter++)
                {
                    dn = (String)result.Properties["memberOf"][propertyCounter];

                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    if (-1 == equalsIndex)
                    {
                        return null;
                    }

                    groupNames.Append(dn.Substring((equalsIndex + 1), (commaIndex - equalsIndex) - 1));
                    groupNames.Append("|");

                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error obtaining group names. " + ex.Message);
            }
            return groupNames.ToString();
        }
        */
    }
}