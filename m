Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl7T-0005nv-8L
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:57:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add a condtion to fill the LDPC capability
 correctly
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548999262-25353-1-git-send-email-svishnoi@codeaurora.org>
References: <1548999262-25353-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190207145738.E76C760264@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:57:38 +0000 (UTC)
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:

> The firmware advertises the LDPC support information for HT in
> HT capability info in the wmi service ready event. To provide
> granularity, firmware now advertises WMI_HT_CAP_RX_LDPC and
> WMI_HT_CAP_TX_LDPC separately. To support LDPC, host should
> also check for WMI_HT_CAP_RX_LDPC and WMI_HT_CAP_TX_LDPC in HT
> capabilities.
> 
> Add a condition to existing logic in host to know whether firmware
> supports LDPC or not.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1,
>            WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ff488d0ef1c2 ath10k: add a condition to fill the LDPC capability correctly

-- 
https://patchwork.kernel.org/patch/10791807/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
