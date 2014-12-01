Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvL8v-0005ie-PD
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 07:11:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/7] ath10k: add support for new wmi-tlv backend
References: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 1 Dec 2014 09:10:59 +0200
In-Reply-To: <1417079481-22255-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 27 Nov 2014 10:11:14 +0100")
Message-ID: <87mw77rgjg.fsf@kamboji.qca.qualcomm.com>
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

> First 2 patches are simple fixes. Patch 3 isn't
> strictly related to wmi-tlv but I decided to
> include it anyway. Other patches gradually
> implement wmi-tlv.
>
> There's a bunch of false-positive checkpatch
> warnings regarding `CHECK: No space is necessary
> after a cast`.
>
> v2:
>  * a lot of fixes (see notes on patch #7)
>
> Michal Kazior (7):
>   ath10k: fix wmi svc bitmap dbg print
>   ath10k: add sanity checks for service bmap parsing
>   ath10k: make wmi service bitmap non-debug

These three are applied.

>   ath10k: implement intermediate event args
>   ath10k: introduce wmi ops
>   ath10k: make some wmi functions public
>   ath10k: implement wmi-tlv backend

I'm still looking at these.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
