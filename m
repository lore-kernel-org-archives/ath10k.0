Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1916CCAC582
	for <ath10k@archiver.kernel.org>; Tue,  9 Sep 2025 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N1NCIdRK4PVMotSCtjNyyl/LP3BVDUFyoGUcQcV1nU=; b=CGpPT9DXehFELupH0PuA5gTY3Q
	TShlEu3KvhejyGakh1EYdNBfjfoKUxCFxO44zFIXXUiusaxszjg+3ml4MtqhjM8vy294rdDAAdR2W
	4Bc9quDlHJfucYK5qPCKTNI3JIQ8jMj6PLoMqc0GapnZxuXjPFUHIyxhDPUy9oE7Q+ckmoipZP4aS
	+3R1YbZq9zf1mdd7OiU3oBwyae2OzBh/w3mOpOch2IO6C1rXUqJh9v2ZYvCDR3jIG2LREVTV/VyS3
	/xr5/dGBpdHz10gasiRdNiP83nTU+S+eU/pQnqtJUbCRRFEWuIoVAXDnBto1SF0ehaxRzWWpfOuFw
	ixLv6/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5ia-0000000AKjx-3GAQ;
	Tue, 09 Sep 2025 21:17:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5iY-0000000AKiY-22Kp
	for ath10k@lists.infradead.org;
	Tue, 09 Sep 2025 21:17:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45de6490e74so25489275e9.2
        for <ath10k@lists.infradead.org>; Tue, 09 Sep 2025 14:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757452652; x=1758057452; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N1NCIdRK4PVMotSCtjNyyl/LP3BVDUFyoGUcQcV1nU=;
        b=tZgwmdLcxDj9a9YN3RBORVMeCh9uJXl6j00edR+Nnye1vQTdEQyFrK5S2qzHCYSpoh
         v8KQrrKmwGmtjhxJmJ8Q7EDjSOjg7MZoyI1qd4dTAXdfCniR+pBKwinX+QnHJ00zJwzy
         mCg1SVZOuydF9wzEJWGE8XYMGT3YZed+Yn3fhHBZDlPs+cEn5K08ymW0m2DjuLN0NgOK
         pVLgY4BEH8d2nbA0u7fseXNial/mbq9qvfxCf8xfF/9M3rpOB7/taGaGBkF52NtXtE8b
         UpS/R9r2WXjMmzdY7B1IymWjB8x6uX71YpVaOobY6UezvBpSgh95TguvU0gLqfGUDKGn
         jWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757452652; x=1758057452;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0N1NCIdRK4PVMotSCtjNyyl/LP3BVDUFyoGUcQcV1nU=;
        b=rxmOHBHNgYf1Xwnbcvv1mpB3/ul0gWKgGWhVbDgY0qYXIe71CN3OrGzXbAVY8ivWZg
         hn93E+cYstGNKo6EXHPP5NG51bht5GOYcfI4trCa0HCQzrJMLB3NXRS4KVGxlzL62sIZ
         yP+BjGZjWEYs06Q7v7jscxye9v92xoZBlPI+/pZtO/a0uGET+4KZvelGUPYjE7qYoBPu
         UM8MX+pk2WU/UUoBWMTsDhsZUBIPriVEBdgS9XVA6STYkjEy0bcolJD2mG+Pz/IHAMXc
         hhckIBZsvFkeowyk+wPV4lZuTPlc4VPlpAuBlgfnoajuAQ4LgCHszT8w5qlF/+r5zmec
         TpCw==
X-Forwarded-Encrypted: i=1; AJvYcCVd8mydm4DI05e73FeRkbp5vfV2Lo5atAVWR0NJXaJQgbUvmrfYJmr4k3lY2KA72E87qtac/GM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8tL4un8pa0FQuZFGUAhX7sHQ/gKUrQ4tKPqk30LZlk3N9lHP
	/JrqNKrERoICEzNPF924u/lUO1yASwtRG4JVXyyklG+65H6YkesoTy+g+WywaHYSCUE=
X-Gm-Gg: ASbGncv3xn2RgDuQuDcpcKAF21vdXiVs/C8Wz5PKKBjpO07+E3ZuLX6Ymbn1y5z2KQ1
	F+Eu2Fdr5XR5gKu7XkNiXvtfm+m11ulLhvXiu+aKnayYu8Z0etkLfjk84UjF2u2CMKc2mG9inEQ
	JJxX9R7q9bCRo02Lb4hvmo4kQ+pEk8UVCycJK72fnV8If4l9P24dYonHLuRV/gX1yQ7ZQbQGc0/
	DmKL4fMUvn3WsJ0eYkUsx6DnM3ADZkLoXkXKiRm9thP8pSUKei3rx7JmDCHMqfxk6te0ayIh9wi
	N0SLv1PkmGhUOCTMsqS46c0pRjcrXequB5EIMht+2DmXBWAcVnD3b6ekpjGmPGb/JPbiulIyGsk
	mFdDkYoYdNXxkj8SV6fCm//OJQDA=
X-Google-Smtp-Source: AGHT+IFfPqt52sJ2bwTn8g9bFD7BIz/dicnzT8ODVk1qTowYr0C9FHz83+RjHbYNDSjICY3IUGu4cA==
X-Received: by 2002:a05:600c:8010:b0:45b:9912:9f1e with SMTP id 5b1f17b1804b1-45df0e619afmr31135875e9.3.1757452652352;
        Tue, 09 Sep 2025 14:17:32 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:c21d:84a2:1410:7b31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81cbd13sm1712005e9.4.2025.09.09.14.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 14:17:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 22:17:31 +0100
Message-Id: <DCOKYY8GG7IP.1ABNFNTEIME4F@linaro.org>
Subject: Re: [PATCH ath-current v2] wifi: ath10k: Fix connection after GTK
 rekeying
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, <jjohnson@kernel.org>
Cc: <stable@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <johannes@sipsolutions.net>
X-Mailer: aerc 0.20.0
References: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
In-Reply-To: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_141734_550209_DFA49F97 
X-CRM114-Status: GOOD (  20.13  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

(add stable into c/c)


On Tue Sep 2, 2025 at 3:32 PM BST, Loic Poulain wrote:
> It appears that not all hardware/firmware implementations support
> group key deletion correctly, which can lead to connection hangs
> and deauthentication following GTK rekeying (delete and install).
>
> To avoid this issue, instead of attempting to delete the key using
> the special WMI_CIPHER_NONE value, we now replace the key with an
> invalid (random) value.
>
> This behavior has been observed with WCN39xx chipsets.
>
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> Reported-by: "Alexey Klimov" <alexey.klimov@linaro.org>
> Closes: https://lore.kernel.org/all/DAWJQ2NIKY28.1XOG35E4A682G@linaro.org
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

The fix works great on RB1 board. Thank you.

Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # QRB2210 RB1

Difficult to say when this issue appeared initially. I'd say that around 6.=
6
it worked fine probably.
But latest few kernel releases like 6.16, 6.15, 6.14 definetely had this is=
sue.
Maybe makes sense to add something like that:

Cc: stable@vger.kernel.org # v6.14

> ---
>  v2: use random value instead of predictable zero value for key
>      Add Tested-on tag
>
>  drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 24dd794e31ea..154ac7a70982 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -16,6 +16,7 @@
>  #include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/bitfield.h>
> +#include <linux/random.h>
> =20
>  #include "hif.h"
>  #include "core.h"
> @@ -290,8 +291,15 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
>  		key->flags |=3D IEEE80211_KEY_FLAG_GENERATE_IV;
> =20
>  	if (cmd =3D=3D DISABLE_KEY) {
> -		arg.key_cipher =3D ar->wmi_key_cipher[WMI_CIPHER_NONE];
> -		arg.key_data =3D NULL;
> +		if (flags & WMI_KEY_GROUP) {
> +			/* Not all hardware handles group-key deletion operation
> +			 * correctly. Replace the key with a junk value to invalidate it.
> +			 */
> +			get_random_bytes(key->key, key->keylen);
> +		} else {
> +			arg.key_cipher =3D ar->wmi_key_cipher[WMI_CIPHER_NONE];
> +			arg.key_data =3D NULL;
> +		}
>  	}
> =20
>  	return ath10k_wmi_vdev_install_key(arvif->ar, &arg);


Best regards,
Alexey

