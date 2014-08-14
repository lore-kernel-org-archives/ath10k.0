Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHtz5-00048w-24
 for ath10k@lists.infradead.org; Thu, 14 Aug 2014 12:18:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k:  improve vdev map handling.
References: <1407260684-22624-1-git-send-email-greearb@candelatech.com>
Date: Thu, 14 Aug 2014 15:17:53 +0300
In-Reply-To: <1407260684-22624-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 5 Aug 2014 10:44:44
 -0700")
Message-ID: <87fvgzmfim.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Check vdev map has space before calling ffs,
> fix invalid cleanup in failure to create vdev
> case.
>
> Open-code the BIT() logic since BIT does not properly
> handle 64-bit bitfields and future patches will make
> use of larger bitfields.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
