Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu21Y-00034C-Hr
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 17:39:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: debugfs file to enable Bluetooth coexistence
 feature
References: <1446282441-19368-1-git-send-email-kvalo@qca.qualcomm.com>
Date: Wed, 4 Nov 2015 19:38:26 +0200
In-Reply-To: <1446282441-19368-1-git-send-email-kvalo@qca.qualcomm.com> (Kalle
 Valo's message of "Sat, 31 Oct 2015 11:07:21 +0200")
Message-ID: <87twp1br71.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: Yanbo Li <yanbol@qca.qualcomm.com>, linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Yanbo Li <yanbol@qca.qualcomm.com>
>
> As not all QCA98XX radios are not connected to Bluetooth modules, enabling the
> BT coex feature in firmware will have side effects if the radio's GPIO are
> connected with other (non-BT) HW modules. Add debugfs file to control the
> firmware BT coex logic and set the feature as disable by default to avoid that
> btcoex is accidentally enabled.
>
> To enable this feature, execute:
>
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/btcoex
>
> To disable:
>
> echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/btcoex
>
> The firmware support this feature since 10.2.4.54 on 2G-only board, dual band
> or 5G boards don't support this. The feature's name is WMI_SERVICE_COEX_GPIO
> and the btcoex file is not created if firmware doesn't support it.
>
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>
> [kvalo@qca.qualcomm.com: use btcoex filename and other smaller fixes]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
