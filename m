Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CEDFCC9A2
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=; b=jiU8+60BagDTQyLYpnewefgHiv
	c5fwrsNn9QRJWl9hYhoieb4LBGmp+3u+V87a1/s8AXXgVbjiqyP9kNAAduk1q566e9B40BlLzu/0T
	K6CMfsis1E+GLB6NolBNctxy8XtbUDVM+CZf3LEBSi4gX2hD+WOIlW31N1pTxpdRMyxQ5qhP/Mrww
	wfS3rZv45l9F6k7JY3TBSrIqI/KE5JNPnLOrUn+gCKw2DDY8WRFKnVQy5QJDhMbVX7znIACxw4wEv
	PPXdH8FQdbhksWPOPWxrr/cxOdC1vSXvupZyW7DHhVyjCBZY4F/pRDhc1BQ0f9e6FGkDOeTPknNJC
	bcJGWsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbf-00000008NBQ-0DWJ;
	Tue, 10 Mar 2026 00:05:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbd-00000008N9g-0PBC
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=; b=PsEJgJiAslsHQRpsgmfESqwgOn
	EBbbxVy7og/1rI3gh//Xz1Ehzd/mrif+K32xZhdAVC+ViCr0jztK2WhwB1sZIsu6QVjgR6LXBdIhX
	J+i2bh1DrIWK408GMEGWVY5lI7GeQjbUGfK9vwpXHh8dYfv9JdCzllA7YJWpUZ8A6idU37xN+VNRu
	OsSMGyxk2ycprUHM2I8fOVh9i7OEkLf0vknVk8Gl/hzTJCmm6/Dyy2fGeKs2QjFpLhDIvsP3TSlJS
	k+FkUsYonqh3v+haL6gB33U29sQ7KVTjQCMxvmwlPPEWidGWHi4ZOcStZV1I9cERSbk2xJTRaAaiw
	6mczvnqQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbX-0000000DNVx-3jKJ
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:05:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBltp859605
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5CmMvftPQdRpm7qJMkIbf75
	0JXDyx3tsLWdLk1U9gU=; b=aAld0740yTZ9VG9QfBPf2t95d9Rq13GKogiQTT9O
	YVNYct5kxhrYkFEjXZYiFCXdTWtOqdWX1fz7RdBAaZpaRKHCl6JBvyjwJDw0MExq
	MPLnp0N/nfdlQ7ofieRWP8DLgYGP2IMwPo+ClCXdFtKejxMmF2wPfi/eF8L2ZXc2
	qoMiU/Z28kEbDdzdvme029wGhnBwWs2kX4Bg0SRNeXuQsaHYpoqZwqzIgFowJJdZ
	tVDW/ZSRUhTYKr6CE8vuazziYX9UBcvpmd4i2BwtT9oluohV+EJFOGZXe5yRmbmC
	RF0A28dCIGQZsp3CpyRpHss8KBB6rrl42C6MgloXox7vzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbssv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1292237585a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101142; x=1773705942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=PlonaBD7CjZWWGvkxeTQb+9PM9b50VUaYJLdTQAlwHFCTW7k2SCcxuJEijb7V8IwaP
         fa5QnKbW0xJyixVBJgmmp/8b0+q+ZhHBxfjCShpUJLWnjhsmh5lyEncZyfq1A5hKvfUw
         FD1DS1/Wtai4T0DrU04JTFXD9ZBp3winTb4V0wPmB6Oy9upCNGLMQBzHK0HtmP7hXo1n
         mIV5TxZ7qoEwCnXv3KRGQYFNEOe3DKvvxrVsh+6mhxTNxXPoMZfl3coaZgRYfG+6PDoa
         UcB6q8HBhnBgJTB2hsZqg7hXvzlT8nABaZJOalVgd7SVglte+snvnnfYBLSJccjBavmU
         jDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101142; x=1773705942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=ZQggn3wtWrvxLjM9jbxx8VN6amhD9ZT+q0FwTVh+LvE2mya4CYmpFd6j6syFyGm4jT
         sGPBU5qgCS/tDFos2WYhlZm15ZNvs9RdHHQQtFg1LiJMIb0lATh65Jax6DoegrGJrj3F
         rLUQgSIFWQryGHCzZm4ClaHg9cA9cDyqdd8QfDOiFVaSBkrFx4h9U8RFLdVy5sSec3DR
         AUWkl3asomkfR4myxnRmYXnkXIYtfBAWXgnlzymh/GEaEKCKbiZgsYNHfgKIPQlKte6h
         JbFDn58ToSq2fqj/qqoGPhkZtFeHynp6gVlZotY66vUy+Sm0As0N7LS5hK3avCumIbLD
         WO+A==
X-Forwarded-Encrypted: i=1; AJvYcCVFh0+AL+968KGRbmwcoiT6Q/bW1thsV2rQOMHKCx0oRFKOCZsyFwigwA04xEFktDQ+NV9y4nE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiPZ5COaiQi/+7GUnXXCwEp2lVXWMgLUvaDe22ehFb0L1sDaoC
	61/4kE2OQ2F4w2d/LlTQIqXzmSvnBxozktlgVVbhdCG7KDGE0ISRGXnnL/WtZdBZWs67rqh8kWb
	OsAgEzE58EMZEn5PNBM220e5lxxjqMZPpdw39mGd2J5vBYMd6RUeEOFkYKQ3WIW1V
X-Gm-Gg: ATEYQzz7xk1oRIhQ6NNFCZaJBorWOMbTpCv0q2UhYWUMf8SQCg8F1C/pFbFRJyuFlo7
	yqlsVraqQHNjDT7YxSTdJ6rG++JA6RbBTB1AHd8HmfLjCDL880NWJie+B6FAZ1ZJjLskXGdQKd7
	mtya+GKn7XkVZtc/oGk6x3kIClX/XqRMrIu2ve2MldKRwv6uKURfqJcgtEDttciBi0lcWvOzsvh
	MCc6f3HEuDPOWlQQ/9dN2UnPrgvAN5ADwUjBjo36sG8ccX/IuPQY6Z+jwQAyAQftd1V79Ju99Zc
	axiaOeLDmQhj2C5OKNhDi+VhjuI1Ycfw9AEnglovEQmRWJLey1tb3zziU4TVTHYBXLrtk5xt7AD
	6ygvfhkxUHRBFVADIFkdPYi+1jj/hNMBftQkako89+k1OGRG2dRNFtYAkPe5QMu8lSEgPH0JLLE
	GmhX+tzZwVFC6F9Bch2GOWCuyohwn+4cFDVKE=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491285485a.78.1773101141883;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491280685a.78.1773101141400;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e051sm2527439e87.57.2026.03.09.17.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:40 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <uc3jucz5fafdy3d5d4vtykozt5kqfyeax55nb4yjj36vnyxdtw@uwabt65hakpo>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af6056 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4Fe6SZaiIdGEmwW3mTUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4KVkjbqtG6ib
 GyXzcET1pFhI8f+ie4y61aEbRABSpGrnoTkNDpCIpWGenGwWGpYQ/TYs2L99SeGQV491hbBB5SY
 Zko2vfzH+MRLxcq1dtYV+qB+6U5ZqF1gp7+M5pIwrIgAD7nRvr1vfA69LqzNWla6I/hENFDy+Ge
 95O+JcjHSUwNhrD6BZ1jDQMZbdD+9dl495XgVudWU8+54tXiZpU8t+ZLeatluy+49z0EcL8kWIi
 fyBUP31Y/5WoNrj5OG0rcJkkkOnmpEe0QBdZHhzYKul0TGYKWH38wSaVQDdrcmxAcpd48R0Lnqy
 93/51dvew3HxSAQ0CR9R7BfjiugaJ7fTRzSg3os3OOrWzxw6rod1QQmuEppZ7O1W5919Zt+XcC7
 QDQbgtGTT8AHGpFYjfUydSrRFrw+Oa1Eo2lHxe15wzkDh7qgOw8VWUquRHwwHRovFPSzHObf7B+
 WBKoUEGl8IKvkospfBw==
X-Proofpoint-GUID: kQBYA-PVuB2IUTRhJWMYLYJ1JuZEoDDH
X-Proofpoint-ORIG-GUID: kQBYA-PVuB2IUTRhJWMYLYJ1JuZEoDDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000544_554844_63A5FA6A 
X-CRM114-Status: GOOD (  15.07  )
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

On Tue, Mar 10, 2026 at 12:03:33AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

