Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtd9R-0001oW-J1
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 18:51:27 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] ath10k: add missing values to wmi_service_name()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
References: <1549897787-28537-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190212185125.4C0266074F@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 18:51:25 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> After implementing the next patch GCC reported:
> 
> drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_BTCOEX' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_MGMT_TX_WMI' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_SPOOF_MAC_SUPPORT' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_BB_TIMING_CONFIG_SUPPORT' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/wmi.h:385:2: warning: enumeration value 'WMI_SERVICE_THERM_THROT' not handled in switch [-Wswitch]
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

6 patches applied to ath-next branch of ath.git, thanks.

2321dd5d78fb ath10k: add missing values to wmi_service_name()
95cccf4d79fe ath10k: make wmi_service_name() warn about missing service ids
db3b6280f5f1 ath10k: change wmi.h to include only ieee80211.h
385bd8816cb5 ath10k: align ath10k_htt_txbuf structures
bdf2bd9aa684 ath10k: fix documentation in ath10k_wow_convert_8023_to_80211()
01dc76dfdc91 ath10k: copy the whole struct ath10k_bus_params in ath10k_core_register()

-- 
https://patchwork.kernel.org/patch/10806063/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
