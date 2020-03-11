Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4GA-0002XS-Es
 for ath10k@lists.infradead.org; Wed, 11 Mar 2020 16:31:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: avoid consecutive OTP download to reduce boot time
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1578378195-25780-1-git-send-email-mkenna@codeaurora.org>
References: <1578378195-25780-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200311163102.8C1E0C43636@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:31:02 +0000 (UTC)
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
Cc: Vikas Patel <vikpatel@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Currently, OTP is downloaded twice in case of "pre-cal-dt"
> and "pre-cal-file" to fetch the board ID and takes around
> ~2 sec more boot uptime.
> 
> First OTP download happens in "ath10k_core_probe_fw" and
> second in ath10k_core_start. First boot does not need OTP
> download in core start when valid board id acquired.
> 
> The second OTP download is required upon core stop/start.
> 
> This patch skips the OTP download when first OTP download
> has acquired a valid board id. This patch also marks board
> id invalid in "ath10k_core_stop", which will force the OTP
> download in ath10k_core_start and fetches valid board id.
> 
> Tested HW: QCA9984
> Tested FW: 10.4-3.6-00104
> 
> Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a4b9f641e858 ath10k: avoid consecutive OTP download to reduce boot time

-- 
https://patchwork.kernel.org/patch/11320473/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
