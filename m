Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpDl5-0004on-4Q
 for ath10k@lists.infradead.org; Tue, 27 May 2014 09:33:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: pci fixes 2014-05-15
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 May 2014 12:32:55 +0300
In-Reply-To: <1401098579-31842-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 26 May 2014 12:02:57 +0200")
Message-ID: <87k397bm7s.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, apenwarr@gmail.com

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> Patches are a result of analysing `ath10k firmware
> crash after 4 hours of heavy TCP traffic` bug
> reported by Avery.
>
> v2:
>  * dropped patch 3/3 (memory barrier addition) [Kalle]
>
> Based on github.com/kvalo/ath/master
>
>
> Michal Kazior (2):
>   ath10k: protect src_ring state with ce_lock in tx_sg()
>   ath10k: abort incomplete scatter-gather pci tx properly

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
