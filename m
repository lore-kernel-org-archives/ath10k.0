Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cye7v-000892-S7
 for ath10k@lists.infradead.org; Thu, 13 Apr 2017 12:45:34 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix compile time sanity check for CE4 buffer size
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1491324776-8418-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1491324776-8418-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <fb36131b433b45d282e6d7c09d309380@euamsexm01a.eu.qualcomm.com>
Date: Thu, 13 Apr 2017 14:45:02 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> In 'ath10k_ce_alloc_pipe' the compile time sanity check to
> ensure that there is sufficient buffers in CE4 for HTT Tx
> MSDU descriptors, but this did not take into account of the
> case with 'peer flow control' enabled, fix this.
> 
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

62ca0690cd49 ath10k: fix compile time sanity check for CE4 buffer size

-- 
https://patchwork.kernel.org/patch/9662059/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
