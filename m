Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSDX6-0001JK-S0
 for ath10k@lists.infradead.org; Sat, 25 Apr 2020 05:39:22 +0000
Received: by mail-ot1-x335.google.com with SMTP id z17so16501091oto.4
 for <ath10k@lists.infradead.org>; Fri, 24 Apr 2020 22:39:20 -0700 (PDT)
MIME-Version: 1.0
From: Arvind Bakshi <arvindbakshicool@gmail.com>
Date: Sat, 25 Apr 2020 05:39:08 +0530
Message-ID: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
Subject: Poor link speeds and signal strength on Qualcomm QCA 9377
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

Sir/Mam

Getting 1 mbps link speed and average signal strength, even on
standing next to router on every linux distro whereas windows 10 gives
150 mbps link speeds and excellent signal strength even standing quite
far off from router. Tested on Fedora 30/31 and ubuntu 18.04/20.04.
Turning off wireless power management : sudo iwconfig wlan0 power off
doesn't make a difference.
Turning off all power saving options using TLP also doesn't make a difference.
Software (OS, Firmware version, kernel, driver, etc)
Tested on Fedora 30/31 and ubuntu 18.04 LTS
Wifi card: Qualcomm QCA 9377
Device: Dell Vostro 3468 (shipped with ubuntu 16.04)

Hardware (NIC chipset, platform, etc)
Qualcomm QCA 9377



Please provide driver fix for this wireless card.

Thanks & Regards

Arvind Bakshi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
