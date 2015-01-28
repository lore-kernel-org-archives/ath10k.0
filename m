Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGQTh-0003bN-Mk
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 11:08:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Use TX cksum offload only for CHECKSUM_PARTIAL
References: <1422441092-29243-1-git-send-email-helmut.schaa@googlemail.com>
Date: Wed, 28 Jan 2015 13:07:36 +0200
In-Reply-To: <1422441092-29243-1-git-send-email-helmut.schaa@googlemail.com>
 (Helmut Schaa's message of "Wed, 28 Jan 2015 11:31:32 +0100")
Message-ID: <87wq4788p3.fsf@kamboji.qca.qualcomm.com>
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
To: Helmut Schaa <helmut.schaa@googlemail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Helmut Schaa <helmut.schaa@googlemail.com> writes:

> Otherwise ath10k will just checksum everything even if it did not
> go through the TCP/IP stack (for example bridged frames). In the worst
> case this could mean recreating the checksum for incorrect data.
>
> Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>

In the future, please also CC linux-wireless. We get good review
comments that way.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
