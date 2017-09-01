Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnv8J-0008OX-2t
 for ath10k@lists.infradead.org; Fri, 01 Sep 2017 23:13:52 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: [v3,1/2] ath10k: add the PCI PM core suspend/resume ops
Date: Fri, 1 Sep 2017 23:13:19 +0000
Message-ID: <ac6334cb-6a59-88db-cf3e-9efbfc0a9286@qti.qualcomm.com>
References: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
 <f4652c401e1f462d89b4611afe9bd623@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <f4652c401e1f462d89b4611afe9bd623@euamsexm01a.eu.qualcomm.com>
Content-Language: en-US
Content-ID: <CB3DC6664CA6C8468940CCCAF6D01F12@qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 08/31/2017 05:52 AM, Kalle Valo wrote:

> This had a warning:
>
> drivers/net/wireless/ath/ath10k/pci.c:3651:1: warning: symbol 'ath10k_pci_pm_ops' was not declared. Should it be static?
>
> I fixed it in the pending branch by making it static:
>
> static SIMPLE_DEV_PM_OPS(ath10k_pci_pm_ops,
> 			 ath10k_pci_pm_suspend,
> 			 ath10k_pci_pm_resume);
>
> Please review.
>

Yes and thanks!

-- 
Ryan Hsu
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
