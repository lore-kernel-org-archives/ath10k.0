Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V083B-0003uD-88
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 10:36:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix NULL dereference for injected packets
References: <CAMQ0DfRpqk6ufb4rAifjy651oM9-GZyDpMLL+mGVzzVSVjVyJA@mail.gmail.com>
 <1373965494-17726-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 19 Jul 2013 13:36:05 +0300
In-Reply-To: <1373965494-17726-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 16 Jul 2013 11:04:54 +0200")
Message-ID: <87r4eu4z1m.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ymir.kr@gmail.com, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Tx processing functions dereference vif and caused
> NULL to be dereferenced for injected frames.
>
> Don't call these functions at all for injected
> frames. It doesn't make much sense to do so
> anyway.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
