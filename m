Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcYMC-0000Hc-TC
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 11:59:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: clear htt.freq
References: <1427363827-24125-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 30 Mar 2015 14:59:21 +0300
In-Reply-To: <1427363827-24125-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 26 Mar 2015 09:57:07 +0000")
Message-ID: <878uee66hy.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If htt.freq isn't cleared and contains garbage fw
> may discard tx packets. Prevent this from
> happening by clearing htt.freq properly.
>
> Possible manifestation of the problem could be not
> being able to send auth request/response frames on
> firmware with HTT >= 3.4 (when freq param was
> introduced), e.g. on qca6174.
>
> Fixes: 8d6d36243610 ("ath10k: fix offchan reliability")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
