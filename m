Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwdb-0004Ij-Pm
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 15:56:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Introduce CE_ATTR_POLL attribute for polling
 pipe
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180828043642.14890-2-govinds@codeaurora.org>
References: <20180828043642.14890-2-govinds@codeaurora.org>
Message-Id: <20180906155557.85A9C6038E@smtp.codeaurora.org>
Date: Thu,  6 Sep 2018 15:55:57 +0000 (UTC)
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

> Existing copy engine interrupt enable logic assumes that last
> CE is using polling mode and due to this interrupt for last copy engine
> are always disabled. WCN3990 uses last CE for pktlog and
> interrupt remains disabled with existing logic.
> 
> To mitigate this issue, introduce CE_ATTR_POLL flag and control
> the interrupt based on the flag which can be set in ce_attr.
> 
> Testing:
>     Tested on WCN3990 and QCA6174 HW.
>     Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1,
>                WLAN.RM.4.4.1-00109-QCARMSWPZ-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

9abcb9371bcc ath10k: introduce CE_ATTR_POLL attribute for polling pipe
713358c321f4 ath10k: enable pktlog for WCN3990 target

-- 
https://patchwork.kernel.org/patch/10577867/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
