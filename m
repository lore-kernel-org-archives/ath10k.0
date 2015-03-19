Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYatx-0002oc-4r
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 13:54:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: protect driver from unsolicited htc ep0 events
References: <1426081031-15296-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 19 Mar 2015 15:53:50 +0200
In-Reply-To: <1426081031-15296-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 11 Mar 2015 14:37:11 +0100")
Message-ID: <87wq2dhz4h.fsf@kamboji.qca.qualcomm.com>
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

> Some firmware revisions (tested with qca6174
> rm2.0-00088) deliver unsolicited unknown (kind of
> garbled) HTC ep0 event to host in some cases.
>
> This issue was mainly observed with both qca988x
> and qca6174 being installed on a single host
> system. During driver probing if qca6174 booting
> sequences were somehow deferred (e.g. by qca988x
> implicitly making some resources busy presumably)
> the unsolicited event would came around 1s after
> ATH10K_HTC_MSG_READY_ID was delivered to host for
> qca6174.
>
> The unsolicited event would confuse driver and
> cause HTT initialization (and subsequently
> driver probing) to fail.
>
> Make the ep0 event processing more robust. The
> event will still be caught but instead will
> only generate a warning now.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
