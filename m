Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1YxT-00058k-87
 for ath10k@lists.infradead.org; Fri, 10 Jan 2014 10:04:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: add set_bitrate_mask callback
References: <1389168513-5606-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Fri, 10 Jan 2014 12:04:11 +0200
In-Reply-To: <1389168513-5606-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Wed, 8 Jan 2014 09:08:33 +0100")
Message-ID: <87k3e89mqs.fsf@kamboji.qca.qualcomm.com>
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

> Add set_bitrate_mask callback. Currently
> ath10k HW is limited to handle only single
> fixed rate setting or limit number of used
> spatial streams.
>
> Example:
> iw wlanX set bitrates legacy-5 ht-mcs-5 vht-mcs-5 2:9
> will setup VHT, nss=2, mcs=9
>
> iw wlanX set bitrates legacy-5 18 ht-mcs-5 vht-mcs-5
> will setup legacy, 18Mbps
>
> iw wlanX set bitrates legacy-5 ht-mcs-5 3 vht-mcs-5
> will setup HT, nss=1, mcs=3
>
> iw wlanX set bitrate legacy-5 ht-mcs-5 vht-mcs-5 1:0-9
> will setup nss=1
>
> iw wlanX set bitrate legacy-5 ht-mcs-5 vht-mcs-5 1:0-9 2:0-9
> will setup nss=2
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
