Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0LZ-0005zv-SZ
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:41:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Modify CE4 src buffer entries to 2048 for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190302043605.27626-1-govinds@codeaurora.org>
References: <20190302043605.27626-1-govinds@codeaurora.org>
Message-Id: <20190507134129.4714A60A44@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:41:29 +0000 (UTC)
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

> CE4 is host to target HTT tx pipe, tx completion are not served
> on time when CPU is loaded and this cause ce src ring full condition
> due to less no of src buffer entries.
> 
> To mitigate the issue increase CE4 src buffer entries to 2048.
> 
> Testing:
>         Tested on QCS404 platform(WCN3990 HW)
>         Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

889ab61d9dc1 ath10k: Modify CE4 src buffer entries to 2048 for WCN3990

-- 
https://patchwork.kernel.org/patch/10836431/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
