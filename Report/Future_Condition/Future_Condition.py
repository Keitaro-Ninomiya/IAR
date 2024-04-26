{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "1aff90f9-827b-45f4-8786-5efe10edbe67",
   "metadata": {},
   "outputs": [],
   "source": [
    "class HousingMarketFuture:\n",
    "    def __init__(self, month, year, data):\n",
    "        self.data=data\n",
    "        self.year=year\n",
    "        self.month=month\n",
    "        \n",
    "    def P1(self):\n",
    "        S1=\"The median price forecast indicates positive annual growth for November, December, and January in both Illinois and the Chicago PMSA. \"\n",
    "        S2=\"In Illinois, the median price is forecast to change by 0.1% in November, 1.6% in December, and 2.1% in January. \"\n",
    "        S3=\"For the Chicago PMSA, the comparable figures are 3.4% in November, 3.2% in December, and 3.6% in January. \"\n",
    "        S4=\"(Reference: Forecast for November 2022 report table) \"\n",
    "        \n",
    "    def P2(self):\n",
    "        S1=\"As a complement to the median housing price index (HPI), the SHDRE HPI forecasts a positive growth trend for both Illinois and the Chicago PMSA.  \"\n",
    "        S2=\"In Illinois, the SHDRE HPI (Jan 2008=1) is forecast to change by 2.3% in November, 1.9% in December, and 2.8% in January. \"\n",
    "        S3=\"The comparable figures for the Chicago PMSA are 6.8% in November, 5.9% in December, and 6.7% in January. \"\n",
    "        S4=\"SHDRE HPI takes housing characteristics into account and constructs comparable “baskets” of homes for each month. \"\n",
    "        S5=\"(Reference: Housing Price Index)\"\n",
    "        \n",
    "    def P3(self):\n",
    "        S1=\"The sales forecast for November, December, and January suggests a decrease on a yearly and monthly basis for both Illinois and the Chicago PMSA. \"\n",
    "        S2=\"Annually for Illinois, the three-month average forecasts point to a decrease in the range of -19.2% to -26.0%; the comparative figures for the Chicago PMSA are a decrease in the range of -28.3% to -38.3%. \"\n",
    "        S3=\"On a monthly basis, the three-month average sales are forecast to decrease in the range of -7.4% to -10.1% for Illinois and decrease in the range of -11.0% to -14.9% for the Chicago PMSA. \"\n",
    "        S4=\"(Reference: Forecast for November 2022 report table)\"\n",
    "        \n",
    "    def P4(self):\n",
    "        S1=\"The pending home sales index is a leading indicator based on contract signings.  \"\n",
    "        S2=\"This December, the number of homes put under contract was less than last year in Illinois and Chicago PMSA. \"\n",
    "        S3=\"The pending home sales index is 82.5 (2019=100) in Illinois, down -29.3% from a year ago. \"\n",
    "        S4=\"In the Chicago PMSA, the comparable figure is 77.9 down -33.1% from a year ago. \"\n",
    "        S5=\"(Reference: Illinois and Chicago PMSA Pending Home Sales Index figure)\"\n",
    "        \n",
    "    def P5(self):\n",
    "        S1=\"In December 2022, 1,100 houses were newly filed for foreclosure in the Chicago PMSA (up 255.0% and down -12.0%, respectively, from a year and a month ago). \"\n",
    "        S2=\"499 foreclosures were completed (up 52.0% and up 8.0% respectively from a year and a month ago).  \"\n",
    "        S3=\"As of December 2022, there are 10,900 homes at some stage of foreclosure — the foreclosure inventory. \"\n",
    "        S4=\"The monthly average net flows of foreclosures (foreclosure inflows - outflows) were 803.67 in the past 6 months, 514.17 in the last 12 months, and 327.96 in the previous 24 months. \"\n",
    "        S5=\"(Reference: Chicago PMSA Foreclosure Inflows and Outflows, and Inventory figures).\""
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.13"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
