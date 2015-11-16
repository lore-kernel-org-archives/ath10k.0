Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyQPh-0000YO-0k
 for ath10k@lists.infradead.org; Mon, 16 Nov 2015 20:30:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: poll HTT send completion when CE 5 is unused
References: <1447243286-22116-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 16 Nov 2015 22:29:21 +0200
In-Reply-To: <1447243286-22116-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 11 Nov 2015 17:31:26 +0530")
Message-ID: <871tbp1ye6.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> commit a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")
> moved send completion polling under HTT Rx (CE 5) service routine. For
> QCA6174 based devices copy engine 1 (CE 1) is used for HTT Rx instead
> of CE 5. So send completion never be called. This is causing "failed to
> transmit packet, dropping: -105" errors. Fix this by processing send
> completion from CE 1 service routine instead of CE 5.
>
> Tested-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Applied to ath-current, thanks. I had a trivial conflict, please review
carefully my changes:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=ath-current&id=6419fdbb6f90e147690f8833cba59d289d613da5

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
