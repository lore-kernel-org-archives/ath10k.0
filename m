Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkf2-0002f2-JH
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:28:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] ath10k: update HOST capability qmi message
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190204115555.17052-1-govinds@codeaurora.org>
References: <20190204115555.17052-1-govinds@codeaurora.org>
Message-Id: <20190207142815.CE582609C2@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:28:15 +0000 (UTC)
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

> HOST capability interface data structures are updated
> in HL3.1 fw version. Update the qmi host capability
> members for compatibility across different firmware
> versions.
> Since this change breaks backward compatibility with
> HL2.0 fw, HL2.0 fw upgrade to WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> or later version is required.
> 
> Testing:
>         Tested on QCS404 platform(WCN3990 HW).
>         Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1,
>                    WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

768ec4c012ac ath10k: update HOST capability qmi message

-- 
https://patchwork.kernel.org/patch/10795465/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
