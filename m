Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSMbg-00010X-9R
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 09:25:45 +0000
Message-ID: <1425288321.1906.1.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] ath10k: always save/restore pci config space
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 02 Mar 2015 10:25:21 +0100
In-Reply-To: <CA+BoTQnrS74yx=V_sPvTgzkoZeWbOBFawqXZMAv6oEhUypmoQA@mail.gmail.com>
 (sfid-20150302_102353_670558_FAE3DCBD)
References: <1425287344-30594-1-git-send-email-michal.kazior@tieto.com>
 <1425287344-30594-2-git-send-email-michal.kazior@tieto.com>
 <1425287785.1906.0.camel@sipsolutions.net>
 <CA+BoTQnrS74yx=V_sPvTgzkoZeWbOBFawqXZMAv6oEhUypmoQA@mail.gmail.com>
 (sfid-20150302_102353_670558_FAE3DCBD)
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, 2015-03-02 at 10:23 +0100, Michal Kazior wrote:

> > I believe the whole thing isn't necessary at all since the kernel's PCIe
> > layer will take care of it.
> 
> You mean only the pci_save_state() and pci_disable_device() or, the
> resume counterpart as well? Hmm.

Resume as well - but I believe it's all-or-nothing.

> Earlier the resume counterpart didn't do any restore stuff and the
> device ended up pretty confused..

which may explain this.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
