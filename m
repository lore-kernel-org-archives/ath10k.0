Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgBDR-0004F0-B4
 for ath10k@lists.infradead.org; Thu, 09 Apr 2015 12:05:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: fix arvif->wep_keys clearing
References: <1427444516-974-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 9 Apr 2015 15:05:22 +0300
In-Reply-To: <1427444516-974-1-git-send-email-michal.kazior@tieto.com> (Michal
 Kazior's message of "Fri, 27 Mar 2015 08:21:55 +0000")
Message-ID: <87zj6heccd.fsf@kamboji.qca.qualcomm.com>
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

> The variable should be cleared regardless of
> whether there's a peer associated with the key or
> not.
>
> This fixes case when user first associates with 2
> WEP keys and then disconnects and connects with 1
> WEP key. This resulted in WEP key count being 2 in
> the driver leading to default keyidx fixup
> failure.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
