Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjTKR-0004Y8-7b
 for ath10k@lists.infradead.org; Mon, 12 Sep 2016 15:39:32 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: add platform regulatory domain support
Date: Mon, 12 Sep 2016 15:35:30 +0000
Message-ID: <87bmztm8qm.fsf@kamboji.qca.qualcomm.com>
References: <1470140454-3899-1-git-send-email-bartosz.markowski@tieto.com>
 <1470140454-3899-3-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1470140454-3899-3-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 2 Aug 2016 14:20:54 +0200")
Content-Language: en-US
Content-ID: <47216966ABDBC143B216FC61159B7882@qualcomm.com>
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
To: "bartosz.markowski@tieto.com" <bartosz.markowski@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> This overrides whatever regulatory the device
> EEPROM contains and uses what the platform says
> instead - in this implementation the ACPI driver.
>
> In case the hint is not programmed or corrupted (0xffff)
> the device falls back to the eeprom programmed settings.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

[...]

> +#ifdef CONFIG_ACPI
> +#define WRD_METHOD "WRDD"
> +#define WRDD_WIFI  (0x07)
> +
> +static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
> +{

I don't think the ifdef is really necessary, acpi.h should handle that
(hopefully). Also I changed the error handling to use standard error
values and changed the info messages to dbg, they are too spammy in my
opinion. Please check carefully my changes in the pending branch:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=fe91745381ec3999d8de6dedb07b396c82539717

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
