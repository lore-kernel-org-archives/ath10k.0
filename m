Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUPX-0002h8-1x
 for ath10k@lists.infradead.org; Mon, 06 Apr 2020 16:15:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix the race condition in firmware dump work queue
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585213077-28439-1-git-send-email-mkenna@codeaurora.org>
References: <1585213077-28439-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200406161524.5C6C9C43637@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 16:15:24 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> There is a race condition, when the user writes 'hw-restart' and
> 'hard' in the simulate_fw_crash debugfs file without any delay.
> In the above scenario, the firmware dump work queue(scheduled by
> 'hard') should be handled gracefully, while the target is in the
> 'hw-restart'.
> 
> Tested HW: QCA9984
> Tested FW: 10.4-3.9.0.2-00044
> 
> Co-developed-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3d1c60460fb2 ath10k: Fix the race condition in firmware dump work queue

-- 
https://patchwork.kernel.org/patch/11459703/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
