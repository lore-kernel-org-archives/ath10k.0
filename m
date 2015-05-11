Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YrpEK-0008RZ-Ml
 for ath10k@lists.infradead.org; Mon, 11 May 2015 15:02:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: increase relay buffer size of spectral scan
References: <1430763684-1630-1-git-send-email-poh@qca.qualcomm.com>
Date: Mon, 11 May 2015 18:02:09 +0300
In-Reply-To: <1430763684-1630-1-git-send-email-poh@qca.qualcomm.com> (Peter
 Oh's message of "Mon, 4 May 2015 11:21:24 -0700")
Message-ID: <878ucvi2dq.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Peter Oh <poh@qca.qualcomm.com> writes:

> Spectral scan supported by ath10k has capability to monitor and report
> through whole bands and channels, but current buffer size is too small
> to save reported spectral scan data.
> This results in dropping 5G channel reports at all when dual band card
> is used, so that users are not able to analyze spectral environments.
> Hence increase the buffer size to fix the problem.
>
> A spectral data size is vary based on the number of bins, so the unit
> buffer size, 1140, is chose to minimize relay buffer fragmentation.
>
> The total buffer size is also chose in tradeoff with spectral scan
> support vs. kernel memory consumption.
> Since theoretical maximum buffer size, 9.5MB, can be consumed with
> 512 bins in dual bands, we target to cover up to 128 bins for all
> channels in dual bands and due to the buffer size limitation,
> spectral scan with bin number bigger than 128 needs to be run on
> single band each.
>
> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
