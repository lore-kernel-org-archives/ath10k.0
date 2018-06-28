Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYThU-0005TH-R1
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 09:59:15 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: rename HTC_HOST_MAX_MSG_PER_BUNDLE define
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180615120423.4963-1-erik.stromdahl@gmail.com>
References: <20180615120423.4963-1-erik.stromdahl@gmail.com>
Message-Id: <20180628095842.7FEC560B1E@smtp.codeaurora.org>
Date: Thu, 28 Jun 2018 09:58:42 +0000 (UTC)
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> This define is only used for RX bundling so it is more descriptive if
> RX is added to the define-name.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

ab687de9535c ath10k: rename HTC_HOST_MAX_MSG_PER_BUNDLE define
e4568eac0464 ath10k: replace hardcoded constant with define

-- 
https://patchwork.kernel.org/patch/10466281/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
