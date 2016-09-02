Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqpk-0007wi-Ud
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:56:49 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Added support for extended dbglog module id for 10.4
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1471946736-28214-1-git-send-email-c_mkenna@qti.qualcomm.com>
Message-ID: <7b55a733bcc0414f93030e89e0fb5cbe@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:56:21 +0200
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
To: c_mkenna@qti.qualcomm.com
Cc: mkenna@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

c_mkenna@qti.qualcomm.com wrote:
> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> 
> For 10.4 fw versions, dbglog module id has been extended from u32
> to u64, hence this patch fixes the same in the ath10k driver side.
> 
> This patch doesn't break the older 10.4 releases. The FW change
> is already present in the older FWs.
> 
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

afcbc82cea52 ath10k: Added support for extended dbglog module id for 10.4

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9295361/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
