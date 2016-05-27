Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6Djm-0001ZR-Ks
 for ath10k@lists.infradead.org; Fri, 27 May 2016 09:07:22 +0000
Date: Fri, 27 May 2016 14:36:49 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v1] ath10k: Fix 10.4 extended peer stats update
Message-ID: <20160527090649.GA14846@atheros-ThinkPad-T61>
References: <1462947870-17196-1-git-send-email-mohammed@qca.qualcomm.com>
 <6103547.auMgQrn60O@bentobox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6103547.auMgQrn60O@bentobox>
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
To: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

On Fri, May 27, 2016 at 10:12:45AM +0200, Sven Eckelmann wrote:
> On Wednesday 11 May 2016 11:54:30 Mohammed Shafi Shajakhan wrote:
> >  #else
> > -static inline void ath10k_sta_update_rx_duration(struct ath10k *ar,
> > -						 struct list_head *peer)
> > +static inline
> > +void ath10k_sta_update_rx_duration(struct ath10k *ar,
> > +				   struct ath10k_fw_stats *stats);
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
> 	Sven



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
