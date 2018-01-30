Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [196.1.105.47] (helo=sandesh.cdotd.ernet.in)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1egTBP-0005zS-MK
 for ath10k@lists.infradead.org; Tue, 30 Jan 2018 10:30:41 +0000
Received: from universe.cdot.in (universe.cdotb.ernet.in [49.128.111.121])
 by sandesh.cdotd.ernet.in (Postfix) with ESMTP id E3B8F1DDE3E9
 for <ath10k@lists.infradead.org>; Tue, 30 Jan 2018 15:59:03 +0530 (IST)
Received: from cdot.in (localhost [127.0.0.1])
 by universe.cdot.in (8.14.4/8.13.1) with ESMTP id w0UAJqHU019504
 for <ath10k@lists.infradead.org>; Tue, 30 Jan 2018 15:49:52 +0530
From: "KAVITA MATHUR" <kavitam@cdot.in>
Subject: Single rate issues in QCA988x based device
Date: Tue, 30 Jan 2018 15:49:52 +0530
Message-Id: <20180130100836.M97427@cdot.in>
In-Reply-To: <20180129043829.M97408@cdot.in>
References: <CALGY4fvrNGKtbtLBkvWcTSVbZcK9OaBRWs5KTrKDdf-cFbHbZg@mail.gmail.com>
 <20180129043829.M97408@cdot.in>
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
To: ath10k@lists.infradead.org

Hi,

WLE600VX (2x2 MIMO, QCA9888x chipset) is used as WiFi module in my access point. I am
working on certification project of this system, there I need to fix single rate in all
the legacy, HT and VHT modes for 20MHz and 40MHz channels.

There are two problems observed during this test:

1. 9Mbps legacy rate is always set to 24Mbps in g mode. While in a mode it is set as
9Mbps.What can be the issue, firmware or driver? any suggestions to see this issue?

2. Not able to set Short GI for 40MHz channels for all the MCS except MCS 7 and 15. What
cab be the reason for this. again, where should I suspect?..firmware or driver? Please
help on this.


ath10k version : git 16 oct 2017(v4.14-rc2-1-24-gc6db471)
firmware version : firmware-5.bin_10.2.4.70.66
Kernel version : 3.12


Thanks & Regards,
Kavita

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
