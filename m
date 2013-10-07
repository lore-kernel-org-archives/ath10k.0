Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTDnI-0001i2-KS
 for ath10k@lists.infradead.org; Mon, 07 Oct 2013 16:36:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/2] ath10k: fix scheduling while atomic bug
References: <to=1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
 <1380874630-14280-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 7 Oct 2013 19:35:57 +0300
In-Reply-To: <1380874630-14280-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Oct 2013 10:17:10 +0200")
Message-ID: <87li25t4wi.fsf@kamboji.qca.qualcomm.com>
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

> Recent WMI/HTC changes made it possible for WMI
> commands to sleep (if there's not enough HTC TX
> credits to submit a command). TX path is in an
> atomic context so calling WMI commands in it is
> wrong.
>
> This simply moves WEP key index update to a worker
> and fixes the 'scheduling while atomic' bug.
>
> This still leaves multiple WEP key handling laggy,
> i.e. some frames may be TXed with an old/different
> key (although recipient should still be able to RX
> them).
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I see conflicts with this patch. Can you rebase, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
