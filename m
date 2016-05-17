Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2ZEv-0001T7-00
 for ath10k@lists.infradead.org; Tue, 17 May 2016 07:16:25 +0000
Date: Tue, 17 May 2016 12:45:41 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v3 RESEND 1/2] ath10k: Add support for
 ath10k_sta_statistics support
Message-ID: <20160517071540.GA7972@atheros-ThinkPad-T61>
References: <1462204347-31012-1-git-send-email-mohammed@qca.qualcomm.com>
 <87ziru9ejj.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ziru9ejj.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

Hi Kalle,

On Fri, May 13, 2016 at 03:13:36PM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > Enable support for 'drv_sta_statistics' callback.
> > Export rx_duration support if available to cfg80211/nl80211
> >
> > This can also act as a placeholder for any new per STA stats support
> >
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > ---
> > [v3] removed conditions for ath10k state checks based on Michal's suggestion
> 
> It's nicer to ping than resend a patch. This patchset has been in
> "Awaiting Upstream" state while waiting for the dependencies trickle
> down to ath-next.

[shafi] sure, thanks ! will do this next time. I was afraid this patch got lost.

> 
> > Dependencies:
> >
> > 1. cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION (under review)
> 
> 739960f128e5 cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION
> 
> Currently in net-next, should come to ath-next soon.

[shafi] thanks for the info.

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
