Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2zIE-0000cL-Km
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 12:42:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Retry pci probe on failure.
Date: Fri, 13 Oct 2017 12:41:57 +0000
Message-ID: <87a80vnrsb.fsf@kamboji.qca.qualcomm.com>
References: <1507068826-14677-1-git-send-email-greearb@candelatech.com>
In-Reply-To: <1507068826-14677-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 3 Oct 2017 15:13:46	-0700")
Content-Language: en-US
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> This works around a problem we see when sometimes the wifi NIC does
> not respond the first time.  This seems to happen especially often on
> some of the 9984 NICs in mid-range platforms.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> -static int ath10k_pci_probe(struct pci_dev *pdev,
> -			    const struct pci_device_id *pci_dev)
> +static int __ath10k_pci_probe(struct pci_dev *pdev,
> +			      const struct pci_device_id *pci_dev)
>  {
>  	int ret = 0;
>  	struct ath10k *ar;
> @@ -3672,6 +3672,22 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>  	return ret;
>  }
>  
> +static int ath10k_pci_probe(struct pci_dev *pdev,
> +			    const struct pci_device_id *pci_dev)
> +{
> +	int cnt = 0;
> +	int rv;
> +	do {
> +		rv = __ath10k_pci_probe(pdev, pci_dev);
> +		if (rv == 0)
> +			return rv;
> +		pr_err("ath10k: failed to probe PCI : %d, retry-count: %d\n", rv, cnt);
> +		mdelay(10); /* let the ath10k firmware gerbil take a small break */
> +	} while (cnt++ < 10);
> +	return rv;
> +}

This is a sledgehammer approach and it causes reload for all error
cases, like when hardware is broken or memory allocation is failing.

When the problem happens does it always fail at the the same place? Is
it hw reset or something else? It's better to retry the invidiual action
than to do this hack. Or is it just some more delay needed somewhere?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
