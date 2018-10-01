Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6yg2-0002vw-M0
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 13:56:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: add default value for num_peers in WMI TLV
 init
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180913144506.8272-1-erik.stromdahl@gmail.com>
References: <20180913144506.8272-1-erik.stromdahl@gmail.com>
Message-Id: <20181001135548.6441860376@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 13:55:48 +0000 (UTC)
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

> The hw_params value will only be used if it was explicitly set in the
> global hw_params array.
> 
> This makes it possible to have the num_peers member unset.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

8e8374db3424 ath10k: add default value for num_peers in WMI TLV init
08fafd646d63 ath10k: remove num_peers in hw_params for most targets

-- 
https://patchwork.kernel.org/patch/10599685/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
