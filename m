Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1wwC-0003ea-PV
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 13:18:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: enable VHT for IBSS
References: <1433742144-19876-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 8 Jun 2015 16:17:31 +0300
In-Reply-To: <1433742144-19876-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Mon, 8 Jun 2015 07:42:24 +0200")
Message-ID: <871thmjq50.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Enable VHT support for IBSS.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

You should give background info here. For example, why did you enable
now and not earlier? How did you test it? What user space requirements
(wpasupplicant version etc) there are? What kind of throughput did you
see?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
