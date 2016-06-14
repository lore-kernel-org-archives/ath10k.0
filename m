Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCqAD-0007s7-GW
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 15:22:02 +0000
Date: Tue, 14 Jun 2016 20:51:31 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: Add support for ath10k_sta_statistics
 support
Message-ID: <20160614152131.GA3941@atheros-ThinkPad-T61>
References: <1465890866-2390-1-git-send-email-mohammed@qca.qualcomm.com>
 <87k2hr3m9r.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k2hr3m9r.fsf@kamboji.qca.qualcomm.com>
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

On Tue, Jun 14, 2016 at 01:58:25PM +0000, Valo, Kalle wrote:
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
> >
> > [v4] rebased over 'pending' branch
> > [v3] removed conditions for ath10k state checks based on Michal's suggestion
> >
> > Both the dependent changes are merged now in master tree
> >
> > 1. cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION
> > 2. iw: Add support for NL80211_STA_INFO_RX_DURATION netlink
> >  attribute
> 
> But these are not in ath-next branch yet, so I can't take these until I
> have updated ath-next.

[shafi] oops ! sorry i thought they are finally in

> 
> Also please ping instead of resending patches. These are already waiting
> in patchwork:
> 
> https://patchwork.kernel.org/patch/8993601/
> https://patchwork.kernel.org/patch/8993621/
>

[shafi] oh ok thanks, sorry i thought this required a rebased over pending
branch next time i will do this

a) ping you first
b) if required send a rebased version

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
