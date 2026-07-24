Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C35C531C9
	for <ath10k@archiver.kernel.org>; Fri, 24 Jul 2026 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=; b=Go9HcDYUMKpDbCrXGy5E5UQBUd
	sylJ/Hcm/f+4sN+4lwESs940wEfp/jpkNEACeraU1+SKgoZZrnOq093rJ7wk6x5kneaolB1duG9QB
	c6GGImQBTQqIuFuZDU1P+QXNyK+Bx1lDU7UWx31m2wWlkRnNNFP+AHci5pP0+2UX7eTYsTlXcJ4K7
	pT9DHvJFC5uTMKzk4MFSvIOr9jA4VeWlEfkmb7CmYKbzXPfA7o+J1eqxW6IYjwAs/BYTWQkXZydgz
	g3UzBi1t9lxC+qixkdZAsHKGTKe6M7rOBjGCaxOEi0vXyyOg06FnIAWUqC+KuKASziV6cD5zlEXJx
	zcyXqEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHwB-0000000GjMy-45BG;
	Fri, 24 Jul 2026 15:35:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHw9-0000000GjL1-2ZKl
	for ath10k@lists.infradead.org;
	Fri, 24 Jul 2026 15:35:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbdeF3179088
	for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 15:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=; b=U0UZBLpmLfPDvk4s
	5VVXy1GRsf9VjasKo9AZa15zarTyGa1QjJqnsNNIcbBeIhq1YHNQb+NLdvyNnDBN
	7R2Qp6iSbQ65AuK6J6JrFFQ1KCQdPr2+h/xLiVb0Y/MG478NDq04DnEdkLa8RE0C
	q+9xAuEvlxgPwplct6yAF7BlP/BSC51W0qX4xC1wqPCC2kNiVj4k938GrWe9if+u
	71b3BDT2ouTx0lPbmDcd2jAvWSKlChEuLO3YlNrfAItJPh+7d33op3mu57wYkF5k
	m5xvoz86F6mTz6U79nCSLiaxF3eZb68e4/ZCxZPnHU/bjNLEQ39PFmoJr1mgXWyD
	Gn0Tzg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah6xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 15:35:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso9245366d6.3
        for <ath10k@lists.infradead.org>; Fri, 24 Jul 2026 08:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784907344; cv=none;
        d=google.com; s=arc-20260327;
        b=eHqI31pjLZm6ZtYLQSqgH95ODW06Jsz0nOI02tjeVjjF5X36cohrTVITCH194g2DhO
         cl/GMyIA/okTxco5RT/5pVW/7veNktVFvCbh0qJ0DbC818f+gXxYGu6UcK8b3W0+k8lC
         zEnnDZ5bw19E9hZ+1T+4vKuduwhVmaZl7VIme/geJvJQ+DyNBxk27dK8ZzNsatK52S+d
         kG0SsfPA+UzYynaNBO8WZwPh9OHsxs4WU2KeXm5NrE/X8qK0ARFLqE7vDqYUblif11SM
         ezmuEEeqiKkubY/g8Q46smJHt2N+6NoUxNs5ArqxtH50I4RnKiT1KbiLoU1tlBuG6Qya
         SeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        fh=iBzZRsU1/gOBRcMDqi0Jj1jqq5uKi/3NgcB+IzW8tAs=;
        b=Uc9pIpz8n3V8INSOPYKbRZVzuPcXc/8ndzRHwd6KIxO1dxYxtDtXivap9g5bOGWara
         /h4BwVDLU9fnWlNuDCuiiHjwDL9g33chk1L5v2eQCRQ2YNFG7ZVx28kfG5gyCaM7XAK4
         w68w1um0y4EIMdzUchjEi8lzEojBInaX+Qijzs1itZS1lgKFFiDLBzbu2m82oSNJN+mr
         jr3TVoCjKa3mhmporr/IJt7s79FcskHcL+mQxQvkR+i6AImSG8+sqI6Se1e/2FAwypsY
         WGaCjMOHzl/mnkYvESAWdul+Ammqq5OjAxOOKeZBgcn74YzJiT6fv7kYuMVWs7Z87+DC
         T3yQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784907344; x=1785512144; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        b=PxsoSZOSwIkNX+koZiD8dpmIZYGTXeDLQROJ5l6PVJrUkwrYRoUUUmNTkGAewIekqV
         R3b7w0RPRAKTxwvIlOotf8OlZHmgG30ongfJjft1aiZHitesDNUDvQQRxlPB8AzkGxvS
         Lq7HJrvn7xJpkxIs+SXTjgo1ELS9TEeb88zJQACNukYxoiAap08wENDs0W4iID+Nfjx1
         Azq/F7+sRUFMlsWgeeu3VIFKSTVyEjzwjM0r+FTnX2hddsrd/sdxOzfbDMZLxX5ufd6g
         /6AIPlPe/Ds1orJcHJ7x9IkUiISIVcTkWsRaj0EStMA3sJkyoJUE9w2m0aR1wq9ezJO/
         pc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907344; x=1785512144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        b=pNjPx3hzWQao33QhTQ8/w80UzS6+BQHErSdeB4nh8l1vvKp4fbYXeiJ7DtkpM++3E7
         sjQw/c1XYn8REVMr+p+vyUSxJdtUmVXDU3lua40qMhUqnQu8J3PsKDBPgFYrxn1hz5XW
         oVmR9pkWE2YorIrmnJ3O2qg3Ke4iOTm//OmLxvqqUX3FuVBJUpgCU2Uvuy52oqS8En2d
         EPC3yy3rAFU+/DVs/pg52cyhNeqHluR0yvvaGCLaXUFcjuTQ/9GhsrESPMCUCPzhI37X
         uEdcBvnIMHaYXZFitstPqkxl0rFwqR/MgAlqd3e2vcGhyyA6OXMiCpt22TJiOS3YCimI
         ctQg==
X-Forwarded-Encrypted: i=1; AHgh+RowtRXyQ17YW4LguCyCrQ7JBPefyH7b3JX07OKJB/wnM6S4wjCwTdbYwm/0HxxWdMAaewdU93c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBlw5AZY0/qnoDTUAXn1KkuiN6z1MrlWmJja2FutzkKsoN9PI6
	ype6iyS7CJwEd10zyAlxeqcafV8eJTJZjRgzcldOoH4DNrDqG3omPsODIu6f+ei3M5Tg2G+NAnZ
	xZspbVAAGxPkKK8Qlz4jVrbJAMSP6tQZmejMCzCMiCyQnwceM9+PjKT+DGQbRmPoR/HuS7zWnUN
	sajm+NzVHGIl1SM2kLvLTpfq0JVfTvcqrdLe4t2sU=
X-Gm-Gg: AR+sD13EuUasikYQC2Ye/SgrnlDTU+rNNH7M1L2rUqWPMZZqTOoEjhrqYCxJx78mCty
	u5DLrq+/X4cLy69dvUgIeVi5lksgeTJonNnJYcN1j2QQoOdAKoEiaq9hgm4jbym8MtC0UXIivHb
	l2jn1jMLmYhRiazF1P1+FT7rTHL8E8PuVr4fhFw3AJXCxp9PyXvoP4KOSM8Q==
X-Received: by 2002:a05:622a:228a:b0:51c:1241:3b09 with SMTP id d75a77b69052e-5283de54e1fmr76891351cf.39.1784907343556;
        Fri, 24 Jul 2026 08:35:43 -0700 (PDT)
X-Received: by 2002:a05:622a:228a:b0:51c:1241:3b09 with SMTP id
 d75a77b69052e-5283de54e1fmr76890551cf.39.1784907342860; Fri, 24 Jul 2026
 08:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com> <3d954cdd-6dde-4be6-84c9-2f2f7d008f5b@kernel.org>
In-Reply-To: <3d954cdd-6dde-4be6-84c9-2f2f7d008f5b@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:35:31 +0200
X-Gm-Features: AUfX_mwd1WNIZvdvXqoWeMIN9Hp4kEAy8VC-hn59NszviBxEKOIP4_juVgFnXVE
Message-ID: <CAPx+jO8-9YSJtXNfnTrUX_JiCyddXHn=wHek9=c99+fNp22Zog@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Support for block device NVMEM providers
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOSBTYWx0ZWRfX63bFOOv9WRee
 DvgjAjNQYGTfdpuhhP5GM3LIQqHoAQJ1J3DnhXq7dNalLkPuvqccIWMJF1hZKBHlpVknffJn3rA
 JqDy0ahC5+tu1tA91ISsVAED5Ssw+D4=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a638650 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8
 a=XoVDlNqzt-XzKL8N3f0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-GUID: DxaZUQ1PwZ6RBhddWhGBRy495-zn4OAQ
X-Proofpoint-ORIG-GUID: DxaZUQ1PwZ6RBhddWhGBRy495-zn4OAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOSBTYWx0ZWRfX2LqtYCeGXi1K
 X4b0iVqZQ2K9hS9kORU/yGFQwgi9595a64ebAoPSFdXhQLwF/IMWmvkzAmPTbXnZb4skJF9uwKc
 JFsxhjf0/MhjBuyJGPzpbaZoLbO2uuDYSEwOELT/yt4gL6fER5zm/dnBpzz04t+eysDtEVPr4i3
 B07ONKAzgCub9djGtniYSHcyNrtDczBSmUCrJZfHZQOVT9uConedONOj2NboOqdMQL52f/vLOuh
 ERuz8Ij8NtRVaaaC5xiOdoQ1Yodxw0Hpo6/PLYurj8TqEvE1oT78J3Ez4yXzrDqWJKmtQ2c6cqa
 /V4+9ZVlMuOqD+M6w2u+/L+/l26/lWUzou0knSMzqu49toEfcdeVYcFweASWC0bv/F0LGTnTal6
 ngQYPnUkpHoMWVFiU+baWZrJHDzs+HF6XieETNhfOogV+fkxGgW10U8IYxOdW9bFfAiuwDqOZGp
 z6Hw0tynW6SKtqxVcUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_083545_773655_1AF06613 
X-CRM114-Status: GOOD (  25.91  )
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

On Wed, Jul 22, 2026 at 3:56=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 7/3/26 2:45 PM, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > Until now, accessing this information required a custom bootloader
> > to read the data and inject it into the Device Tree before handing
> > control over to the kernel. This approach is fragile and leads to
> > device-specific workarounds.
> >
> > Rather than adding a new NVMEM provider specifically to the eMMC
> > subsystem, the new support operates at the block layer, allowing any
> > block device to behave like other non-volatile memories such as EEPROM
> > or OTP.
> >
> > This series builds on earlier work by Daniel Golle that enables block
> > devices to act as NVMEM providers:
> > https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.17=
09667858.git.daniel@makrotopia.org/
> >
> > It also introduces an NVMEM layout description for the Arduino UNO-Q,
> > allowing device-specific data stored in the eMMC Boot1 partition to
> > be accessed in a standard way.
> >
> > WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
> > Bluetooth requires similar support, which is also addressed.
> >
> > Note that this is currently limited to MMC-backed block devices, as
> > only the MMC core associates a firmware node with the block device
> > (add_disk_fwnode). This can be easily extended in the future to
> > support additional block drivers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> What is the merge strategy here, Am happy to take it via nvmem tree if
> all the non nvmem patches are acked or reviewed-by.

I am planning to pick up patch1 (dt), but waiting until all the
complete series is ready to go.

[...]

Kind regards
Uffe

