Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUWjn-0006h9-Dd
 for ath10k@lists.infradead.org; Wed, 26 Aug 2015 09:11:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 2/2] ath10k: rename qca6174 to qca61x4
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <1439469147-9408-3-git-send-email-michal.kazior@tieto.com>
Date: Wed, 26 Aug 2015 12:10:51 +0300
In-Reply-To: <1439469147-9408-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 13 Aug 2015 14:32:27 +0200")
Message-ID: <87vbc21kkk.fsf@kamboji.qca.qualcomm.com>
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
Cc: arnd@arndb.de, linux-wireless@vger.kernel.org, twilightrook@gmail.com, ath10k@lists.infradead.org, oscarrydberg@gmail.com, vvanpo@gmail.com, joseph.salisbury@canonical.com

Michal Kazior <michal.kazior@tieto.com> writes:

> This cleans up the naming a little bit. Both
> QCA6174 and QCA6164 are in practice the same as
> far as driving them is concerned.
>
> Unfortunately firmware paths will need to stay
> untouched, i.e. QCA6164 firmware will still be
> looked for in QCA6174 to avoid breaking backward
> compatibility with older /lib/firmware setups.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Based on my previous comments I'll drop this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
