Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFEgq-0004bt-2b
 for ath10k@lists.infradead.org; Wed, 24 Oct 2018 08:38:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next] ath10k: fix copy-paste error in
 ath10k_qmi_setup_msa_resources()
References: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
Date: Wed, 24 Oct 2018 11:38:41 +0300
In-Reply-To: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com> (Wei
 Yongjun's message of "Tue, 16 Oct 2018 02:35:16 +0000")
Message-ID: <871s8fu4by.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

> The return value from devm_memremap() is not checked correctly.
> The test is done against a wrong variable. This patch fix it.
>
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Please don't mark wireless patches for net-next, by default ath10k
patches go to ath-next branch of my ath.git tree. But no need to resend
because of this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
