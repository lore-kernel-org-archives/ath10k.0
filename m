Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acrmx-0006iB-EZ
 for ath10k@lists.infradead.org; Mon, 07 Mar 2016 09:49:21 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: fix HTT Tx CE ring size
Date: Mon, 7 Mar 2016 09:48:53 +0000
Message-ID: <87egbmvcsd.fsf@kamboji.qca.qualcomm.com>
References: <1456834571-9847-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1456834571-9847-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 1 Mar 2016 13:16:10 +0100")
Content-Language: en-US
Content-ID: <DB09CCEFB0245B4387D5E9E0BA37059F@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> QCA4019 can queue up to 2500 frames at a time.
> This means it requires roughly 5000 entires on the
> ring to work properly. Otherwise random tx failure
> may occur.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Both patches applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
