Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbJKX-0005tj-UN
 for ath10k@lists.infradead.org; Wed, 20 May 2020 07:40:00 +0000
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <2468724.JaAZLprVu6@bentobox>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
Date: Wed, 20 May 2020 09:39:45 +0200
MIME-Version: 1.0
In-Reply-To: <2468724.JaAZLprVu6@bentobox>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Ansuel Smith <ansuelsmth@gmail.com>, openwrt-devel@lists.openwrt.org
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

this code is not in use in its original form for ipq4019.
i have seen that his patch is also dropped from ath.git but is still in 
use by openwrt.
could somone clarify the state here and why it was dropped?
the original patch i wrote does exclude the soc chipsets, but the patch 
was later reorganized and some part have been rewritten
so i'm not sure if it covers the scenario mentioned here, which i did 
take care of

Sebastian

Am 26.02.2019 um 10:16 schrieb Sven Eckelmann:
> On Friday, 6 April 2018 17:17:55 CET Kalle Valo wrote:
>> From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
>>
>> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984 based
>> chipsets with on chipset connected led's using WMI Firmware API.  The LED
>> device will get available named as "ath10k-phyX" at sysfs and can be controlled
>> with various triggers.  adds also debugfs interface for gpio control.
>>
>> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
>> [kvalo: major reorg and cleanup]
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> This patch was imported to OpenWrt in commit 61d57a2f88b9 ("mac80211: ath10k
> add leds support") and broke the 11s support for IPQ4019 and QCA4019 (5GHz)
> firmware versions 10.4-3.5.3-00053, 10.4-3.5.3-00057, 10.4-3.6-00140:
>
>      [  221.620803] ath10k_pci 0000:01:00.0: wmi command 36967 timeout, restarting hardware
>      [  221.744056] ieee80211 phy0: Hardware restart was requested
>      [  225.130829] ath10k_pci 0000:01:00.0: failed to receive control response completion, polling..
>      [  226.170824] ath10k_pci 0000:01:00.0: Service connect timeout
>      [  226.170871] ath10k_pci 0000:01:00.0: failed to connect htt (-110)
>      [  226.252248] ath10k_pci 0000:01:00.0: Could not init core: -110
>
> This was tested on an A62 with following wireless config:
>
>      config wifi-device 'radio0'
>              option type 'mac80211'
>              option channel '36'
>              option hwmode '11a'
>              option path 'soc/40000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0'
>              option htmode 'VHT80'
>              option disabled '0'
>              option country US
>      
>      config wifi-device 'radio1'
>              option type 'mac80211'
>              option channel '11'
>              option hwmode '11g'
>              option path 'platform/soc/a000000.wifi'
>              option htmode 'HT20'
>              option disabled '0'
>              option country US
>      
>      config wifi-device 'radio2'
>              option type 'mac80211'
>              option channel '149'
>              option hwmode '11a'
>              option path 'platform/soc/a800000.wifi'
>              option htmode 'VHT80'
>              option disabled '0'
>              option country US
>      
>      config wifi-iface 'mesh0'
>          option device 'radio0'
>          option ifname 'mesh0'
>          option network 'nwi_mesh0'
>          option mode 'mesh'
>          option mesh_id 'TestMesh'
>          option mesh_fwding '1'
>          option encryption 'none'
>      
>      config wifi-iface 'mesh1'
>          option device 'radio1'
>          option ifname 'mesh1'
>          option network 'nwi_mesh1'
>          option mode 'mesh'
>          option mesh_id 'TestMesh'
>          option encryption 'none'
>      
>      
>      config wifi-iface 'mesh2'
>          option device 'radio2'
>          option ifname 'mesh2'
>          option network 'nwi_mesh2'
>          option mode 'mesh'
>          option mesh_id 'TestMesh'
>          option mesh_fwding '1'
>          option encryption 'none
>
> Kind regards,
> 	Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
