Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-hk2apc01on0063.outbound.protection.outlook.com
 ([104.47.124.63] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aCRCf-0006kL-V0
 for ath10k@lists.infradead.org; Fri, 25 Dec 2015 12:10:39 +0000
From: Sunder Kumaresan <sunder.kumaresan@aricent.com>
Subject: Re: Queries about ath10k driver and QCA988x based radio from sparklan
Date: Fri, 25 Dec 2015 12:10:07 +0000
Message-ID: <SG2PR04MB11200673364B932C1893741A9FF80@SG2PR04MB1120.apcprd04.prod.outlook.com>
References: <567D251C.1080803@sibridgetech.com>
In-Reply-To: <567D251C.1080803@sibridgetech.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ankur Saxena <ankur.saxena@sibridgetech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Did you update your firmware ?

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware

It worked for us in 3.18 Kernel

Use the above link.

Best Regards,
Sunder


________________________________________
From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Ankur Saxena <ankur.saxena@sibridgetech.com>
Sent: Friday, December 25, 2015 4:44 PM
To: ath10k@lists.infradead.org
Subject: Queries about ath10k driver and QCA988x based radio from sparklan

Hi All,

We have purchased radio module "WPEA-352ACN" from SparkLan. We are using
this radio module with ViaTech board for 802.11 AC functionality. We are
running linux kernel 3.19.1 with atheros driver ath10k up with all the
configuration elements.

We are facing some issues in getting up 802.11 AC functionality for the
radio. Please find below the queries:

1) We are using latest ath10k driver with 802.11AC configuration
enabled. On loading the driver for ath10k, we are not seeing "802.11AC"
in iwconfig utility for wlan interface. It is showing only 802.11 abgn
for the interface.

2) Tried to make AP using the interface by taking help of hostapd
utility. Searched on internet for configuration related to making 802.11
AC AP and used them all. In this case, Mode parameter in iwconfig is
changed to Master which shows AP functionality, but the interface is
still showing 802.11 abgn supported only.

3) We are using plain text version of regulatory database file (DB.txt)
which is maintained for use of CRDA. We are making sure that DB.txt file
is parsed properly and the database is added into MAC driver by parsing
the database file.

4) While running hostapd with full configuration for 802.11AC AP
settings, no error is seen for setting up the interface. Channel setting
is done for Auto-configuration and VHT settings are also applied in the
configuration file. The interface is not able to get up in 802.11 AC
mode, instead it is coming up only in 802.11 abgn only.

5) There is one error seen after firmware gets downloaded and starts
running. The error is as below:
ath10k_pci 0000:02:00.0: Direct firmware load for
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
Can this may create this issue to happen also?

Please find attached the DB.txt and hostapd configuration file for
reference.

Can anyone please help us in getting 802.11 AC mode up and running in
the radio.

"DISCLAIMER: This message is proprietary to Aricent and is intended solely for the use of the individual to whom it is addressed. It may contain privileged or confidential information and should not be circulated or used for any purpose other than for what it is intended. If you have received this message in error, please notify the originator immediately. If you are not the intended recipient, you are notified that you are strictly prohibited from using, copying, altering, or disclosing the contents of this message. Aricent accepts no responsibility for loss or damage arising from the use of the information transmitted by this email including damage from virus."

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
