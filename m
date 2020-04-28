Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tynnyri.adurom.net ([51.15.11.48])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOwB-0002dn-RA
 for ath10k@lists.infradead.org; Tue, 28 Apr 2020 12:02:09 +0000
From: Kalle Valo <kvalo@adurom.com>
Subject: Re: Poor link speeds and signal strength on Qualcomm QCA 9377
References: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
Date: Tue, 28 Apr 2020 14:59:47 +0300
In-Reply-To: <CALY5VB38LT_FNRj5mdvgSJ0YVb6fHyOSM5dJfN8Kdzsuk5wTvA@mail.gmail.com>
 (Arvind Bakshi's message of "Sat, 25 Apr 2020 05:39:08 +0530")
Message-ID: <87blnbizws.fsf@tynnyri.adurom.net>
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
To: Arvind Bakshi <arvindbakshicool@gmail.com>
Cc: ath10k@lists.infradead.org

Arvind Bakshi <arvindbakshicool@gmail.com> writes:

> Getting 1 mbps link speed and average signal strength, even on
> standing next to router on every linux distro whereas windows 10 gives
> 150 mbps link speeds and excellent signal strength even standing quite
> far off from router. Tested on Fedora 30/31 and ubuntu 18.04/20.04.
> Turning off wireless power management : sudo iwconfig wlan0 power off
> doesn't make a difference.
> Turning off all power saving options using TLP also doesn't make a difference.
> Software (OS, Firmware version, kernel, driver, etc)
> Tested on Fedora 30/31 and ubuntu 18.04 LTS
> Wifi card: Qualcomm QCA 9377
> Device: Dell Vostro 3468 (shipped with ubuntu 16.04)
>
> Hardware (NIC chipset, platform, etc)
> Qualcomm QCA 9377

My first guess is a problem with calibration data, for example using
wrong board data file (which are device specific). Unfortunately I don't
know what would be the correct board data file for your device, ath10k
is supposed to choose it automatically but we don't always have all
board data files available.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
