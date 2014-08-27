Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMc7h-00027b-2P
 for ath10k@lists.infradead.org; Wed, 27 Aug 2014 12:14:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ath10k: ce fixes 2014-08-08
References: <1408961963-3682-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 27 Aug 2014 15:14:16 +0300
In-Reply-To: <1408961963-3682-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 Aug 2014 12:19:20 +0200")
Message-ID: <87mwaqw2nb.fsf@kamboji.qca.qualcomm.com>
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

> This removes implicit endianess in some places.
> I'd love to get rid of it from
> ath10k_pci_diag_access* as well but let's fix
> ath10k_pci_diag_mem_* first.
>
> Note: This is based on my logging patch and fw
> crash dump fix.
>
> v2:
>  * rebased
>  * some fixes in patch [3/3] (see notes there)
>
>
> Michal Kazior (3):
>   ath10k: move pci init structures
>   ath10k: dont duplicate service-pipe mapping
>   ath10k: make target endianess more explicit

Thanks, all three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
