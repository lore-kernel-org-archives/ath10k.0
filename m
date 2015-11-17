Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyWHz-0000T3-7l
 for ath10k@lists.infradead.org; Tue, 17 Nov 2015 02:46:37 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: poll HTT send completion when CE 5 is unused
Date: Tue, 17 Nov 2015 02:46:03 +0000
Message-ID: <1447728358664.94372@qti.qualcomm.com>
References: <1447243286-22116-1-git-send-email-rmanohar@qti.qualcomm.com>,
 <871tbp1ye6.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <871tbp1ye6.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> > commit a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")
> > moved send completion polling under HTT Rx (CE 5) service routine. For
> > QCA6174 based devices copy engine 1 (CE 1) is used for HTT Rx instead
> > of CE 5. So send completion never be called. This is causing "failed to
> > transmit packet, dropping: -105" errors. Fix this by processing send
> > completion from CE 1 service routine instead of CE 5.
> >
> > Tested-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> > Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> Applied to ath-current, thanks. I had a trivial conflict, please review
> carefully my changes:
> 
> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=ath-current&id=6419fdbb6f90e147690f8833cba59d289d613da5
> 
Looks good. Thanks for fixing conflicts.

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
