Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSMT6-0002NK-Ho
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 09:16:53 +0000
Message-ID: <1425287785.1906.0.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] ath10k: always save/restore pci config space
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 02 Mar 2015 10:16:25 +0100
In-Reply-To: <1425287344-30594-2-git-send-email-michal.kazior@tieto.com>
 (sfid-20150302_101036_254852_C8CA7C94)
References: <1425287344-30594-1-git-send-email-michal.kazior@tieto.com>
 <1425287344-30594-2-git-send-email-michal.kazior@tieto.com>
 (sfid-20150302_101036_254852_C8CA7C94)
Mime-Version: 1.0
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

On Mon, 2015-03-02 at 10:09 +0100, Michal Kazior wrote:
> The check isn't really necessary and couldn't even
> work because becase pci_restore_state() restores
> only first 64 bytes of PCI configuration space.
> 
> This is necessary for future WoWLAN support.

> +	pci_save_state(pdev);
> +	pci_disable_device(pdev);

I believe the whole thing isn't necessary at all since the kernel's PCIe
layer will take care of it.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
