Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apWWP-0005jW-He
 for ath10k@lists.infradead.org; Mon, 11 Apr 2016 07:44:34 +0000
Date: Mon, 11 Apr 2016 10:44:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: ath10k: implement updating shared htt txq state
Message-ID: <20160411074401.GA4247@mwanda>
References: <20160411071258.GA10739@mwanda>
 <CA+BoTQk=evy7fzNH1BPoXWi6AqhuVS7aVc0kJahBvDMMPAVuzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQk=evy7fzNH1BPoXWi6AqhuVS7aVc0kJahBvDMMPAVuzg@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Apr 11, 2016 at 09:33:43AM +0200, Michal Kazior wrote:
> > There are several new warnings.  See also:
> 
> This is a false positive.
> 
> The `txq->sta->drv_priv` is a dynamic array which is basically equal
> to `(void *)txq->sta + offsetof(struct ieee80211_sta, drv_priv)`.

Ah, yeah.  You're right.  The other warning should be fixed though.

regards,
dan carpenter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
