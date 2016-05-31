Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7dIf-0001AG-P1
 for ath10k@lists.infradead.org; Tue, 31 May 2016 06:37:14 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: [PATCH v1] ath10k: Fix 10.4 extended peer stats update
Date: Tue, 31 May 2016 06:36:48 +0000
Message-ID: <1464676666571.16234@qti.qualcomm.com>
References: <1462947870-17196-1-git-send-email-mohammed@qca.qualcomm.com>
 <6103547.auMgQrn60O@bentobox>,<20160527090649.GA14846@atheros-ThinkPad-T61>
In-Reply-To: <20160527090649.GA14846@atheros-ThinkPad-T61>
Content-Language: en-IN
MIME-Version: 1.0
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, Sven Eckelmann <sven.eckelmann@open-mesh.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Sven / Kalle,

seems the change got merged in pending branch
https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=2a872321e07506e339fc1b3ca81aa3e88628cd6e

Request if you can send the patch to address this(incase the patch cannot be dropped)
and the v2 version cannot be picked

regards,
shafi
________________________________________
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Sent: 27 May 2016 14:36
To: Sven Eckelmann
Cc: Shajakhan, Mohammed Shafi (Mohammed Shafi); ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; Valo, Kalle
Subject: Re: [PATCH v1] ath10k: Fix 10.4 extended peer stats update

On Fri, May 27, 2016 at 10:12:45AM +0200, Sven Eckelmann wrote:
> On Wednesday 11 May 2016 11:54:30 Mohammed Shafi Shajakhan wrote:
> >  #else
> > -static inline void ath10k_sta_update_rx_duration(struct ath10k *ar,
> > -                                            struct list_head *peer)
> > +static inline
> > +void ath10k_sta_update_rx_duration(struct ath10k *ar,
> > +                              struct ath10k_fw_stats *stats);
> >  {
> >  }
>
> Please remove the ";" for the "static inline" version. I can also
> submit a patch in case patches in ath.git/pending cannot be dropped
> anymore.

[shafi] thanks a lot fixed it ! sorry for the typo, sent a v2 for
the same, kindly review the same.

>
> Kind regards,
>       Sven



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
