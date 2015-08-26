Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUX6c-0000Y3-Ha
 for ath10k@lists.infradead.org; Wed, 26 Aug 2015 09:34:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix compilation warnings in wmi phyerr pull
 function
References: <1440162756-4025-1-git-send-email-rmani@qti.qualcomm.com>
Date: Wed, 26 Aug 2015 12:34:26 +0300
In-Reply-To: <1440162756-4025-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Fri, 21 Aug 2015 18:42:36 +0530")
Message-ID: <87fv361jh9.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> Below compilation warnings are observed in gcc version 4.8.2.
> Even though it's not seen in bit older gcc versions (for ex, 4.7.3),
> It's good to fix it by changing format specifier from %d to
> %zd in wmi pull phyerr functions.
>
> wmi.c: In function 'ath10k_wmi_op_pull_phyerr_ev':
> wmi.c:3567:8: warning: format '%d' expects argument of type 'int',
>               but argument 4 has type 'long unsigned int' [-Wformat=]
>               left_len, sizeof(*phyerr));
>                         ^
> wmi.c: In function 'ath10k_wmi_10_4_op_pull_phyerr_ev':
> wmi.c:3612:8: warning: format '%d' expects argument of type 'int',
> 	      but argument 4 has type 'long unsigned int' [-Wformat=]
>               left_len, sizeof(*phyerr));
>                         ^
> Fixes: 991adf71a6cd ("ath10k: refactor phyerr event handlers")
> Fixes: 2b0a2e0d7c2f ("ath10k: handle 10.4 firmware phyerr event")
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
