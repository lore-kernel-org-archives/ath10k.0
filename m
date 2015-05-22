Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvkPq-0005Fi-3a
 for ath10k@lists.infradead.org; Fri, 22 May 2015 10:42:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ath10k: improve power efficiency
References: <1431076388-24800-1-git-send-email-michal.kazior@tieto.com>
 <1431941898-13591-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 22 May 2015 13:41:57 +0300
In-Reply-To: <1431941898-13591-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 18 May 2015 09:38:15 +0000")
Message-ID: <87bnhc6gi2.fsf@kamboji.qca.qualcomm.com>
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

> Some measurements for QCA61X4:
>
>             Loaded    Started   Associated
> Unpatched    31mA      88mA       43mA
> Patched      14mA      15mA       23mA
>
> Loaded = module loaded, driver bound, no interface
>          is running
>
> Started = Loaded, but one client interface is
>           running, not associated
>
> Associated = Started, but associated to an AP as
>              client
>
> Note: Unpatched was consuming more power when
> Started than when Associated. This is no mistake.
>
> I didn't have a way to measure QCA988X.
>
>
> Janusz Dziedzic (2):
>   ath10k: enable ASPM
>   ath10k: fix idle power consumption
>
> Michal Kazior (1):
>   ath10k: enable pci soc powersaving

Thanks, all three applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
