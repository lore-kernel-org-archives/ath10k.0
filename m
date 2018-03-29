Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TQk-0003Bt-1i
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 09:01:13 +0000
MIME-Version: 1.0
Subject: Re: [v7,2/5] ath10k: Enable TDLS peer buffer STA feature
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1508835074-3384-3-git-send-email-yintang@qti.qualcomm.com>
References: <1508835074-3384-3-git-send-email-yintang@qti.qualcomm.com>
Message-Id: <20180329090059.5594060C64@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 09:00:59 +0000 (UTC)
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
To: yintang@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

yintang@qti.qualcomm.com wrote:

> Enable TDLS peer buffer STA feature.
> QCA6174 firmware(version: WLAN.RM.4.4) support TDLS peer buffer STA,
> it reports this capability through wmi service map in wmi service ready
> event. Set related parameter in TDLS WMI command to enable this feature.
> 
> Signed-off-by: Yingying Tang <yintang@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

802ca335496e ath10k: enable TDLS peer buffer STA feature
4c9f8d114660 ath10k: enable TDLS peer inactivity detection
c3816c9ee12c ath10k: avoid to set WEP key for TDLS peer
9cdd00575029 ath10k: fix TDLS peer TX data failure issue on encryped AP

-- 
https://patchwork.kernel.org/patch/10023753/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
