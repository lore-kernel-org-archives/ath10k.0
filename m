Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0qJE-0000vt-SN
 for ath10k@lists.infradead.org; Wed, 19 Apr 2017 14:10:23 +0000
MIME-Version: 1.0
Subject: Re: ath: Fix updating radar flags for coutry code India
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1492019377-5556-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1492019377-5556-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <be61b7a7dfe14b338d7c8fef2f3d1ef4@euamsexm01a.eu.qualcomm.com>
Date: Wed, 19 Apr 2017 16:09:49 +0200
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> As per latest regulatory update for India, channel 52, 56, 60, 64
> is no longer restricted to DFS. Enabling DFS/no infra flags in driver
> results in applying all DFS related restrictions (like doing CAC etc
> before this channel moves to 'available state') for these channels
> even though the country code is programmed as 'India' in he hardware,
> fix this by relaxing the frequency range while applying RADAR flags
> only if the country code is programmed to India. If the frequency range
> needs to modified based on different country code, ath_is_radar_freq
> can be extended/modified dynamically.
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

c0c345d4cacc ath: Fix updating radar flags for coutry code India

-- 
https://patchwork.kernel.org/patch/9678079/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
