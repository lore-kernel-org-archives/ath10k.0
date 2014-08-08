Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFhvO-0001J4-JD
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 11:01:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/6] ath10k: remove pci features var
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
 <1407402212-29809-4-git-send-email-michal.kazior@tieto.com>
Date: Fri, 8 Aug 2014 14:01:03 +0300
In-Reply-To: <1407402212-29809-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:03:29 +0200")
Message-ID: <874mxnz1n4.fsf@kamboji.qca.qualcomm.com>
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

> The ATH10K_PCI_FEATURE_MSI_X was originally
> introduced to support both chips QCA988Xv1 and
> QCA988Xv2. Since v1 isn't supported anymore it
> doesn't make sense to keep the feature flag
> around. Since this is the last one remove the
> whole thing.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/pci.h
> +++ b/drivers/net/wireless/ath/ath10k/pci.h
> @@ -135,13 +135,6 @@ struct service_to_pipe {
>  	u32 pipenum;
>  };
>  
> -enum ath10k_pci_features {
> -	ATH10K_PCI_FEATURE_MSI_X		= 0,
> -
> -	/* keep last */
> -	ATH10K_PCI_FEATURE_COUNT
> -};

I wouldn't be too surprised if we need this again at some point. But we
can then add it back.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
