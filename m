Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jf2K8-0006Q8-Pb
 for ath10k@lists.infradead.org; Sat, 30 May 2020 14:18:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Remove ath10k_qmi_register_service_notifier()
 declaration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200528122105.1.I31937dce728b441fd72cbe23447bc4710fd56ddb@changeid>
References: <20200528122105.1.I31937dce728b441fd72cbe23447bc4710fd56ddb@changeid>
Message-Id: <20200530141844.4FA7DC43391@smtp.codeaurora.org>
Date: Sat, 30 May 2020 14:18:44 +0000 (UTC)
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
To: Douglas Anderson <dianders@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Douglas Anderson <dianders@chromium.org> wrote:

> The ath10k/qmi.h header file contains a declaration for the function
> ath10k_qmi_register_service_notifier().  This function doesn't exist.
> Remove the declaration.
> 
> This patch is a no-op and was just found by code inspection.
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

23cc6bb5a2e6 ath10k: Remove ath10k_qmi_register_service_notifier() declaration

-- 
https://patchwork.kernel.org/patch/11576663/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
