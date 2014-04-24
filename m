Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdD2q-0005gy-AU
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 06:22:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2 0/3] ath10k: improve recovery speed
References: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
 <1397460146-19450-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 24 Apr 2014 09:21:32 +0300
In-Reply-To: <1397460146-19450-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 14 Apr 2014 09:22:23 +0200")
Message-ID: <871twnnt77.fsf@kamboji.qca.qualcomm.com>
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
> Patch 1/3 is just a cleanup I wanted to keep
> separate from 2/3 which actually improves recovery
> speed.
>
> With this I'm able to recover from a `hard`
> simualtion crash in ~3 seconds instead of ~10.
>
> This should decrease the chance of CQM kicking in
> on connected clients (due to beacon loss) when
> ath10k is acting as AP.
>
> v2:
>  * add a comment in the code
>
>
> Michal Kazior (3):
>   ath10k: differentiate between target init failures
>   ath10k: don't wait for device init if it crashed
>   ath10k: skip suspending when recovering

Thanks, all patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
