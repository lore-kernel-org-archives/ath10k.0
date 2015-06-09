Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2H7I-0004lq-UK
 for ath10k@lists.infradead.org; Tue, 09 Jun 2015 10:50:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: fix ar->rx_channel updating logic
References: <1433326616-23279-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 9 Jun 2015 13:50:21 +0300
In-Reply-To: <1433326616-23279-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 3 Jun 2015 12:16:54 +0200")
Message-ID: <87wpzdf95e.fsf@kamboji.qca.qualcomm.com>
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

> Channel contexts aren't iterable until after
> they've been added to the driver. The code assumed
> otherwise.
>
> This problem could result in:
>
>  * rx_channel being NULL and forcing Rx path to go
>    the slow way to get channel on QCA988X,
>
>  * report incorrect channel when running
>    multi-channel on QCA61X4 hw2.1,
>
>  * report incorrect channel after AP channel
>    switch.
>
> Fixes: 500ff9f9389d ("ath10k: implement chanctx API")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, all three patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
