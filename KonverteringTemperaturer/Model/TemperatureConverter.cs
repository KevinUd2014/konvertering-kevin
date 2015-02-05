using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonverteringTemperaturer.Model
{
    public class TemperatureConverter
    {
        public static int CelsiusToFahrenheit (int degreesC)
        {
            return (int)Math.Round((degreesC * 1.8) + 32);
        }

        public static int FahrenheitToCelsius (int degreesF)
        {
            return (int)(degreesF - 32) * 5 / 9;
        }
    }
}