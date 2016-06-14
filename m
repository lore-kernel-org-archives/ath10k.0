Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCmy3-0000RS-6Q
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 11:57:15 +0000
MIME-Version: 1.0
Subject: Re: [v3,1/2] ath10k: remove duplicate and unused rx rate flags
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1464877482-14620-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <8c7494314722406d9af8328fdc51b1ba@euamsexm01a.eu.qualcomm.com>
Date: Tue, 14 Jun 2016 13:56:44 +0200
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
> All these flags are not used and their use is completely
> covered by 'ath10k_hw_rate_ofdm', 'ath10k_hw_rate_cck',
> and RX_PPDU_START_RATE_FLAG
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

9cd24451859a ath10k: remove duplicate and unused rx rate flags
5269c65900d9 ath10k: fix CCK h/w rates for QCA99X0 and newer chipsets

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9150143/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
