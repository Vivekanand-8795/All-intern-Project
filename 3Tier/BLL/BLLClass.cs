using System;
using BLL;
using BoNamespace;
using DAL;

namespace BLL
{
    public class BLLClass
    {
        public void Save(BoClass objBLl)
        {
            DalClass dalClass = new DalClass(); 
            BoClass objDAL = new BoClass();
            objDAL.Name = objBLl.Name;  
            objDAL.Password = objBLl.Password;  
            objDAL.UserType = objBLl.UserType;  
            dalClass.Insert(objDAL);
        }
    }
}
