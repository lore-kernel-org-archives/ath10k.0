Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xhf1K-0006sr-W4
 for ath10k@lists.infradead.org; Fri, 24 Oct 2014 13:35:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: minor htt tracing fix
References: <1413899700-10717-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 24 Oct 2014 16:34:22 +0300
In-Reply-To: <1413899700-10717-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 21 Oct 2014 15:54:58 +0200")
Message-ID: <87y4s5mw0x.fsf@kamboji.qca.qualcomm.com>
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

> I've just noticed that rx_desc tracing is somewhat
> wrong. This attempts to fix it and since the trace
> function prototype changes I re-use some tracing
> code as well.
>
>
> Michal Kazior (2):
>   ath10k: remove tsf argument from rx_desc tracing
>   ath10k: re-use trace class

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
