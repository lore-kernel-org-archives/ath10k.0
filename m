Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8Tyv-0008KS-8X
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 14:52:21 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix error while writing 'simulate_fw_crash' debugfs
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1464251262-4889-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <413fd4df25784a74af69dc37eceeefe0@euamsexm01a.eu.qualcomm.com>
Date: Thu, 2 Jun 2016 16:51:53 +0200
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Fix invalid argument error while writing 'simulate_fw_crash',
> though the funcionality is working fine we get an error 'invalid
> argument' because 'count' value is not returned properly
> (no reason to reduce the count value for removing the newline)
> 
> Fixes the below write error:
> 
> /sys/kernel/debug/ieee80211/phy0/ath10k# echo hw-restart >
> simulate_fw_crash
> -bash: echo: write error: Invalid argument
> 
> Also move the 'conf_mutex' as it is really not required for
> fetching the userspace buffer.
> 
> Reported-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

Thanks, 1 patch applied to ath.git:

f5e307515b2b ath10k: fix error while writing 'simulate_fw_crash' debugfs

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9136787/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
