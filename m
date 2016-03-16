Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ag9Uc-0002My-VK
 for ath10k@lists.infradead.org; Wed, 16 Mar 2016 11:19:59 +0000
Date: Wed, 16 Mar 2016 16:49:31 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: Enable parsing per station rx duration for
 10.4
Message-ID: <20160316111931.GB5213@atheros-ThinkPad-T61>
References: <1458052250-2529-1-git-send-email-mohammed@qca.qualcomm.com>
 <1458052250-2529-3-git-send-email-mohammed@qca.qualcomm.com>
 <87d1qulo2r.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d1qulo2r.fsf@kamboji.qca.qualcomm.com>
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

On Wed, Mar 16, 2016 at 10:22:22AM +0000, Valo, Kalle wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:
> 
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> >
> > Rx duration support for per station is part of extended peer
> > stats, enable provision to parse the same and provide backward
> > compatibility based on the 'stats_id' event
> >
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> After fixing patch 1 this doesn't compile either. Please fix and resend
> both patches.

[shafi] sure, sorry for wasting your time, i think this dependent on the
patch "[PATCH v5] ath10k: Enable debugfs provision to enable Peer Stats
 feature" anyway i will resend them , with compile testing

> 
> drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_start':
> drivers/net/wireless/ath/ath10k/core.c:1787:3: error: implicit
> declaration of function 'ath10k_peer_stats_enabled'
> [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> 
> -- 
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
