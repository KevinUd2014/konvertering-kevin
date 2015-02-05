using KonverteringTemperaturer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KonverteringTemperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Convert_Click(object sender, EventArgs e)
        {
            if(IsValid)  // om validatorerna går igenom så körs allt detta!
            {
                int startTemp = int.Parse(EnterTempStart.Text);  // tar in värderna som personen har skrivit in och skapar nya variablar för dom!
                int endTemp = int.Parse(EnterTempEnd.Text);  // samma här!
                int jumpTemp = int.Parse(EnterTempJump.Text);// samma här!

                if (EntryC.Checked == true)
                {

                    for (int i = startTemp; i <= endTemp; i += jumpTemp)
                    {
                        int CelsiustoF = TemperatureConverter.CelsiusToFahrenheit(startTemp);
                        
                        TableRow topRow = new TableRow();  // dessa finns redan som val dessa tableHeaderRows och celler!
                        TableCell leftCell = new TableCell();
                        TableCell rightCell = new TableCell();

                        Presentation.Rows.Add(topRow);
                        topRow.Cells.Add(leftCell);
                        topRow.Cells.Add(rightCell);

                        leftCell.Text = startTemp.ToString();
                        rightCell.Text = CelsiustoF.ToString();

                        startTemp += jumpTemp;  // kanske ska vara någon annanstanns
                    }

                }

                else if (EntryF.Checked == true)
                {

                    for (int i = startTemp; i <= endTemp; i += jumpTemp)
                    {

                        TableRow topRow = new TableRow();  // dessa finns redan som val dessa tableHeaderRows och celler!
                        TableCell leftCell = new TableCell();  // skapar celler!!
                        TableCell rightCell = new TableCell();

                        int FahrentoC = TemperatureConverter.FahrenheitToCelsius(startTemp);  // tar in uträckningsmetoden från klassen!

                        Presentation.Rows.Add(topRow);// lägger till alla rader
                        topRow.Cells.Add(leftCell);// och alla celler!
                        topRow.Cells.Add(rightCell);

                        leftCell.Text = startTemp.ToString();  // sätter cellen till vänster till det man skriver in som start!
                        rightCell.Text = FahrentoC.ToString(); // sätter in den nya uträckningen i cellen till höger!

                        startTemp += jumpTemp;  // kanske ska vara någon annanstanns
                    }
                }

                TableRow headeRow = new TableRow();// skapar rader!
                TableHeaderCell headerCell1 = new TableHeaderCell();// skapar celler!
                TableHeaderCell headerCell2 = new TableHeaderCell();

                headeRow.Cells.Add(headerCell1);// skapar de två översta cellerna!
                headeRow.Cells.Add(headerCell2);

                Presentation.Rows.AddAt(0, headeRow);// Lägger in C och F överst på tabellen!

                if (EntryC.Checked)
                {
                    headerCell1.Text = "C";
                    headerCell2.Text = "F";
                    EntryF.GroupName = "changed";
                }
                else
                {
                    EntryC.GroupName = "changed";  // gör det möjligt att byta mellan knapparna fick hjälp med denna!
                    headerCell1.Text = "F";
                    headerCell2.Text = "C";
                }
                Presentation.Visible = true;

            }       
        }
    }
}