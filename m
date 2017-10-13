Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2yvh-0002Zn-MX
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 12:19:08 +0000
MIME-Version: 1.0
Subject: Re: [2/2] ath10k: handle tdls peer events
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1507618202-25473-3-git-send-email-mpubbise@qti.qualcomm.com>
References: <1507618202-25473-3-git-send-email-mpubbise@qti.qualcomm.com>
Message-ID: <e1bed0a347cf4ce0a1c538b99852398a@euamsexm01e.eu.qualcomm.com>
Date: Fri, 13 Oct 2017 14:18:26 +0200
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
To: mpubbise@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

mpubbise@qti.qualcomm.com wrote:

> Handle tdls peer events from the target. TDLS events for the peer
> could be discover, teardown, etc. As of now, adding the logic to
> handle tdls teardown events alone.
> 
> Teardown due to peer traffic indication(PTR) timeout is one such
> teardown event from the target.
> 
> Tested this change on QCA9888 with 10.4-3.5.1-00018 fw version.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

This patch introduces new warnings:

$ ath10k-check
drivers/net/wireless/ath/ath10k/wmi.c:4470:39: warning: incorrect type in argument 2 (different base types)
drivers/net/wireless/ath/ath10k/wmi.c:4470:39:    expected int [signed] vdev_id
drivers/net/wireless/ath/ath10k/wmi.c:4470:39:    got restricted __le32 [usertype] vdev_id
drivers/net/wireless/ath/ath10k/wmi.c:4481:27: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/wmi.c:4481:27: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/wmi.c:4481:27: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/wmi.c:4492:48: warning: incorrect type in argument 2 (different base types)
drivers/net/wireless/ath/ath10k/wmi.c:4492:48:    expected unsigned int [unsigned] [usertype] vdev_id
drivers/net/wireless/ath/ath10k/wmi.c:4492:48:    got restricted __le32 [usertype] vdev_id
drivers/net/wireless/ath/ath10k/wmi.c:4479:19: warning: restricted __le32 degrades to integer
drivers/net/wireless/ath/ath10k/wmi.c:4460:6: warning: symbol 'ath10k_wmi_handle_tdls_peer_event' was not declared. Should it be static?

-- 
https://patchwork.kernel.org/patch/9995131/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
