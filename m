Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqy2n-0007N2-EJ
 for ath10k@lists.infradead.org; Mon, 03 Oct 2016 07:52:14 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: cache calibration data when the core is stopped.
Date: Mon, 3 Oct 2016 07:51:45 +0000
Message-ID: <87bmz1swdr.fsf@kamboji.qca.qualcomm.com>
References: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
In-Reply-To: <1473801118-103112-1-git-send-email-mfaltesek@google.com> (Marty
 Faltesek's message of "Tue, 13 Sep 2016 17:11:58 -0400")
Content-Language: en-US
Content-ID: <39CD8E6CCE3FD646B980EF7885264FC0@qualcomm.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marty Faltesek <mfaltesek@google.com> writes:

> Caching calibration data allows it to be accessed when the
> device is not active.
>
> Signed-off-by: Marty Faltesek <mfaltesek@google.com>

[...]

> +int
> +ath10k_cal_data_alloc(struct ath10k *ar, void **buf)
> +{

[...]

> +	ath10k_cal_data_alloc(ar, &ar->cal_data);
[...]

> +	ret = ath10k_cal_data_alloc(ar, &file->private_data);

Pointer to pointer parameters can be a source of problems and if we
could use one shared buffer for both of these cases when it would
simplify the code and we would need the buf parameter at all.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
