Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMt7a-000812-Kf
 for ath10k@lists.infradead.org; Fri, 20 Sep 2013 05:19:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/5] ath10k: tx performance patches
References: <1379508202-9660-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 20 Sep 2013 08:18:40 +0300
In-Reply-To: <1379508202-9660-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 18 Sep 2013 14:43:17 +0200")
Message-ID: <87vc1wgjf3.fsf@qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> This patchset reduces CPU load and improves
> improves TX performance on AP135 by additional
> 30mbps (give or take; 560mbps -> 590mbps), at
> least on my testbed.
>
>
> Michal Kazior (5):
>   ath10k: use num_pending_tx instead of msdu id bitmap
>   ath10k: avoid needless memset on TX path
>   ath10k: decouple HTT TX completions
>   ath10k: cleanup HTT TX functions
>   ath10k: use msdu headroom to store txfrag

Thanks, all five applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
