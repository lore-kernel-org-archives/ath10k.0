Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a2.mail.mailgun.net ([198.61.254.61])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWvu-0007G8-RJ
 for ath10k@lists.infradead.org; Wed, 02 Dec 2020 18:32:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/2] ath10k: Constify static qmi structs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201122234031.33432-3-rikard.falkeborn@gmail.com>
References: <20201122234031.33432-3-rikard.falkeborn@gmail.com>
Message-Id: <20201202183253.8FC69C43463@smtp.codeaurora.org>
Date: Wed,  2 Dec 2020 18:32:53 +0000 (UTC)
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
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Rikard Falkeborn <rikard.falkeborn@gmail.com> wrote:

> qmi_msg_handler[] and ath10k_qmi_ops are only used as input arguments
> to qmi_handle_init() which accepts const pointers to both qmi_ops and
> qmi_msg_handler. Make them const to allow the compiler to put them in
> read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ad37a46e8cb5 ath10k: Constify static qmi structs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201122234031.33432-3-rikard.falkeborn@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
