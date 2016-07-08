Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPT7-0003vl-8x
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:40:57 +0000
MIME-Version: 1.0
Subject: Re: [v4,1/2] ath10k: Add support for ath10k_sta_statistics support
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1465890866-2390-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <8a33ff29139b4261936f5d7a5c0d9865@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:40:29 +0200
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
> Enable support for 'drv_sta_statistics' callback.
> Export rx_duration support if available to cfg80211/nl80211
> 
> This can also act as a placeholder for any new per STA stats support
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 2 patches applied to ath-next branch of ath.git:

120a1f02a5c4 ath10k: add support for ath10k_sta_statistics support
2ba1f3709452 ath10k: remove debugfs support for Per STA total rx duration

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9175135/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
