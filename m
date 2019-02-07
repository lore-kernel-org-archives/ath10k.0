Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grm7L-0001qN-GR
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 16:01:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/3] ath10k: Disable interface pause wow config for
 integrated chipset
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190206121433.11606-3-govinds@codeaurora.org>
References: <20190206121433.11606-3-govinds@codeaurora.org>
Message-Id: <20190207160135.3D16F6047C@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 16:01:35 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> wow pause iface config controls the PCI D0/D3-WOW cases for pcie
> bus state. Firmware does not expects WOW_IFACE_PAUSE_ENABLED config
> for bus/link that cannot be suspended ex:snoc and does not trigger
> common subsystem shutdown.
> Disable interface pause wow config for integrated chipset(WCN3990)
> for correct WOW configuration in the firmware.
> 
> Testing:
>     Tested on WCN3990 HW.
>     Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This issued a new warning:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:3327:41: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3327:41:    expected restricted __le32 [usertype] pause_iface_config
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3327:41:    got int

I fixed it in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f21da752a87f8fefdf97fcef565adce9c778fc5e

-- 
https://patchwork.kernel.org/patch/10799253/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
