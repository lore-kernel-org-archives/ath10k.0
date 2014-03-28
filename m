Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTVjB-0003QF-Fm
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 12:17:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: update wal_dbg_tx_stats structure with missing
 parameter
References: <1395648122-2125-1-git-send-email-yeohchunyeow@gmail.com>
Date: Fri, 28 Mar 2014 14:17:14 +0200
In-Reply-To: <1395648122-2125-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Mon, 24 Mar 2014 16:02:02 +0800")
Message-ID: <87ha6iwm9h.fsf@kamboji.qca.qualcomm.com>
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:

> This patch is introduced by Bartosz Markowski but never upstream.
> By using this patch, 636 firmware is able to print out the peer
> stats correctly and have caused no regression to the latest AP
> firmware as well.
>
> The original patch from Bartosz Markowski can be found at:
> http://lists.infradead.org/pipermail/ath10k/2013-September/000318.html
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

I'm going to apply the original patch instead and I'll drop this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
