Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYavl-0004Vj-CV
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 13:56:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: setup maximum number of supported stations
References: <1426162301-27066-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Thu, 19 Mar 2015 15:55:43 +0200
In-Reply-To: <1426162301-27066-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Thu, 12 Mar 2015 13:11:41 +0100")
Message-ID: <87sid1hz1c.fsf@kamboji.qca.qualcomm.com>
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

> Setup maximum number of associated stations supported in
> AP/P2P_GO mode.
>
> This allow hostapd/wpa_supplicant to play with that limit
> and set more information (eg. P2P group limit bit for P2P_GO).
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
