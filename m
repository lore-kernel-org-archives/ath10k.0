Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E07CE7AE8
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=; b=WPv5kihVnRACU1b8aA4Wh6+Ybm
	Zq/5oJ17i27qKFq3Zi4Q0+nPZjibiceI9BF7cdSWn8my1FF/buXu2/zbmwdUe9JoSAf4XqAa9vYgZ
	VjxiTeNqXM+DAs2LCkQjMS4wUCgPDcYJW9MhAbF85vA5wiJuQ1Yx0GDpJGeSK4HQj6vMZXWRe9QAa
	XdcTuQFrXHcNm3XvGirjIqf0/ZbVyzimrFpJLcuGMh6iXqTiutHCJedqR+/P9trhG/tpC8luciO1r
	vCKDYrkG4SWItAmNN3k3DcQOFzzcZ5cv51LK/RP15zLk89Xa0mUoTn25Lf3jW4CDdH9Sk5Q5uf5HJ
	EvLe2U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrmv-0000000C6TG-1g3I;
	Fri, 14 Nov 2025 11:16:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrmr-0000000C6Ri-0FLq
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 11:16:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8E2pe1494600
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=; b=MF5EcXQoprYWPOv2
	pbCM18oA6jCu7BmJjyevTcl0kPdOo9YvGwxrfwmUaan7w++fVoT9Nod0+NrcW90M
	//93an4TyDQZ+BC68tumTS1yKqSn+lfDMQI9ca6afEGcGUJSzKHX0/zAAylE2NEo
	+IVCP+jmNV5LAMIihOHiIdAWAQYmwnvbcHR71KZOFVTuoQYbK0f+WS2+LMcmXjV3
	S+xZg8fkrZCHwfZNyI4A29Nf+AvKOeRc8KdmZxUDb6cu+n9b5WEgs/AEI0oZIqPE
	bsnLr0UQYUT2r5eMMzxh9w964RlnpzuvookeT5FUkHkY26l3uRjUdWY1kLHwvUi2
	p4vXsQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dsxc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:16:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9208e1976so2094329b3a.1
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 03:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118974; x=1763723774; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=;
        b=ims58d3e0YpvzkCW3s1G5rZrIKD2rdK0Zta5RNo+LWWfXk+E82H+k1tP9D1COASYYb
         7XDSDfhLhlCmWQLg6YC5boZY/JBxZjl9lwDTCZ/pCBArNVNxEA6AxEpomhMffIohe2pL
         kMVilioWqZpjgv2euAwiyMiqny2XOWfpq1bNbCT0q0A7sc+mc/CZ/P280ZBxiXVTpfKw
         yOkj1iU8RXrDJj9zrXwoC45mQjOq0o+N+BfFQLXTGK7xoA3r3j9ZAIWYw0UNTnF2ezks
         EHgx1W9EVa+CY0WWR0f+6JTrvBe9biynJ9WWZFpJbxwUF2ULCmnJ3AtZgnxPv5euh77r
         6qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118974; x=1763723774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=;
        b=gd1SfGvCFZxFsUL2IcCjLgzezFq3MOMZTTL9gLtle0YhBSVO5z5igw02cVwGr4Z6pS
         ML0MGFF8WnA1d+oLXw5W3zSaoF2CnovK6nHFk+1z9oS3PaAQatFsmJMxtcC4iwcbd1ei
         F8T46KHq5ZQApx8QmqxTbiSAEKZ111yiIlDscrGHewaVWz8RcZfw1QHXmkdWHk2S2wU/
         QH4wwa696WN8nf/pky4ocG8ZgdGSW3P8srp9AnPstgZ71BOk1LyDCJP/QEffQtkit0Iu
         dBXILCSwGq0vkF57GMRSFnw6TGh3d1sDVM0E/9eZ5iClf6tUH4Y9rR9AS+OQhx1BNwes
         4YJw==
X-Forwarded-Encrypted: i=1; AJvYcCVxDrDyY7SM1DsTrI/vc6fhSTTQSVQv0mJ2QYc3qTpv8uGJG6mb4HZOnknZgNjYeyI+FvYX5vo=@lists.infradead.org
X-Gm-Message-State: AOJu0YySTd8CQtbifBGja7/k9XHK1GfZZcraHpxWkk4Ums/175UETWpD
	r+TjnYg7zdZ5WMB46qI3002IwyuZSGc/y5q+IgWD1JB2NsBnTWUYekyz+ij7iS1Nab+q35U7mfK
	XBpIsSeh+oqWc75Oqfxx3vT8+P+b0xZpb8GNY7egDGuHM4M0cQELGQkM81uH43T/S
X-Gm-Gg: ASbGnct3jz1P+Y8uLkizMYdLjsUKouNwhVqzBlytAWqcz+B57hN6Lu2Wuh0j3E494F2
	+GhsxhE2ukxLK1unARRAso/fSf0aa/mZUVmrarqEZ0Kh84I0InFcD7eWdiErCw3mT7gSaEW2QB+
	ntRsurZCDXugJ/b02S5H/ADlj7haE4Hc4A8TyrS6cWdan6T1pBqiR+l3aSC++sYj3DiVpPP5IHM
	XGsdCDKnuRkuRAANtg+7kc4y6ZzwHOohO/d2fVXYkX3QjpQMnKjXOPC6ou7ZHfk4GAcDN4VOsMI
	36naUSldDXRObatMLHStq65NYEQXn+NS6kFNEgvYXs4E8s9zKzXR+OvwcJt8UxWWvit+TPLqhtH
	DHh6zDk2bmrp0MRQ=
X-Received: by 2002:a05:6a21:e098:b0:342:f5bc:7ce5 with SMTP id adf61e73a8af0-35ba0189681mr3732162637.19.1763118974416;
        Fri, 14 Nov 2025 03:16:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFod3yfShExltGVniSBUsOUaxRRfujKg3U2KnJt2F3JQHHj5TZebVtDeHhgIkrZk/ReQ7B36w==
X-Received: by 2002:a05:6a21:e098:b0:342:f5bc:7ce5 with SMTP id adf61e73a8af0-35ba0189681mr3732119637.19.1763118973893;
        Fri, 14 Nov 2025 03:16:13 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db21e8esm4486192a12.5.2025.11.14.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:16:13 -0800 (PST)
Date: Fri, 14 Nov 2025 16:46:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: srinivas.kandagatla@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <kn24jkn77ydcrn23xz6z27cvaclksmeb3ic7pr24lxsqediugl@ubkf5t4wyyrq>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
 <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69170f80 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7djovcsh0G9526kC70UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: YmqSDizSQmtZ6wEm5wVlnLXIiX6eXbjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MCBTYWx0ZWRfXwXmKT0Gc2KxG
 SfGw+iqHAuZAtRK6U1QJWh9W6Qi+PgNwg8oVvs7FM9vvFSHG7qOJzzJUQuJLDCJJW+LZxWoXi63
 QBhuZnYlOcHms6bc9hgDlxDW6zXSN8mOIgsrfdysLkvopPL01hnEQE5+bD26TIzc2PP8ERHfvdY
 aA4VA8Hp8ta2/kSkO88tDxUlkhyMP8aZjhh3GxV/1dHO5Hf1iasM0dazfnZweexlm3K+4xxNycF
 Z+Cx00vNwbCK5+tM7FlfN3JrjbQHvE0+xvDYR4RxQr+Y4WP+O3K3Yhay0z+CmsBlemRt4KFniDZ
 pOkT468ZlmQk/yoKNoz6I33G+SVMF0Uy0uLdTM4ythXrQvNWOcKYMb8FbkksKOyUGORefscNRZb
 z721xui0GEMPyezssqXdzFK4KN82aA==
X-Proofpoint-GUID: YmqSDizSQmtZ6wEm5wVlnLXIiX6eXbjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031617_516503_E7DFC841 
X-CRM114-Status: GOOD (  33.62  )
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

+ Srini

On Fri, Nov 14, 2025 at 11:45:30AM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> > On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> > 'qcom,*calibration-variant' property to select the correct calibration data
> > for device variants with colliding IDs.
> > 
> > But this property based selection has its own downside that it needs to be
> > added to the devicetree node of the WLAN device, especially for PCI based
> > devices. Currently, the users/vendors are forced to hardcode this property
> > in the PCI device node. If a different device need to be attached to the
> > slot, then the devicetree node also has to be changed. This approach is not
> > scalable and creates a bad user experience.
> > 
> > To get rid of this requirement, this commit introduces a static calibration
> > variant table ath_calib_variant_table[], consisting of the platform model
> > and the calibration variant for all upstream supported devices. The entries
> > of this table are derived from the upstream DTS files.
> > 
> > The newly introduced helper, ath_get_calib_variant() will parse the model
> > name from devicetree and use it to do the variant lookup during runtime. If
> > the platform model name doesn't match, it will fallback to the devicetree
> > property based lookup.
> > 
> > Going forward, the devicetree based lookup will be deprecated and this
> > table will be used exclusively for devices connected to the devicetree
> > based host platforms.
> > 
> > Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath.h         | 98 ++++++++++++++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/core.c |  5 ++
> >  drivers/net/wireless/ath/ath11k/core.c |  7 +++
> >  3 files changed, 110 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
> > index 34654f710d8a1e63f65a47d4602e2035262a4d9e..d0a12151b7fc13355161c48ba1fb200e4617ed11 100644
> > --- a/drivers/net/wireless/ath/ath.h
> > +++ b/drivers/net/wireless/ath/ath.h
> > @@ -21,6 +21,7 @@
> >  #include <linux/skbuff.h>
> >  #include <linux/if_ether.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/of.h>
> >  #include <net/mac80211.h>
> >  
> >  /*
> > @@ -336,4 +337,101 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
> >  	return ath_bus_type_strings[bustype];
> >  }
> >  
> > +static const struct __ath_calib_variant_table {
> > +	const char *machine;
> > +	const char *variant;
> > +} ath_calib_variant_table[] = {
> > +	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
> > +	{ "8devices Jalapeno", "8devices-Jalapeno" },
> > +	{ "Google cozmo board", "GO_COZMO" },
> > +	{ "Google damu board", "GO_DAMU" },
> > +	{ "Google fennel sku1 board", "GO_FENNEL" },
> > +	{ "Google fennel sku6 board", "GO_FENNEL" },
> > +	{ "Google fennel sku7 board", "GO_FENNEL" },
> 
> Are these top-machine models? If so, you cannot use them. The value is
> user-informative, not ABI. If you wanted to use them, you would need to
> document the ABI.
> 

I had this question initially, but Srini convinced me it is OK to use it in the
driver as they do it in audio :)

> Just use compatible, that's the entire point of compatible.
> 

Ok!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

