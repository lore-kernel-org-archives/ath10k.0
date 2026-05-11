Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F19CD37AC
	for <ath10k@archiver.kernel.org>; Mon, 11 May 2026 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5kNe6XsSoN1ErY88BB0y7dq4fVUmXp3gmZ+1MTa/wA=; b=h/9Gj3+LjV4xzihJbHnBu6/4Ks
	tfSjLvwR2x0nDG6jHhClWt0gq/AZvbv6oIgx6thPHCCi4XMuUVGKDFtfR0fnA3CcTmn0xRgRORNtx
	0mBU16pq85v54KB3PHnl616B4N5tqbXbZwLaxA3LEfbn0g3tb5wly9l/6bNswLUsoTnYpkFTDBnxx
	uNk+CvwCLbZQdU3iga7Mt7KBPxh6Q4B3B1TZ01TxklbI2A1VN6BkjhNbFP6CMQfTw3CBIrEd3OoIk
	nWKV143gHjLAcgJFYjxvrOBGSQts6Qvbid5hE2QRMEAHZPkPug22cG8qzTjHD6L/PGHcp3dhu+wRO
	L91LLF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOph-0000000DK6p-0hEd;
	Mon, 11 May 2026 11:29:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOpf-0000000DK6b-3sme
	for ath10k@lists.infradead.org;
	Mon, 11 May 2026 11:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C23E6001A
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 11:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C190CC2BCB0
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778498994;
	bh=tdFL3cPC7dgZ1OdiKSsShuzcagDej0oltX3UD+D1qeU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=BNoY/Up3ZZK4KlFbFax3F2kAw3dOU2aIIblQC5p9XzrxxPp7amEIyAmyjsnuhhPK/
	 eJfdm+/qgfFTrdvXXrUYLCUeFinCda6+cPZlBge9jus0bumwq/9uhCOkNkfQ2CfS/g
	 mNZpqLZgHfTcNk2QuzIZvb06ofR6nYRUa/aes2/oztQdbQv+AgZ0tmW1349GeCI61x
	 dcR9Z8ayd79ftB9acJ6oGbCVEM0nJXwstKkgn30Ps1428UYuLzvOoU2jYoQRGv4PWz
	 LqHzh2SFlhHFmTszTalKz1N7r6aj8n25n431M9yJWdZl+B6lkAygJMi4plE6L4iVXA
	 5VTVpE9hiXXlQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso3574918e87.3
        for <ath10k@lists.infradead.org>; Mon, 11 May 2026 04:29:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8l9dk286rQHfRq0HJPA8a7Zjb2mK1+SrE/LwUMk4c6A42QMSQ7PNzD3DuDSbvub8hqyCam7bY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJVwDH+pc3jawykl/40AZLyE4McJbmPbdmZxYxA3kpDqEK39lo
	Qi6UvQ9TIHJPHMUhtvmbzb1e2njzM4atvCI2KPg+rRnYBD8pbYkgX56tcBVMx9ZWe9y+JBld72e
	1pN8NGn9f/jKWcMzn+R6ePYbfMtJbt9teHyntppb6Lw==
X-Received: by 2002:a05:6512:1543:10b0:5a8:886a:1164 with SMTP id
 2adb3069b0e04-5a8886a11ccmr6099795e87.28.1778498993519; Mon, 11 May 2026
 04:29:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:29:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:29:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-block-as-nvmem-v2-7-bf17edd5134e@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com> <20260507-block-as-nvmem-v2-7-bf17edd5134e@oss.qualcomm.com>
Date: Mon, 11 May 2026 04:29:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfd-aZ4MYiREuj_+J1ffa3U5hq5akJm-Gmxt=M=U=ysoQ@mail.gmail.com>
X-Gm-Features: AVHnY4ILi1PcmSG850nlSHDG8-qtHUQDx3iBPHF4VU-jbJRdQWICOE-eFNii9gk
Message-ID: <CAMRc=Mfd-aZ4MYiREuj_+J1ffa3U5hq5akJm-Gmxt=M=U=ysoQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 7 May 2026 17:24:42 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> When the controller BD address is invalid (zero or default),
> set the NVMEM quirks to allow retrieving the address from a
> 'local-bd-address' NVMEM cell. The BD address is often stored
> alongside the WiFi MAC address in big-endian format, so also
> set the big-endian quirk.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
>  	}
>
>  	bda = (struct hci_rp_read_bd_addr *)skb->data;
> -	if (!bacmp(&bda->bdaddr, &config->bdaddr))
> +	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
>  		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
> +		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
> +		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
> +	}
>
>  	kfree_skb(skb);
>
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

