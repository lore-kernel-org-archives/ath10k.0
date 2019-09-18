Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAaGU-0007oD-Vb
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 13:45:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: correct wmi_tlv command params to enable
 pktlog for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558087516-666-3-git-send-email-aambure@codeaurora.org>
References: <1558087516-666-3-git-send-email-aambure@codeaurora.org>
Message-Id: <20190918134502.91240614C3@smtp.codeaurora.org>
Date: Wed, 18 Sep 2019 13:45:02 +0000 (UTC)
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
To: Abhishek Ambure <aambure@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Abhishek Ambure <aambure@codeaurora.org> wrote:

> PKT log enable command expects pdev id in enable params which is missing
> in current configuration. Fill pdev id in pkt log enable wmi command for
> correct configuration.
> 
> Fixes: ca996ec56608 ("ath10k: implement wmi-tlv backend")
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00963-QCAHLSWMTPL-1
> 
> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

How do I know this doesn't break QCA6174/QCA9377?

-- 
https://patchwork.kernel.org/patch/10947635/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
