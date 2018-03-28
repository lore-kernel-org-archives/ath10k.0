Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1DCJ-0003NI-B0
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 15:41:12 +0000
MIME-Version: 1.0
Subject: Re: [v7,3/5] ath10k: Enable TDLS peer inactivity detection
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1508835074-3384-4-git-send-email-yintang@qti.qualcomm.com>
References: <1508835074-3384-4-git-send-email-yintang@qti.qualcomm.com>
Message-Id: <20180328154100.B431D60710@smtp.codeaurora.org>
Date: Wed, 28 Mar 2018 15:41:00 +0000 (UTC)
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
To: yintang@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

yintang@qti.qualcomm.com wrote:

> Enable TDLS peer inactivity detetion feature.
> QCA6174 firmware(version: WLAN.RM.4.4) support TDLS link inactivity detecting.
> Set related parameters in TDLS WMI command to enable this feature.
> 
> Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This patch added new ath10k-check warnings:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:460:48: warning: incorrect type in argument 2 (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:460:48:    expected unsigned int [unsigned] [usertype] vdev_id
drivers/net/wireless/ath/ath10k/wmi-tlv.c:460:48:    got restricted __le32 const [usertype] vdev_id
drivers/net/wireless/ath/ath10k/wmi-tlv.c:448:19: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/wmi-tlv.c:448:19: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/wmi-tlv.c:429:6: warning: symbol 'ath10k_wmi_event_tdls_peer' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/wmi-tlv.h:1767: Please don't use multiple blank lines

I fixed those in the pending branch.

-- 
https://patchwork.kernel.org/patch/10023743/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
