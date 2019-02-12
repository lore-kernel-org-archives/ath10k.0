Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtd6t-0006FB-D9
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 18:48:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: report tx airtime provided by fw
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1542298483-15879-1-git-send-email-mpubbise@codeaurora.org>
References: <1542298483-15879-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20190212184846.8F5F5608A5@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 18:48:46 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> If supported, update transmit airtime in mac80211 with the airtime
> values reported by the firmware. TX airtime of the PPDU is reported
> via HTT data TX completion indication message.
> 
> A new service flag 'WMI_SERVICE_REPORT_AIRTIME' is added to advertise
> the firmware support. For firmwares which do not support this feature,
> TX airtime is calculated in the driver using TX bitrate.
> 
> Hardwares tested : QCA9984
> Firmwares tested : 10.4-3.6.1-00841
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bb31b7cb106c ath10k: report tx airtime provided by fw

-- 
https://patchwork.kernel.org/patch/10684687/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
