Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTVyb-0003r7-3E
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 12:33:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ath10k: ce fixes
References: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
 <1395992065-10086-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 28 Mar 2014 14:33:10 +0200
In-Reply-To: <1395992065-10086-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 28 Mar 2014 08:34:22 +0100")
Message-ID: <8761mywlix.fsf@kamboji.qca.qualcomm.com>
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
> This addresses memory allocations failures
> recently reported by Avery Pennarun.
>
>
> v2:
>  * add a new patch (result of splitting)
>  * fix commit message
>
>
> Michal Kazior (3):
>   ath10k: convert pci_alloc_consistent() to dma_alloc_coherent()
>   ath10k: split ce initialization and allocation
>   ath10k: deinit copy engine before resetting

Thanks, all patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
