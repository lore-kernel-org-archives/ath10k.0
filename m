Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHXed-0007lC-FQ
 for ath10k@lists.infradead.org; Mon, 27 Jun 2016 14:36:52 +0000
Date: Mon, 27 Jun 2016 20:06:00 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: Fix sending NULL/ Qos NULL data frames for
 QCA99X0 and later
Message-ID: <20160627143600.GA5292@atheros-ThinkPad-T61>
References: <1466700001-4883-1-git-send-email-mohammed@qca.qualcomm.com>
 <1466700001-4883-2-git-send-email-mohammed@qca.qualcomm.com>
 <CA+BoTQnUvF2Zy7_WuEi0V+KjByRghVmoeR6yrs6hu6ag=KmBqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQnUvF2Zy7_WuEi0V+KjByRghVmoeR6yrs6hu6ag=KmBqQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Hi Michal,

thanks for the review ..

On Mon, Jun 27, 2016 at 11:27:27AM +0200, Michal Kazior wrote:
> On 23 June 2016 at 18:40, Mohammed Shafi Shajakhan
> <mohammed@qti.qualcomm.com> wrote:
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > For chipsets like QCA99X0, IPQ4019 and later we are not getting proper
> > NULL func status (always acked/successs !!) when hostapd does a
> > PROBE_CLIENT via nullfunc frames when the station is powered off
> > abruptly (inactive timer probes client via null func after the inactive
> > time reaches beyond the threshold). Fix this by disabling the workaround
> > (getting the ACK status of NULL func frames by sending via HTT mgmt-tx
> >  path) introduced by the change ("ath10k: fix beacon loss handling ")
> > for QCA99X0 and later chipsets. The normal tx path provides the proper
> > ACK status for NULL data frames. As of now disable this workaround for
> > chipsets QCA99X0 and later, once the 10.1 firmware is obselete we can
> > completely get rid of this workaround for all the chipsets
> >
> > Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath10k/core.c | 3 +++
> >  drivers/net/wireless/ath/ath10k/core.h | 6 ++++++
> >  drivers/net/wireless/ath/ath10k/mac.c  | 1 +
> >  3 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 689d6ce..9978e4a 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -181,6 +181,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >                         .board = QCA99X0_HW_2_0_BOARD_DATA_FILE,
> >                         .board_size = QCA99X0_BOARD_DATA_SZ,
> >                         .board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
> > +                       .disable_null_func_workaround = true,
> 
> Tx completion (bugs) are firmware specific, not hardware. This should
> be expressed via features bits in ath10k FW API, no?
> 
>
[shafi] Are you suggesting me to introduce something like
"ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT" ? Kalle any suggestions ?

Also how about getting this workaround completely if Ben had fixed this in his tree,
will this affect older 10.2.4 ?

regards,
shafi


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
