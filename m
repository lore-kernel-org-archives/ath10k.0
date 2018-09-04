Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx3Yo-0005BW-MZ
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 05:07:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: Enable pktlog for WCN3990 target
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180828043642.14890-3-govinds@codeaurora.org>
References: <20180828043642.14890-3-govinds@codeaurora.org>
Message-Id: <20180904050720.5BC2F60708@smtp.codeaurora.org>
Date: Tue,  4 Sep 2018 05:07:20 +0000 (UTC)
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

> WCN3990 target uses separate htc service for pktlog.
> Add pktlog service request and support for pktlog
> rx path handling.
> 
> Testing:
>     Tested on WCN3990 and QCA6174 HW.
>     Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1,
>                WLAN.RM.4.4.1-00109-QCARMSWPZ-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This introduced a new sparse warning:

drivers/net/wireless/ath/ath10k/htc.c:875:6: warning: symbol 'ath10k_htc_pktlog_svc_supported' was not declared. Should it be static?

I fixed this in the pending branch.

-- 
https://patchwork.kernel.org/patch/10577869/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
