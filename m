Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOiWy-0007T7-O5
 for ath10k@lists.infradead.org; Tue, 02 Sep 2014 07:29:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: monitor fixes
References: <1409223497-19946-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 2 Sep 2014 10:29:05 +0300
In-Reply-To: <1409223497-19946-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 28 Aug 2014 12:58:15 +0200")
Message-ID: <87lhq2o4zi.fsf@kamboji.qca.qualcomm.com>
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
> This cleans up the monitor code a bit and
> introduces a workaround for a fw bug (leading to a
> fw crash) when station interface associates while
> a monitor vdev is running.
>
> People have been complaining about the fw crash
> for some time now. I guess we have no choice but
> to make a workaround in ath10k. The most common
> usecase that will benefit from this fix is
> probably 4addr sta briding.
>
>
> Michal Kazior (2):
>   ath10k: fix monitor start/stop sequences
>   ath10k: stop monitor vdev for sta assoc

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
