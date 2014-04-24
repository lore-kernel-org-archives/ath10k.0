Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdD4l-0005ox-PF
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 06:24:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2 0/4] ath10k: AP-related fixes
References: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
 <1397460010-19153-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 24 Apr 2014 09:23:32 +0300
In-Reply-To: <1397460010-19153-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 14 Apr 2014 09:20:06 +0200")
Message-ID: <87wqefmejf.fsf@kamboji.qca.qualcomm.com>
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
> This is a bunch of fixes I've found while
> investigating tx credit issues.
>
> I've only experienced problem fixed by 4/4
> firsthand. Other patches are preemptive fixes :-)
>
> v2:
>  * minor tweaks
>
> Michal Kazior (4):
>   ath10k: make sure to not leak beacon dma mapping
>   ath10k: make sure to not use invalid beacon pointer
>   ath10k: prevent beacon memory leak
>   ath10k: fix firmware recovery with ap interface

Thanks, all patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
