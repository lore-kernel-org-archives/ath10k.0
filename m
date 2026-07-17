Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189CEC44514
	for <ath10k@archiver.kernel.org>; Fri, 17 Jul 2026 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPZgr4u40Ey253+h5jZaWa/6ga/57quCqeZN6Y3LbLs=; b=XmZPYRYQ5e/OpGwYpBUletAHV+
	jjfToZat5hNIyGXfgBugEr0mZFw78wr69vmLEaVGLnNbnlwVjx1t6NBn0CTbo32u3aBUZuOR+oC02
	sJSacbCwMcv9BiDhhqrPE/G3bWyphk0SGs0MwI5fXrghnSXi0srFL3AYX2Pvg5yNtOfzfxvL40fv3
	U7Fyw0gnbwjma24DZhz+vSjOLkn3NjdtNnB67wyMh6Iw02gFDy2ZHU+oGySaZU7lW5eg07LU+VqlC
	iQ4nFjXA7AisbR9IfRP/EzYnfVJxAmYCd6/HNY7/1280lIXIVHfjWiE3YOd+NScfn0Bune0UH0F0s
	D3mK8cPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdwp-00000001dYL-2CRT;
	Fri, 17 Jul 2026 08:29:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdwn-00000001dY5-1zyH
	for ath10k@lists.infradead.org;
	Fri, 17 Jul 2026 08:29:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D72543D63
	for <ath10k@lists.infradead.org>; Fri, 17 Jul 2026 08:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354871F00ADB
	for <ath10k@lists.infradead.org>; Fri, 17 Jul 2026 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276968;
	bh=EPZgr4u40Ey253+h5jZaWa/6ga/57quCqeZN6Y3LbLs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MOxgN5Vw0ExTWFj/csnN0Eq1CWmvQhK4Uhi0Qmu6WfKTz7ScXP5gKOZ+DjIv5XEbD
	 KK55g99Uh9TRYVscAXPiRqO8rbSGR0St22hqW8n+UbyQlNEN3VTeGuiPVlB4mxsc/i
	 UWN46RdUqAoVguX6rv619gIPbCqrt+i2pT8hIRnK7AorfCbHOebHnq9jceHyuPuvrn
	 UK3Wo5pzjCVV9Rw1CE+7EC+EJlWXR1CDJXu/TPc3kCbtpF7qXyAzaA853jV0ot6UQj
	 hheX2Hg/Kq5E6zplZEjKU9Hk8SPU1IOCdZV3V+fN8UY8ylt8ewWgPKllCZzUBZCLB1
	 SZe6ydnUs4ZoA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so8148669e87.1
        for <ath10k@lists.infradead.org>; Fri, 17 Jul 2026 01:29:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqsAcga8t4u1IVGSswT0sTijFwDCZYOKFZth6uGnkjpty0I4s/XOqJ0p8mThoYhBLHlCkEuT+M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAzb71ijPx1zeaEZxS8wRV45rtR38XJmJC9vME2+P4PBFKf1Xo
	HpkR1Y1L+4xgd+8GgRsfXwC3qvtvtybpzJU1rwWs5N2rkNiqCm1b/O1W6984Z0+ZRkCiyNatNsa
	0t9swDK+DNTM+1/XqTRztnIIsILABjapaw+H3WwKVmw==
X-Received: by 2002:a05:6512:6d0:b0:5b0:1359:3dd4 with SMTP id
 2adb3069b0e04-5b28f8471b5mr432020e87.5.1784276966788; Fri, 17 Jul 2026
 01:29:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 01:29:25 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 01:29:25 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MdNehSRQT3MUs+QtbZsHcUCS8YjyZchTgHCVv-HaLQkeA@mail.gmail.com>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com> <CAMRc=MdNehSRQT3MUs+QtbZsHcUCS8YjyZchTgHCVv-HaLQkeA@mail.gmail.com>
Date: Fri, 17 Jul 2026 01:29:25 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeNHzEn+pizmbTUCU6YCiTWZS7cr_yEBSNis8NuYqYjig@mail.gmail.com>
X-Gm-Features: AUfX_mzH2Q0kFyO4TFR4vp1sRhWEa1QLfB0S2bP-OIJE8-QcpGQ5uxWfAzjRRCI
Message-ID: <CAMRc=MeNHzEn+pizmbTUCU6YCiTWZS7cr_yEBSNis8NuYqYjig@mail.gmail.com>
Subject: Re: [PATCH v8 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
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

On Wed, 15 Jul 2026 14:07:24 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Fri, 3 Jul 2026 15:45:17 +0200, Loic Poulain <loic.poulain@oss.qualcomm.com> said:
>> of_nvmem_layout_get_container() only looks for a child node named
>> "nvmem-layout" to locate the cell definitions. This does not cover
>> providers whose device tree node is itself the fixed-layout container,
>> such as an eMMC boot partition block device whose fwnode points directly
>> at a "fixed-layout" compatible partitions node.
>>
>> When no "nvmem-layout" child is present, fall back to returning the nvmem
>> device node itself if it is compatible with "fixed-layout", so that its
>> cells are parsed by nvmem_add_cells_from_fixed_layout().
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>  drivers/nvmem/layouts.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
>> index b90584e1b99eab4217cbe7ec48373e18a7caf0dc..efa631ce7283bdd6c8ecda75915911b5e3a33c99 100644
>> --- a/drivers/nvmem/layouts.c
>> +++ b/drivers/nvmem/layouts.c
>> @@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_device *nvmem,
>>
>>  struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem)
>>  {
>> -	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
>> +	struct device_node *np;
>> +
>> +	/* Search for nvmem-layout child */
>> +	np = of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
>> +	if (np)
>> +		return np;
>> +
>> +	/* The nvmem of_node is itself a fixed-layout node */
>> +	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
>> +		return of_node_get(nvmem->dev.of_node);
>> +
>> +	return NULL;
>>  }
>>  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
>>
>>
>> --
>> 2.34.1
>>
>>
>
> I have it on my TODO list to convert nvmem layouts to be fwnode-agnostic. While
> I'm not sure when I'll have the time to look into it, I think it makes sense
> to not introduce any new OF-specific interfaces. Can you make it into:
>
>   struct fwnode_handle *nvmem_layout_get_container_node(struct nvmem_device *nvmem);
>
> by replacing of_get_child_by_name() with fwnode_get_name_child_node() and
> of_device_is_compatible() with device_is_compatible()? That would mean less
> churn in the future.
>
> Other than that, it looks good.
>
> Bart
>

Scratch that, I didn't realize this isn't a new function but a rework of an
existing one.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart

