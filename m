Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLVXr-00028T-Rb
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 13:10:16 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: AR9882 IOMMU faults
Date: Fri, 8 Jul 2016 13:09:48 +0000
Message-ID: <1467983388208.13042@qti.qualcomm.com>
References: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
In-Reply-To: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
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
To: Ben Skeggs <bskeggs@redhat.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Logs are so limited. If possible, revert below commit and give a try

"ath10k: do not use coherent memory for allocated device memory chunks"

If revert is not so clean, try with this patch.

https://patchwork.kernel.org/patch/9175029/

-Rajkumar
________________________________________
From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Ben Skeggs <bskeggs@redhat.com>
Sent: Friday, July 8, 2016 10:59 AM
To: ath10k@lists.infradead.org
Subject: AR9882 IOMMU faults

Hey,

I've just installed a COMPEX WLE600VX (AR9882) in my router machine,
operating in AP mode.

While it appears to be working well enough, I get massive floods of
IOMMU faults reported in my kernel log.  These appear to increase with
the load on the network.

I've attached both the info that ath10k reports when it detects the
device, and a sample of one of the DMAR messages (worth nothing that
it's the same fault address in all the messages).

Is this a known issue, and anything I can do to help get it resolved?

Thanks,
Ben.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
