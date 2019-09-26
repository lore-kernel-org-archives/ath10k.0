Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDUHZ-00073b-9j
 for ath10k@lists.infradead.org; Thu, 26 Sep 2019 13:58:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:New interface to get interface combinations from FW
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1562050742-8741-1-git-send-email-zhonglin@codeaurora.org>
References: <1562050742-8741-1-git-send-email-zhonglin@codeaurora.org>
Message-Id: <20190926135808.553946115D@smtp.codeaurora.org>
Date: Thu, 26 Sep 2019 13:58:08 +0000 (UTC)
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
To: Zhonglin Zhang <zhonglin@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Zhonglin Zhang <zhonglin@codeaurora.org> wrote:

> New wmi event "WMI_TLV_IFACE_COMBINATION_EVENTID" is used.
> If WMI_SERVICE_IFACE_COMBINATION_SUPPORT service bit set and
> WMI_TLV_IFACE_COMBINATION_EVENTID event got from FW side, then
> interface combinations reported from FW will override the default
> combinations which is hard-coded in host drivers.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-01061-QCAHLSWMTPL-1
> 
> Signed-off-by: Zhonglin Zhang <zhonglin@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This introduced a new warning:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:556:41: warning: incorrect type in argument 1 (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:556:41:    expected unsigned long [usertype] n
drivers/net/wireless/ath/ath10k/wmi-tlv.c:556:41:    got restricted __le32 [usertype] limits_n

I fixed that in the pending branch.

-- 
https://patchwork.kernel.org/patch/11027361/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
