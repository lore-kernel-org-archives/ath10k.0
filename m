Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XLpkD-00075B-0P
 for ath10k@lists.infradead.org; Mon, 25 Aug 2014 08:35:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/5] ath10k: fixes 2014-08-07, part 3
References: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 25 Aug 2014 11:34:50 +0300
In-Reply-To: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 Aug 2014 14:33:13 +0200")
Message-ID: <87y4ud55n9.fsf@kamboji.qca.qualcomm.com>
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

> This is part 3 (of 3) of my patches. Split for
> your reviewing pleasure.
>
> This is related to start/restart sequences.
>
> This is based on:
>   [PATCH v2 0/6] ath10k: fixes 2014-08-07, part 2
>
> v2:
>  * patch [2/5] replaced
>  * fixes, see notes
>
>
> Michal Kazior (5):
>   ath10k: rework posting pci rx buffers
>   ath10k: update comment regarding warm reset
>   ath10k: ignore ar_pci->started in pipe cleanup
>   ath10k: remove ar_pci->started
>   ath10k: flush hif buffers before recovery

Thanks, all five patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
