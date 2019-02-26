Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycPg-0006X4-9O
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 13:04:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix length of wmi tlv command for protected mgmt
 frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550243977-8612-1-git-send-email-svishnoi@codeaurora.org>
References: <1550243977-8612-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190226130447.B8FCB60E5A@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 13:04:47 +0000 (UTC)
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

> The length of wmi tlv command for management tx send is calculated
> incorrectly in case of protected management frames as there is addition
> of IEEE80211_CCMP_MIC_LEN twice. This leads to improper behaviour of
> firmware as the wmi tlv mgmt tx send command for protected mgmt frames
> is formed wrongly.
> 
> Fix the length calculation of wmi tlv command for mgmt tx send in case
> of protected management frames by adding the IEEE80211_CCMP_MIC_LEN only
> once.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Fixes: 1807da49733e "ath10k: wmi: add management tx by reference support over wmi"
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

761156ff573d ath10k: Fix length of wmi tlv command for protected mgmt frames

-- 
https://patchwork.kernel.org/patch/10815099/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
