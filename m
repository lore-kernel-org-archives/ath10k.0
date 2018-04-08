Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f55a0-0007nJ-Bm
 for ath10k@lists.infradead.org; Sun, 08 Apr 2018 08:21:42 +0000
Date: Sun, 8 Apr 2018 10:21:21 +0200
From: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
Message-ID: <20180408102121.63d010bd@mir>
In-Reply-To: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org

Hi

On 2018-04-06, Kalle Valo wrote:
> From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
> 
> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984 based
> chipsets with on chipset connected led's using WMI Firmware API.  The LED
> device will get available named as "ath10k-phyX" at sysfs and can be controlled
> with various triggers.  adds also debugfs interface for gpio control.
> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
> [kvalo: major reorg and cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Tested-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>

[...]

I've been able to test v13 of this patch, including the changes regarding 
removing ath10k_leds_start() and moving the ath10k_wmi_gpio_config() call
into ath10k_leds_set_brightness_blocking() as raised by Sebastian 
Gottschall, on a ZyXEL NBG6817 (using two QCA9984 wlan cards and firmware 
10.4-3.5.3-00053) running OpenWrt/ master r6644-eda27d7557 (ipq8065, 
kernel 4.9.92 with backports wt-2017-11-01-0-gfe248fc2c180/ 
v4.14-rc2-1-31-g86cf0e5d).

/sys/class/leds/ath10k-phy0/ and /sys/class/leds/ath10k-phy1/ are
registered correctly and the white wlan LEDs connected to the ath10k 
GPIOs are now working as designed (controlled via phy0tpt/ phy1tpt).

Thanks a lot to everyone involved!

Regards
	Stefan Lippers-Hollmann

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
