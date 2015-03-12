Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW25l-00029m-Ph
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 12:20:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix patching mistake for AP/IBSS CSA
References: <877fuqz7b6.fsf@kamboji.qca.qualcomm.com>
 <1425907164-13935-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 12 Mar 2015 14:19:27 +0200
In-Reply-To: <1425907164-13935-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 9 Mar 2015 14:19:24 +0100")
Message-ID: <87385awgq8.fsf@kamboji.qca.qualcomm.com>
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

> Mistakenly v1 of `ath10k: fix AP/IBSS CSA with
> template based fw`
> (81a9a17db5d766d2872c4ab8a77b8666d22031ec) was
> applied.
>
> This patch applies the missing bits from v2:
>  * remove unnecessary locking
>  * add some (sanity) checks
>
> There are no practical functionality differences
> between v1 and v2.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied. Sorry for my mistake and kudos for catching it so fast!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
