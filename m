Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0Ol-0006Em-Se
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:44:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: rx_duration update for fw_stats debugfs entry
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1552389470-28405-1-git-send-email-bpothuno@codeaurora.org>
References: <1552389470-28405-1-git-send-email-bpothuno@codeaurora.org>
Message-Id: <20190507134447.8F8E1609CD@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:44:47 +0000 (UTC)
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Balaji Pothunoori <bpothuno@codeaurora.org> wrote:

> Currently instant rx_duration always fetching as zero
> in fw_stats debugfs entry if extended peer stats event
> supports.
> 
> This patch updates instant rx_duration in fw_stats entry
> based on extended peer stats and maintaining backward
> compatibility for 10.2/10.x.
> 
> Tested HW: QCA9984.
> Tested FW: 10.4-3.6.0.1-00004.
> 
> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5c51875c0943 ath10k: rx_duration update for fw_stats debugfs entry

-- 
https://patchwork.kernel.org/patch/10849119/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
