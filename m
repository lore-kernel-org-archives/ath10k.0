Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNL9c-0003we-UG
 for ath10k@lists.infradead.org; Fri, 29 Aug 2014 12:19:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add device/driver strings to tracepoints
References: <1409231135-16233-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 29 Aug 2014 15:19:18 +0300
In-Reply-To: <1409231135-16233-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 28 Aug 2014 15:05:35 +0200")
Message-ID: <877g1rsd2x.fsf@kamboji.qca.qualcomm.com>
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

> This makes it easier to log and debug via tracing
> with more than 1 ath10k device on a system.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> Not sure if pulling core.h in trace.h and using ar
> pointer is the best approach here. Alternative is
> to not pull core.h and pass ar->dev directly to
> trace functions. Thoughts?

I can't really say, I'm not that familiar with the tracing stuff. To
this approach looks good but let's see what others say (if anything).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
