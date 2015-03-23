Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya3rf-000540-05
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 15:02:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k: add WOW disconnect/magic-packet support
References: <1425887720-11466-1-git-send-email-janusz.dziedzic@tieto.com>
 <1425887720-11466-2-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 23 Mar 2015 17:01:29 +0200
In-Reply-To: <1425887720-11466-2-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Mon, 9 Mar 2015 08:55:18 +0100")
Message-ID: <87fv8vep12.fsf@kamboji.qca.qualcomm.com>
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

> Add support for WOW disconnect and magic-packet.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

[...]

> +#ifdef CONFIG_PM
> +int ath10k_wow_init(struct ieee80211_hw *hw);

[...]

> +#else
> +static inline int ath10k_wow_init(struct ieee80211_hw *hw)
> +{
> +	return 0;
> +}

In pending branch I changed these to:

int ath10k_wow_init(struct ath10k *ar);

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
