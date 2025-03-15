Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B66C28B28
	for <ath10k@archiver.kernel.org>; Sat, 15 Mar 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGlZFvZfm88isKcoulh/KwTKVJVuiJPPYQnuQQ1zfLU=; b=m3xhICbRU/FcmB0TgrICWadFvM
	+FxV7SIuVFEy/5nWYvtbOYSlabq7pw46L9kaKHlAtxuaTFI5VUe/tU0r7rTMVQDk40jWisWYpYHFB
	0v2tBggHhRhLVC+KKoPeloom8JtC4Rl5/mVP6AYtEUZE454NpcZN2AEMkEld/tjFzsq7TDxfx4VZU
	ROaERvhSmgflcynElQQ9sj4mPqnywQC+gs7ZxEONzVqdy86R7d72HPji2vN+enmwb7Oz2Fc/sZ/MC
	j2uye3TyHnZO0+YJj7i5O6LCidZkBjxFABn0qcAebDgATCjqwDnJ1rSOsOKcIz79jhCoRX0U+ucg4
	6AdtP+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOQf-0000000GBuC-1SgP;
	Sat, 15 Mar 2025 10:07:41 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOQc-0000000GBte-41O8
	for ath10k@lists.infradead.org;
	Sat, 15 Mar 2025 10:07:40 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so2583386276.0
        for <ath10k@lists.infradead.org>; Sat, 15 Mar 2025 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742033257; x=1742638057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGlZFvZfm88isKcoulh/KwTKVJVuiJPPYQnuQQ1zfLU=;
        b=XYZ4fmmfmsDNVmbbWoFt8Vs3gZkqb5pNapUPjyMffGs3yNb3TRUGFmzuEK1RnHOqJp
         bTzMcpsw2WeMIue5molPG+OkBhZWAfn6YywL7eXPxay5wUzc+cG9WCOzTnriiz/EAXbg
         LYua0O2NXkD36B89bA23ehDd+XrsBypwXIIzrinIlk3lkgV0Fy5EBUi+imUFJTc/kRRu
         Q25E1LxJ49/8zLCUwgDsqW7d+prjWnFODKmowzTSUdBmw2QxgRJXfTheiQ5lzHu0lO6r
         cDet0pNwtO+NPgFK0N9Bv6UdYZan/D/Xolw1qpOXUtVjtQYqW1d4do3tTqrCAjX/O3JN
         2V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742033257; x=1742638057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGlZFvZfm88isKcoulh/KwTKVJVuiJPPYQnuQQ1zfLU=;
        b=YMzf0hlk9WEGmCdRgdR7EWCY4VVSu+am/MvALopiE028tgiCGLTjRzq/DwpUsz7cMr
         g9BbsvxauqJ1LYrzXaEWgSwpbNl0cfLLGTL+6tWoTwi9ADamMxM7uQRZgRQQS4b0MhOY
         I0CHX1O8EImQVlAr+1F1RA2DMalUCRgRGRKjDnjyssAh13o834FNwKF2ZFYuEm5oXyOB
         jBI56ZHOdtHtin1Q8ImRDvrXt+0/x2zLn9f9+wu2J+bBf4M4S2lCoo5fnEeVhOWBavPM
         ZUZ+3HVYjIg9ZQfYqXM8iXe2ciC/sA0oL8HhQX+UrLkZHds+nAuONWlgjzYhHIQqDZH3
         dNYg==
X-Forwarded-Encrypted: i=1; AJvYcCXto8g2EUbK98OaVkooRIq9Nkzv58kO61FF1KMsXfFUjPSuRHzygtXrq8FlfA7wxODzbk9f+os=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeQbS7EtBLa6roct229UyDjYSFVCYtGarId/1KwebsuTn6c0Tl
	KD1sXq6MKBxO92Zd13Du9G8ooLVHBH9R92uFeVyE5UNaAc+SsjsGOJoZEltumlwJJfCBKcsmLjv
	Ps4MKAQQMXXQbC38noH4cVmyxC2Y=
X-Gm-Gg: ASbGncsA3WiiQUq7pDNwVwFNXUSAekTS5vdZVo34QO2qAWJOqA6aS6OgTA9Zo648JT+
	li5BfSA9dW2N0IQqA/kMtv2tCuwBd+piMrE+TqXAvLo2+YL/ik/Zep6Guk2MYRrccCLmiI/c9fu
	wLYwi9FUUuo+Upe+C0acGgtbCz
X-Google-Smtp-Source: AGHT+IE11sQPRIpzZbq2NFHpxQs6H1PqpdulLW628NDgTYC/eVpO7hed27zZ1h3Mq6ubu15nCNX8P+oVzvr1UvGVzVI=
X-Received: by 2002:a05:6902:2193:b0:e5b:4a7b:c518 with SMTP id
 3f1490d57ef6-e63e39c694emr12719812276.1.1742033257413; Sat, 15 Mar 2025
 03:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250314233831.2535170-1-robh@kernel.org>
In-Reply-To: <20250314233831.2535170-1-robh@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 15 Mar 2025 11:07:26 +0100
X-Gm-Features: AQ5f1JooJYPeTJ0YMq4_G1gemn0pgqtGzv9GsP7MiL9KKeUJpi_76QTlFj86bCw
Message-ID: <CAOiHx=mr+MFE_7Krue4BPrtvtyJW0pWUBXCrqbViVH5oOTT2Hw@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Drop of_get_property() call
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_030739_034863_8D5D6D5B 
X-CRM114-Status: GOOD (  24.41  )
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

Hi,

On Sat, Mar 15, 2025 at 12:39=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
> There's no need to check the property presence and length before calling
> of_property_read_u8_array() as it will return an error if the property
> is missing or the length is too small. The return errno doesn't matter
> to the caller, so no change in behavior there.
>
> Change of_property_read_u8_array() to of_property_read_variable_u8_array(=
)
> as the former allows properties to be longer than the requested length.
> Now the property has to be the exact length requested as the removed
> check required.
>
> This part of a larger effort to remove DT functions like
> of_get_property() and of_find_property() which return raw DT data
> having no reference counting.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Add check that cal_data_len is non-zero
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index b3294287bce1..47206b171aa5 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1889,39 +1889,29 @@ static int ath10k_download_cal_file(struct ath10k=
 *ar,
>  static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name=
)
>  {
>         struct device_node *node;
> -       int data_len;
> +       int data_len =3D ar->hw_params.cal_data_len;
>         void *data;
>         int ret;
>
>         node =3D ar->dev->of_node;
> -       if (!node)
> +       if (!node || !data_len)
>                 /* Device Tree is optional, don't print any warnings if
>                  * there's no node for ath10k.
>                  */
>                 return -ENOENT;
>
> -       if (!of_get_property(node, dt_name, &data_len)) {
> -               /* The calibration data node is optional */
> -               return -ENOENT;
> -       }
> -
> -       if (data_len !=3D ar->hw_params.cal_data_len) {
> -               ath10k_warn(ar, "invalid calibration data length in DT: %=
d\n",
> -                           data_len);
> -               ret =3D -EMSGSIZE;
> -               goto out;
> -       }
> -
>         data =3D kmalloc(data_len, GFP_KERNEL);
>         if (!data) {
>                 ret =3D -ENOMEM;
>                 goto out;
>         }
>
> -       ret =3D of_property_read_u8_array(node, dt_name, data, data_len);
> +       ret =3D of_property_read_variable_u8_array(node, dt_name, data, d=
ata_len, data_len);
>         if (ret) {

of_property_read_u8_array() returns 0 on success, but
of_property_read_variable_u8_array() returns the number of elements
read on success, so this check needs to be ret < 0 now.

> -               ath10k_warn(ar, "failed to read calibration data from DT:=
 %d\n",
> -                           ret);
> +               /* Don't warn if optional property not found  */
> +               if (ret !=3D -EINVAL)
> +                       ath10k_warn(ar, "failed to read calibration data =
from DT: %d\n",
> +                                   ret);

Best regards,
Jonas

