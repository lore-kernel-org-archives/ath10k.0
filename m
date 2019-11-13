Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUySl-00024P-3U
 for ath10k@lists.infradead.org; Wed, 13 Nov 2019 19:38:00 +0000
Received: by mail-io1-xd43.google.com with SMTP id j20so3873877ioo.11
 for <ath10k@lists.infradead.org>; Wed, 13 Nov 2019 11:37:58 -0800 (PST)
MIME-Version: 1.0
References: <1565903072-3948-1-git-send-email-wenwen@cs.uga.edu>
 <20191113192821.GA3441686@builder>
In-Reply-To: <20191113192821.GA3441686@builder>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 13 Nov 2019 12:37:46 -0700
Message-ID: <CAOCk7NpoQ_JEQj61BvU4HLzxSOQtxUuB-nyrXRKQTxjZ7infbQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add cleanup in ath10k_sta_state()
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wenwen Wang <wenwen@cs.uga.edu>, govinds@codeaurora.org, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Wed, Nov 13, 2019 at 12:28 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 15 Aug 14:04 PDT 2019, Wenwen Wang wrote:
>
> > If 'sta->tdls' is false, no cleanup is executed, leading to memory/resource
> > leaks, e.g., 'arsta->tx_stats'. To fix this issue, perform cleanup before
> > go to the 'exit' label.
> >
>
> Unfortunately this patch consistently crashes all my msm8998, sdm845 and
> qcs404 devices (running ath10k_snoc).  Upon trying to join a network the
> WiFi firmware crashes with the following:
>
> [  124.315286] wlan0: authenticate with 70:3a:cb:4d:34:f3
> [  124.334051] wlan0: send auth to 70:3a:cb:4d:34:f3 (try 1/3)
> [  124.338828] wlan0: authenticated
> [  124.342470] wlan0: associate with 70:3a:cb:4d:34:f3 (try 1/3)
> [  124.347223] wlan0: RX AssocResp from 70:3a:cb:4d:34:f3 (capab=0x1011 status=0 aid=2)
> [  124.402535] qcom-q6v5-mss 4080000.remoteproc: fatal error received: err_qdi.c:456:EF:wlan_process:1:cmnos_thread.c:3900:Asserted in wlan_vdev.c:_wlan_vdev_up:3219
>
> Can we please revert it for v5.5?

I observe the same, and concur with this request.

>
> Regards,
> Bjorn
>
> > Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> > ---
> >  drivers/net/wireless/ath/ath10k/mac.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> > index 0606416..f99e6d2 100644
> > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > @@ -6548,8 +6548,12 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
> >
> >               spin_unlock_bh(&ar->data_lock);
> >
> > -             if (!sta->tdls)
> > +             if (!sta->tdls) {
> > +                     ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
> > +                     ath10k_mac_dec_num_stations(arvif, sta);
> > +                     kfree(arsta->tx_stats);
> >                       goto exit;
> > +             }
> >
> >               ret = ath10k_wmi_update_fw_tdls_state(ar, arvif->vdev_id,
> >                                                     WMI_TDLS_ENABLE_ACTIVE);
> > --
> > 2.7.4
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
