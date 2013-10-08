Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTcUZ-0002Fb-4y
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 18:58:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/2] ath10k: wep & ampdu fix
References: <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
 <1381200718-16271-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 8 Oct 2013 21:58:19 +0300
In-Reply-To: <1381200718-16271-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 7 Oct 2013 19:51:56 -0700")
Message-ID: <871u3vsi7o.fsf@kamboji.qca.qualcomm.com>
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
> One throughput fix and one bug fix.
>
> The bug fix addresses my oversight when reworking
> HTC/WMI. I haven't seen the error yet but I'm
> quite certain this should be fixed.
>
> v2:
>  * A-MPDU patch contains a workaround for
>    Netgear/Linksys 11ac APs
>  * patchset cover mail title changed to avoid
>    confusion (too many patchsets named the same
>    way..)
>
> v3:
>  * fix lines over 80 chars (Kalle)
>  * fix max() cast warning (Kalle)
>  * rebase (Kalle)
>  * add Tested-by (thanks Kalle!)
>
>
> Michal Kazior (1):
>   ath10k: fix scheduling while atomic bug

I dropped this patch for now, need to think more about how to handle
this.

> Sujith Manoharan (1):
>   ath10k: Fix bug in max. VHT A-MPDU size

This is applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
