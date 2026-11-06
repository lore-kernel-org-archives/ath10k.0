Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADEB606A32C
	for <ath10k@archiver.kernel.org>; Fri,  6 Nov 2026 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SHiO4QFh;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7OqdLX3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXgHm6ai
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CUMcAVyOirUSnIO4z8+9Oid/43N5zWiqbL31INqDBvs=; b=SHiO4QFhc8Ntku
	fwaxP/J/a2iIAZRUQ4kmwjwlVX0n8Vmqd7EreYtKuE2UZmDnaPTaqurmd9Yaaa/nNll+q7NRi0KrY
	NhA959TdQctrivZS8GYzeqbmdQ1g2zCyRTGev+HYUz+gRfm9PXdb2v1H0x7UoqzJLYpU35uWvcMmP
	GMXqLapCNaRK5kq0M86BCM6tVxZqIlY4w/6yAPK/kMyZgZd8KY+yNmUE2BK1D2eiDVfJialgRf4LD
	UQfegsX0Almbdbzjmtj4+FJIFJKVHZO4aawIHZttGCoYsOr6AD8nbjqtwmJzY2zo0+fBuTwpAc3Xl
	k1t93UfkCJoAy8pXuI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOsg-0000000DQVP-3FX5;
	Fri, 06 Nov 2026 18:41:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOsc-0000000DQUb-2EXb
	for ath10k@lists.infradead.org;
	Fri, 06 Nov 2026 18:41:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HtFcu489656
	for <ath10k@lists.infradead.org>; Fri, 6 Nov 2026 18:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUMcAVyOirUSnIO4z8+9Oid/43N5zWiqbL31INqDBvs=; b=c7OqdLX3Uj+TBpdC
	oqL865Tb2uVszHJk3qkJYH6kLQvGw/yVPe6PI9eIRv15udAcLLqG6UR0v9x34VPd
	rqOFHoWdX+ilvD3r5k7pEYe1VI5n7B3aAYZKqLOE6Up552R/UgXhV6aSMi9iR0yA
	yXzoSy3dAHKYFyDGYsjF0bFbKFzX4bSWKc4hAqH+2ALaFsFQFLjcpV1DtQ72eo+9
	qTjYx7a+EgbYBZorVurnW67Rzb+RnfTxqD2C91mr/i5oAQvuO5qVl3Xc774QSeV5
	+Vgo10VEpHJG4XtK3CxlUVQaishxG9jh3seF7r1am1bVcchbbT5EwlshXAn8bfsy
	ytBfMA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa485c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 06 Nov 2026 18:41:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06da65d92so714002b3a.0
        for <ath10k@lists.infradead.org>; Fri, 06 Nov 2026 10:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990496; cv=none;
        d=google.com; s=arc-20260327;
        b=si+o3o2GnVZJW0I7iZWjbYadkCqlfxQC3S9WeZjeCNGLaiuUSdjsRLQZPbpUULQtec
         7jBiypEZmF0mKE4CCDHcLe7eSs+zQ0xlpoeATFpIGSrOZd/QVOM2MbchEEwH86NH95gP
         7VdZ9xgbR0C4i7g0Z8vGDTqIwmqwBuoyLBOd1Bnjvm8EaUXxcKINGOyhxlHOAe5PLK4u
         ZM4+Ii4k/ZTOwrT7dVhbujtOf9iouBuiWjauyx+DyMV1TKS3Rf4QO6hRiGjBhkIUTTlj
         m+dRVwDyQlbeX7hQnNBW9oj6PIKzyhrWoHVCxABVARk77DLGIkKnGCaNPCGhniHup1Dv
         3lNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUMcAVyOirUSnIO4z8+9Oid/43N5zWiqbL31INqDBvs=;
        fh=LlrjCx4snE7mAlivXsIXL6cA5l+qldgps3i9BDENtsU=;
        b=cQ/R61eUDrzaV24MPFh+QMWDhK1+r1lKc8oxNSesKdAv6T31udNapUEEvMDzidNi9d
         RWWAyttnbN5+IMleHx1IJSLBhOAJhHSGlzKLJTW9aqG+S9yoW9WzcigraFiVg+zm0KoZ
         YdIilKNkRzPcWXz1kgA6oAAZs/1Ri/6Tg83r1giiX7ReFNptR7cn8eZ+ujYNrLVtkHQw
         zie8q3ZzaWhtS1b0Dm6ploTTolw7VxFb824e7OJ2nhGYooDHWMT8wvwb24hl292toWvO
         GE+gk62siis32AKP76wXE7LN0Yl4KVRxSLCWR6c1QqQ6NlBziOG8GTXU0GgOcCl7YXGl
         aexw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793990496; x=1794595296; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUMcAVyOirUSnIO4z8+9Oid/43N5zWiqbL31INqDBvs=;
        b=HXgHm6ai5JQTHE0MQs9S89kjoYIj9ffTn8kUF15ywuYRkW5+qklIXHuOYqa0NHYkHW
         3LNlW+uEQRaEHx+7mRVgMDIeenhTnQO1gdPY7j407KBAso+vo0Zor3V5K0JdQ8A030DL
         Y7pLtGiyuo0JPHyyrKIQsP463sb5ibPaq1HmpM0pYA131XJDQwfaRYbQyHEzbGjXMIl4
         JiLaSLiyVssRUz0sKw12Yhd3yamkCBRfoUnODjYcWRS/htvlFHaZz7/2M12WFUr6BizP
         5viB8QY9XGWkJjLd6trNyiRy7h9/TXZKfB9q/jHGcp5ysv7vBpSlN71Y8L7U2GoAaRYK
         wglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990496; x=1794595296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUMcAVyOirUSnIO4z8+9Oid/43N5zWiqbL31INqDBvs=;
        b=LLooyKWosK4K+25KAI2oU/IbIwEBd1cE2WJAbb7V34VD7qTtQ9B7D8K4++E1edqi/s
         2IxhrF/RrHKL9OE70b+t5QZCIOf0CdbPKXL8liRTySgQ8Oi+2cgUpm9h0FLlSLCx7otV
         fSiUCVoAAnrpMzftMCPEX/vfoMJnaDcxyJDZbeYNwpxtGOGE8Mzv252fH1BoxaNNj7H5
         Vaaq0+kpFUUf0HgmHXHKyQUnuHmFqgtwaoxcYzW6nl9NBucwFA+ik30YKtRpJK6ftxH/
         EOFtWtmVn7DcXnu34IkVLIFcQ6iNps1YL/IQpmUchnZGwon/3+KGUipS+oBF4kWcBUPw
         ZABg==
X-Forwarded-Encrypted: i=1; AKwUvBxFbfDQ8kkGZLG35XDN8U6eeMb9oViTNV5IlkqhMbWO0I0KgDR4gPxA+qkWRm1qisqImJRKohc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+YT7TGTwW5Qxwv3de9nDgwWboF+mq8mV8AUZhjFsDUQK4p4jxs
	9ovLv/zTBxDY0EzLrpecykUfxtA/A06rl1hdZq7PPTBKG5NFZWjpxr6W8fayahddkIERIYAfZTK
	za3agegaIIwTtjhLjRklbshhlU/NuLS2vIqgWLia1SRWqqXCP31SsvuHVjQnvoTX0F2tceRARP5
	m0D444D5Vgstr8m4vddA0Cc0T1/8Dfp9vkYRmBURY=
X-Gm-Gg: AYBFou204v7pQTlxnHjb8pIGa67FdAbq4xxPLR2L5dbgGxcrl2KzI5P+67Du6rSjKuq
	ghn7MUzpCP2njccRAh/yBHCNLp51IKlQBUMZkVvsY8FBGCvl4GfMgpj3V4KJUAg+S8keqJNTnVq
	UZpMmiilw0/v/5WZSVONvHkeFJ15GCSlbFbBQfN0gglEli6d/VThDBf4AVNQ==
X-Received: by 2002:a05:6a00:3d0b:b0:881:9f52:ca00 with SMTP id d2e1a72fcca58-8b37bd5461emr2936019b3a.42.1793990496147;
        Fri, 06 Nov 2026 10:41:36 -0800 (PST)
X-Received: by 2002:a05:6a00:3d0b:b0:881:9f52:ca00 with SMTP id
 d2e1a72fcca58-8b37bd5461emr2935994b3a.42.1793990495661; Fri, 06 Nov 2026
 10:41:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102-block-as-nvmem-v12-0-f4a2a681087d@oss.qualcomm.com> <20261102-block-as-nvmem-v12-1-f4a2a681087d@oss.qualcomm.com>
In-Reply-To: <20261102-block-as-nvmem-v12-1-f4a2a681087d@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 19:41:24 +0100
X-Gm-Features: AclHuK9emUwSj3_sGAuhi1FbbmSEvMQZ92eVANQc1PZljiIDDYIawbYL0H56MVQ
Message-ID: <CAPx+jO9Hwqn__vdZn_2yCAy9nuMHR2=8shjjQdWQ4S9JWUknQQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/2] block: partitions: of: Attach partition fwnode to
 the block device
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX3tSIDOAt+SXw
 3q458yUE9Ufkh1OfKIz7YknXxWm60YiJMs6epuYB0D7VYy2gEDJ//lhwpRJywJnGZ3wkPgX/lUJ
 8VDPmjelfsguNaQpJqxQoHPhkfeaJ4zM7wSRBfCZN//0c7mfFs3iUuf1PifTHDtyg0E0kAeRnm7
 zNUVwKwMOk4mS/xDk/wEMnRYTZAOMTxFB/K0jr4oEgD6ZueWdd2ygHBo4KcP+MFetknryXODzif
 gVkW6u3HFeCuDpX2E7EwRuQLjvCP2+iXXR4OT0ncCY1pl8jBveGINChmLZhUbZxDdqOuGHQJgN8
 PkSaa0I2TujahCAvTWRLbpf9ZhU88aJ7avOBoX8rK28enWotePWVMirplzQAopz3wAysSDI14I9
 FegRsFs22hY7iHizxXGfEi2IRyRfciJZCq4SENLcr2A8AW21bHJ8p701g635QxfrYmskIBRO1cr
 x1CVj6BEkVoaLyAFTog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfXy/S5r7s9jmTH
 NtCOtDNuemH/3dQhLXTog4PRnAQQCy8gsuq+rnbdAR9gz+XgPoipPZagKZueBURhAf/KLN2eK7n
 Gpi0IbdbJpPRw8nedXsDzGxiX87fZFc=
X-Proofpoint-ORIG-GUID: 1HI2hV8Zus0SMvWAjS0H5IJb4vXe985b
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aee1f61 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=YqnSXwVskR_DcSjeyREA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 1HI2hV8Zus0SMvWAjS0H5IJb4vXe985b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_104138_692335_1E65EFAD 
X-CRM114-Status: GOOD (  28.80  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 5:27=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> The OF partition parser reads offset, size and label from each
> "fixed-partitions" child node but does not associate that node with the
> resulting partition block device. As a result a partition has no
> of_node, unlike the whole-disk device which gets its firmware node via
> add_disk_fwnode().
>
> Carry the partition's device tree node through the parser and attach it
> to the partition's block device with device_set_node(), mirroring the
> whole-disk case. This lets consumers describe per-partition properties
> in the device tree (for example an NVMEM layout on a partition node) and
> look them up through the partition device.
>
> No functional change for existing users, partitions without a matching
> device tree node simply get a NULL fwnode.
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  block/partitions/check.h |  1 +
>  block/partitions/core.c  | 20 +++++++++++++++++---
>  block/partitions/of.c    |  3 +++
>  3 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/block/partitions/check.h b/block/partitions/check.h
> index b0997467b61a54a8a621b9c155c8329289649460..326081499d9a6be730dbd659c=
110449cfa06921f 100644
> --- a/block/partitions/check.h
> +++ b/block/partitions/check.h
> @@ -17,6 +17,7 @@ struct parsed_partitions {
>                 int flags;
>                 bool has_info;
>                 struct partition_meta_info info;
> +               struct fwnode_handle *fwnode;
>         } *parts;
>         int next;
>         int limit;
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index b5c59b79ca7cbb28d4d93478ee1c80908f76ee9f..eee954df1ac6ef7dd4f02ad5c=
9d49aed778bf015 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -11,6 +11,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/ctype.h>
>  #include <linux/vmalloc.h>
> +#include <linux/property.h>
>  #include <linux/raid/detect.h>
>  #include "check.h"
>
> @@ -110,8 +111,17 @@ static struct parsed_partitions *allocate_partitions=
(struct gendisk *hd)
>         return state;
>  }
>
> +static void drop_partitions_fwnodes(struct parsed_partitions *state)
> +{
> +       for (int i =3D 0; i < state->limit; i++) {
> +               fwnode_handle_put(state->parts[i].fwnode);
> +               state->parts[i].fwnode =3D NULL;
> +       }
> +}
> +
>  static void free_partitions(struct parsed_partitions *state)
>  {
> +       drop_partitions_fwnodes(state);
>         vfree(state->parts);
>         kfree(state);
>  }
> @@ -139,6 +149,7 @@ static struct parsed_partitions *check_partition(stru=
ct gendisk *hd)
>
>         i =3D res =3D err =3D 0;
>         while (!res && check_part[i]) {
> +               drop_partitions_fwnodes(state);
>                 memset(state->parts, 0, state->limit * sizeof(state->part=
s[0]));
>                 res =3D check_part[i++](state);
>                 if (res < 0) {
> @@ -247,6 +258,7 @@ static const struct attribute_group *part_attr_groups=
[] =3D {
>
>  static void part_release(struct device *dev)
>  {
> +       fwnode_handle_put(dev_fwnode(dev));
>         put_disk(dev_to_bdev(dev)->bd_disk);
>         bdev_drop(dev_to_bdev(dev));
>  }
> @@ -294,7 +306,8 @@ static const DEVICE_ATTR(whole_disk, 0444, whole_disk=
_show, NULL);
>   */
>  static struct block_device *add_partition(struct gendisk *disk, int part=
no,
>                                 sector_t start, sector_t len, int flags,
> -                               struct partition_meta_info *info)
> +                               struct partition_meta_info *info,
> +                               struct fwnode_handle *fwnode)
>  {
>         dev_t devt =3D MKDEV(0, 0);
>         struct device *ddev =3D disk_to_dev(disk);
> @@ -343,6 +356,7 @@ static struct block_device *add_partition(struct gend=
isk *disk, int partno,
>         pdev->class =3D &block_class;
>         pdev->type =3D &part_type;
>         pdev->parent =3D ddev;
> +       device_set_node(pdev, fwnode_handle_get(fwnode));
>
>         /* in consecutive minor range? */
>         if (bdev_partno(bdev) < disk->minors) {
> @@ -449,7 +463,7 @@ int bdev_add_partition(struct gendisk *disk, int part=
no, sector_t start,
>         }
>
>         part =3D add_partition(disk, partno, start, length,
> -                       ADDPART_FLAG_NONE, NULL);
> +                       ADDPART_FLAG_NONE, NULL, NULL);
>         ret =3D PTR_ERR_OR_ZERO(part);
>  out:
>         mutex_unlock(&disk->open_mutex);
> @@ -564,7 +578,7 @@ static bool blk_add_partition(struct gendisk *disk,
>         }
>
>         part =3D add_partition(disk, p, from, size, state->parts[p].flags=
,
> -                            &state->parts[p].info);
> +                            &state->parts[p].info, state->parts[p].fwnod=
e);
>         if (IS_ERR(part)) {
>                 if (PTR_ERR(part) !=3D -ENXIO) {
>                         printk(KERN_ERR " %s: p%d could not be added: %pe=
\n",
> diff --git a/block/partitions/of.c b/block/partitions/of.c
> index 53664ea06b6540e3d1155141adaafac7286f2d21..4fc7c80c407de42b2b31be2c8=
2e0e6bc2a30c9e3 100644
> --- a/block/partitions/of.c
> +++ b/block/partitions/of.c
> @@ -3,6 +3,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/major.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/string.h>
>  #include "check.h"
>
> @@ -62,6 +63,8 @@ static void add_of_partition(struct parsed_partitions *=
state, int slot,
>                 partname =3D of_get_property(np, "name", &len);
>         strscpy(info->volname, partname, sizeof(info->volname));
>
> +       state->parts[slot].fwnode =3D fwnode_handle_get(of_fwnode_handle(=
np));
> +
>         seq_buf_printf(&state->pp_buf, "(%s)", info->volname);
>  }
>
>
> --
> 2.34.1
>

