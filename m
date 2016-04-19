Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asXsu-0001oN-A0
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 15:48:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [patch v2] ath10k: add some sanity checks
Date: Tue, 19 Apr 2016 15:47:53 +0000
Message-ID: <87vb3diore.fsf@kamboji.qca.qualcomm.com>
References: <20160411081520.GA17911@mwanda>
In-Reply-To: <20160411081520.GA17911@mwanda> (Dan Carpenter's message of "Mon, 
 11 Apr 2016 11:15:20 +0300")
Content-Language: en-US
Content-ID: <A5B27DC942CED449AAF67B96FBBE4F76@qualcomm.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch complains that since "ev->peer_id" comes from skb->data that
> means we can't trust it and have to do a bounds check on it to prevent
> an array overflow.
>
> Fixes: 6942726f7f7b ('ath10k: add fast peer_map lookup')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
