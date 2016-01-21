Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFoJ-0000ZO-Af
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 14:02:07 +0000
Date: Thu, 21 Jan 2016 19:31:16 +0530
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: Re: [PATCH 6/7] ath10k: Enable periodic peer stats update
Message-ID: <20160121140112.GA8313@shafi-laptop>
References: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
 <1452699994-5078-7-git-send-email-mohammed@qca.qualcomm.com>
 <87twm7yu7m.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87twm7yu7m.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Jan 21, 2016 at 02:48:13PM +0200, Kalle Valo wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > Register for 500ms as periodic peer stats update period,
> > and parameters like rx_duration that needs to be tracked
> > in host can be achieved by this provision, also periodic
> > stats update is the future of fw_stats and shall be extended
> > for pdev / vdev stats irrespecitive PEER_STATS service is enabled
> > or not
> >
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/mac.c |   12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> > index 2dba57c..fd4b4df 100644
> > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > @@ -4103,6 +4103,18 @@ static int ath10k_start(struct ieee80211_hw *hw)
> >  
> >  	ar->ani_enabled = true;
> >  
> > +	if (test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map)) {
> > +		param = ar->wmi.pdev_param->peer_stats_update_period;
> > +		ret = ath10k_wmi_pdev_set_param(ar, param,
> > +					PEER_DEFAULT_STATS_UPDATE_PERIOD);
> 
> This gives a new checkpatch warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c:4110: Alignment should match open parenthesis
> 
> I fixed that in the pending branch.
>
[shafi] thank you Kalle Valo !

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
