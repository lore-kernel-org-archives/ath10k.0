Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTDkv-0001b6-On
 for ath10k@lists.infradead.org; Mon, 07 Oct 2013 16:34:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: Fix bug in max. VHT A-MPDU size
References: <to=1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
 <1380874630-14280-2-git-send-email-michal.kazior@tieto.com>
Date: Mon, 7 Oct 2013 19:33:35 +0300
In-Reply-To: <1380874630-14280-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Oct 2013 10:17:09 +0200")
Message-ID: <87pprht50g.fsf@kamboji.qca.qualcomm.com>
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
Cc: Sujith Manoharan <c_manoha@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> For VHT peers, the maximum A-MPDU size has to be calculated
> from the VHT capabilities element and not the HT-cap. The formula
> is the same, but a higher value is used in VHT, allowing larger
> aggregates to be transmitted.
>
> The patch contains a workaround for some Netgear/Linksys APs that
> report Rx A-MPDU factor incorrectly.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I see warnings with this patch:

drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_peer_assoc_h_vht':
drivers/net/wireless/ath/ath10k/mac.c:1049:179: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/wireless/ath/ath10k/mac.c:1049:30: error: incompatible types in comparison expression (different signedness)
drivers/net/wireless/ath/ath10k/mac.c:1042: WARNING: line over 80 characters

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
