Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtFq-0004it-Nf
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:13:39 +0000
MIME-Version: 1.0
Subject: Re: [V2] ath10k: fix incorrect txpower set by P2P_DEVICE interface
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1481669719-3423-1-git-send-email-ryanhsu@qca.qualcomm.com>
References: <1481669719-3423-1-git-send-email-ryanhsu@qca.qualcomm.com>
Message-ID: <e5044151a04d4f82a4c07c9e06369ea8@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:13:11 +0100
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ryan Hsu <ryanhsu@qca.qualcomm.com> wrote:
> From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> 
> Ath10k reports the phy capability that supports P2P_DEVICE interface.
> 
> When we use the P2P supported wpa_supplicant to start connection, it'll
> create two interfaces, one is wlan0 (vdev_id=0) and one is P2P_DEVICE
> p2p-dev-wlan0 which is for p2p control channel (vdev_id=1).
> 
> 	ath10k_pci mac vdev create 0 (add interface) type 2 subtype 0
> 	ath10k_add_interface: vdev_id: 0, txpower: 0, bss_power: 0
> 	...
> 	ath10k_pci mac vdev create 1 (add interface) type 2 subtype 1
> 	ath10k_add_interface: vdev_id: 1, txpower: 0, bss_power: 0
> 
> And the txpower in per vif bss_conf will only be set to valid tx power when
> the interface is assigned with channel_ctx.
> 
> But this P2P_DEVICE interface will never be used for any connection, so
> that the uninitialized bss_conf.txpower=0 is assinged to the
> arvif->txpower when interface created.
> 
> Since the txpower configuration is firmware per physical interface.
> So the smallest txpower of all vifs will be the one limit the tx power
> of the physical device, that causing the low txpower issue on other
> active interfaces.
> 
> 	wlan0: Limiting TX power to 21 (24 - 3) dBm
> 	ath10k_pci mac vdev_id 0 txpower 21
> 	ath10k_mac_txpower_recalc: vdev_id: 1, txpower: 0
> 	ath10k_mac_txpower_recalc: vdev_id: 0, txpower: 21
> 	ath10k_pci mac txpower 0
> 
> This issue only happens when we use the wpa_supplicant that supports
> P2P or if we use the iw tool to create the control P2P_DEVICE interface.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

88407beb1b14 ath10k: fix incorrect txpower set by P2P_DEVICE interface

-- 
https://patchwork.kernel.org/patch/9473309/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
