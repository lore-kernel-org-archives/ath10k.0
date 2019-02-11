Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtETv-00029G-OC
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 16:30:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] ath10k: Enable bus layer suspend/resume for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190206121433.11606-2-govinds@codeaurora.org>
References: <20190206121433.11606-2-govinds@codeaurora.org>
Message-Id: <20190211163055.3F3E16121D@smtp.codeaurora.org>
Date: Mon, 11 Feb 2019 16:30:55 +0000 (UTC)
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

> Register snoc bus layer suspend/resume PM ops and configure
> the wakeup source(CE2) for the device.
> 
> Testing:
>     Tested on WCN3990 HW.
>     Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

185be1c66469 ath10k: enable bus layer suspend/resume for WCN3990
de8781d7e74d ath10k: disable interface pause wow config for integrated chipset
c40e448e0bcf ath10k: request credit report if flow control enabled on ep

-- 
https://patchwork.kernel.org/patch/10799247/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
