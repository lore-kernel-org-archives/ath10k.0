Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WorTg-0001Uk-81
 for ath10k@lists.infradead.org; Mon, 26 May 2014 09:45:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/3] ath10k: async pci probing
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 26 May 2014 12:45:21 +0300
In-Reply-To: <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 23 May 2014 12:28:44 +0200")
Message-ID: <87ppj0swjy.fsf@kamboji.qca.qualcomm.com>
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
> Recently I've tried to build ath10k into kernel
> and discovered it doesn't play nice.
>
>
> v2:
>  * split and introduce an additional patch [2/3]
>  * unbind driver upon failure
>
>
> Michal Kazior (3):
>   ath10k: relocate core create/destroy functions
>   ath10k: remove unnecessary tasklet_kill()
>   ath10k: make core registering async

Thanks, all three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
