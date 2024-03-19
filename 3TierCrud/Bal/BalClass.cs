using System;
using Bol;
using Dal;

namespace Bal
{
    public class BalClass
    {
          public void Save(BolClass objBal)
        {
           DalClass dalClass = new DalClass();
            BolClass objDal = new BolClass();
            objDal.Name = objBal.Name;
            objDal.Password = objBal.Password;
            objDal.UserType = objBal.UserType;
            dalClass.Insert(objDal);
            //dalClass.Insert(objBal);
        }
        public void Update(BolClass objBal)
        {
            DalClass dalClass = new DalClass();
            dalClass.Update(objBal);
        }
    }
}
