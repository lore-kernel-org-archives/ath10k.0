Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJBW-0007cs-S6
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 07:55:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: Add support to provide higher range mem chunks
 in wmi init command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1551098926-24644-1-git-send-email-svishnoi@codeaurora.org>
References: <1551098926-24644-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190923075502.8F36C6047C@smtp.codeaurora.org>
Date: Mon, 23 Sep 2019 07:55:02 +0000 (UTC)
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

> With the current implementation of wmi init command,
> there is no provision for the host driver to provide mem
> chunks addresses with more than 32-bit, to the firmware.
> WCN3990 is a 35-bit target and can accept mem chunks addresses
> which are above 32-bit.
> 
> If firmware supports address range more than 32 bit, it
> advertises the support by setting the WMI_SERVICE_EXTEND_ADDRESS
> service. Based on this service fill the upper bits of paddr while
> providing the mem chunks in the wmi init command.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

40f4ef5e9232 ath10k: Add support to provide higher range mem chunks in wmi init command

-- 
https://patchwork.kernel.org/patch/10828535/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
