Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJeW2-00026F-Hb
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 13:02:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] ath10k: Disable interface pause wow config for
 integrated chipset
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181012094938.14734-3-govinds@codeaurora.org>
References: <20181012094938.14734-3-govinds@codeaurora.org>
Message-Id: <20181105130151.D29FF60A98@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 13:01:51 +0000 (UTC)
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

This introduced a new warning:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:3263:41: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3263:41:    expected restricted __le32 [usertype] pause_iface_config
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3263:41:    got int

I fixed it in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=22aab99eaf71dadc3cf2e8a2b982986a40ca641e

-- 
https://patchwork.kernel.org/patch/10638235/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
