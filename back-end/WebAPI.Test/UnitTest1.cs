using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using WebAPI.Common;

namespace WebAPI.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            //Run
            var result = JwtManager.GenerateToken("nhonnt");

            //Asert
            Assert.AreEqual(new TimeSpan(4, 30, 0).ToString(), result);
        }

        [TestMethod]
        public void TestMethod2()
        {
            var s = 0;
            try
            {
                var watch = System.Diagnostics.Stopwatch.StartNew();
                var a = GetList();
                for (int i = 0; i < 3; i++)
                {
                    s += a[i];
                }
                watch.Stop();
                var elapsedMs = watch.ElapsedMilliseconds;

                var ss = 0;
                watch = System.Diagnostics.Stopwatch.StartNew();
                var b = GetNumber();
                var count = 0;
                foreach (var ii in b)
                {
                    ss += ii;
                    count++;
                    if (count == 3) break;
                }

                watch.Stop();
                var elapsedMs1 = watch.ElapsedMilliseconds;
            }
            catch
            {

            }

            //Asert
            Assert.AreEqual(1, 1);
        }

        public IEnumerable<int> GetNumber()
        {
            var a = new List<int>();
            for (int i = 0; i < 5; i++)
            {
                System.Threading.Thread.Sleep(1000);
                yield return i;
            }
        }

        public List<int> GetList()
        {
            var a = new List<int>();
            for (int i = 0; i < 5; i++)
            {
                System.Threading.Thread.Sleep(1000);
                a.Add(i);
            }
            return a;
        }
    }
}
