Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkYaN-0007B3-Ga
 for ath10k@lists.infradead.org; Wed, 14 May 2014 12:47:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: get rid of pci_assign_resource() call from
 pci_probe
References: <1400068627-4076-1-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 14 May 2014 15:46:35 +0300
In-Reply-To: <1400068627-4076-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 14 May 2014 13:57:07 +0200")
Message-ID: <87fvkch6j8.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> On ARM-based (MSM mach), the pci_assign_resource() is passing
> some invalid pointers and leading to L2 cache errors,
> what prevents the PCI communication completly.
>
> So far I have not found this funtion to be directly called by
> any other wifi driver and did not found this assigning needed
> on any other platform. So removing it completly.

Typo, it should be "completely". I have fixed this up in ath-next-test.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
