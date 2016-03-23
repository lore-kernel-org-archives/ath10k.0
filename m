Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aihbE-0008Aw-Ki
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 12:09:21 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: fix tx hangs
Date: Wed, 23 Mar 2016 12:09:15 +0000
Message-ID: <87h9fxflat.fsf@kamboji.qca.qualcomm.com>
References: <1458208265-16715-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1458208265-16715-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 17 Mar 2016 10:51:03 +0100")
Content-Language: en-US
Content-ID: <88A32B90310AE44AAC1C3C56434DFB52@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> My recent wake-tx-queue/pull-push related patches
> introduced a regression that can cause tx to hang
> under certain circumstances.
>
>
> Michal Kazior (2):
>   ath10k: fix tx hang
>   ath10k: fix pull-push tx threshold handling

Both applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
