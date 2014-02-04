Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAknW-0004Bq-OM
 for ath10k@lists.infradead.org; Tue, 04 Feb 2014 18:32:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: Get rid of superfluous call to
 pci_disable_msi()
References: <cover.1389904166.git.agordeev@redhat.com>
 <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
 <20140130134819.GA31909@dhcp-26-207.brq.redhat.com>
Date: Tue, 4 Feb 2014 20:32:12 +0200
In-Reply-To: <20140130134819.GA31909@dhcp-26-207.brq.redhat.com> (Alexander
 Gordeev's message of "Thu, 30 Jan 2014 14:48:20 +0100")
Message-ID: <87y51qohjn.fsf@kamboji.qca.qualcomm.com>
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
To: Alexander Gordeev <agordeev@redhat.com>
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Alexander Gordeev <agordeev@redhat.com> writes:

> Signed-off-by: Alexander Gordeev <agordeev@redhat.com>
> ---
>  drivers/net/wireless/ath/ath10k/pci.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 29fd197..6525e1f 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -2414,8 +2414,6 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
>  		ret = pci_enable_msi_block(ar_pci->pdev, ar_pci->num_msi_intrs);
>  		if (ret == 0)
>  			return 0;
> -		if (ret > 0)
> -			pci_disable_msi(ar_pci->pdev);

I don't understand how this is superfluous. When I read the
documentation for pci_enable_msi_block() it states that if it can't
allocate all requests, it will return the number requests it could
allocate. And in that case we want to fall back other modes.

Am I missing something?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
