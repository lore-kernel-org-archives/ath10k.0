Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avOyR-0004vQ-LM
 for ath10k@lists.infradead.org; Wed, 27 Apr 2016 12:53:48 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add max_tx_power for QCA6174 WLAN.RM.2.0 firmware
Date: Wed, 27 Apr 2016 12:53:23 +0000
Message-ID: <87inz3w6v1.fsf@kamboji.qca.qualcomm.com>
References: <1461608670-15386-1-git-send-email-kvalo@qca.qualcomm.com>
In-Reply-To: <1461608670-15386-1-git-send-email-kvalo@qca.qualcomm.com> (Kalle
 Valo's message of "Mon, 25 Apr 2016 21:24:30 +0300")
Content-Language: en-US
Content-ID: <B5B5A1946A2D7F49886F0A52B0BA780D@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "Liu, Alan" <alanliu@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Alan Liu <alanliu@qca.qualcomm.com>
>
> QCA6174 WLAN.RM.2.0 firmware uses max_tx_power instead of using max_reg_power
> to set transmission power. The tx power was about -50dbm, after applying this
> change, it become -32dbm.
>
> Signed-off-by: Alan Liu <alanliu@qca.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
