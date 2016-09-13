Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjlRW-0008GR-PE
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 11:00:01 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k mesh + ap + encryption?
Date: Tue, 13 Sep 2016 10:59:31 +0000
Message-ID: <87h99kjca5.fsf@kamboji.qca.qualcomm.com>
References: <2661831.slnB0LOeVt@prime>
In-Reply-To: <2661831.slnB0LOeVt@prime> (Simon Wunderlich's message of "Tue,
 13 Sep 2016 10:00:23 +0200")
Content-Language: en-US
Content-ID: <8A14AF9FAA457841BF63A7A66DB36983@qualcomm.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Simon Wunderlich <sw@simonwunderlich.de> writes:

> we have done some experiments last week on ath10k, trying to run mesh 
> (802.11s) and access point at the same time, both encrypted. 
>
> We have tested a recent LEDE (reboot-1519-g42f559e) but with 
> firmware-5.bin_10.2.4.70.42-2 and the included wpa_supplicant, which gave us a 
> working encrypted 802.11s network. However, starting an AP at the same time 
> didn't work (AP doesn't beacon). This wasn't a problem when 802.11s was 
> running unencrypted.
>
> We also tested version 10.2.4.97 (from codeaurora), which is now default in 
> LEDE. However, this version apparently doesn't support 11s mesh at all 
> (WMI_SERVICE_MESH_11S is disabled in the service map, but cfg/mac80211 
> advertises support).
>
> So here are my questions:
>
>  * Did anyone succesfully run AP and mesh, both encrypted at the same time?
>  * Do you have any pointers how we could fix this? Could it be fixable in the 
> driver (i.e. not in firmware)?
>  * Does anyone have an idea if 11s will be supported in future versions? I 
> didn't find any changelogs, but having 11s mode no longer in the service map 
> does not make me optimistic.

Why is LEDE using 10.2.4.97? It seems to be a quite old release and I
have no knowledge if anyone even tests that firmware branch with ath10k.
I recommend to only use firmware releases from ath10k-firmware.git as we
use those internally with ath10k. In any case, don't make any
assumptions about future from that firmware branch as it's so old.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
