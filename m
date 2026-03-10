Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA39F3C27D
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=I+q6mK3e6lmCsFSalWjIHbztTv
	Gxfmek7xIbFRhrzloxVOeVYOfL5dAs1GGY5OZgkg45N/1j9rSniW1H8u5R4T4KAjsi4So0AyxS1ok
	YO82hcL1e+WX4F6aZFwBYIWHDTqVH8TVRSK7cw4pZ7/A/mzVW71hGSS/oetG7O6/Ca+1FpW8B3ZR8
	3BqXn56fNI5hMcoTYnjg98dLA3A1QrmjdstGYuutHzrb/u9aswM0dG0nihXVCv+rFNBc13Js+Yhqa
	3hFddG7ohORQDWkXGZlU2VUeG65gx0pixrWhLIEBG9G1vjd2yb7fVRKP5yYQ8YG+UywdEGGJiP8ly
	ECYimsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztqD-000000098zr-3Bwj;
	Tue, 10 Mar 2026 09:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztqC-000000098z3-0ojN
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=FGW0iyEH4YaL++qjf0bJczNBwx
	nct0fYxJI9gC9Jnr1FP+JIalnnM3Sb0kkr4MEH8sqb9YtRf6ANiZA/+h4xzXV9yKSllAlV5B3iY5o
	Z6in9LWVj/02fca3S2U72RyFB0XmoRTZ98LPrfCG2uCj4UvOKxS60z/D7MZWgSkKeKnTE/mjNsnjA
	WEu55zDt861MtSUVsl4laf0hcj+k6Xo5CkBa/kB/cgjSOEnKbf2aE3xwCcoHVP76LKU78tryxRePE
	Heb0NwscLKNkvaLIxX82aOVGJv12M8kyGZIEmCWnlUJJGGKm0uTXXsMpqOluVl9DCvVEuyP6gGTkt
	qsgZCAsA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztq3-0000000EBhf-3wiP
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 09:57:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h5AZ2754148
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=bM29PPBAOfK0D3uO
	ml3hIfgefl30u0LjMXnpy4nUYL85G/cEds2e5/kBbiqC9ctGt0Rg9xewFlv+bowf
	xpYjgzSj4Dy9TPBlCmBXYexZkzHfOvRwjBz2rV8i+Mt4PStfAt7DZC/nAmt9Nw15
	/IGuGCecOGf3hN8IV17tfwr8mgJTSUIyftSW31id2pZu+r6nMd6ce/24ppxrZZqs
	r5rxs9J+VWOU3l0Jo8Yb7aWIKqF9nwiw5pdXy6MM24RTUDYRr+jGa2UskUuovWFO
	AA0dky8LS14sXa2uBNrJhVIdFUgWK3jNdtKlMooKWWw3+2tx11hsreyrcc0kXql3
	/YvAFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mr940-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 09:57:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a081737bbso67866886d6.2
        for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136634; x=1773741434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=R7pgrlQr3xWtfxnj6+IR+OblPlqCELYDHRkEZhIL6uNb4L/0l1nGJmOKczxtPuBqHH
         ZtjJuG6X6ule+JrL60Db7/qDE3HMtm5W1nv1O8uERIurz33SKIdgRnKWZSH1feoLS8bR
         w1NPi3dBemR6tcjEhG0tSc40OWy5ksCNKPIlEtJLx3i/vzf/PZMK9PmXxYB17UDmnR6I
         UY4cSV+zvwYDLPEy6jX1sn3M4p5lC8+Ymht0Hm1aC7aigfGJxeq/Jfi6StvJgV457rej
         PP3jv5FDmJ9rEXAWj5JMJs7yQkEblbieYQGX2sFnW6zwS6EmwazcGTRzjumebk0jP89C
         XRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136634; x=1773741434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=uy65zDjGx8kg+XjknjZN2Ieg22s5J/RPj7RP04g3HWR9WyYbJCerTWgaXsqrGBNaeb
         CLU/T1gzWLwLCKZivQFRL+30G69HYDeHZL51eMGD4t8mCE5BW9hTI9bQ3/GKa2BiaY7C
         wK0S8lwRIleeaUbYfEH52ezXCAoZrwJHHF0fwRLyT0B/clanzu1n1w6F1jQvID5yBhEj
         3dSIxX0qiCy8eWpaIr6zLvJfL5Sj0HS6QqsgJ1QfCkuXYn00JwK4rmzkM04SQSWB3DNW
         XPOc+oqP6GDW2q86FnoYLumWhBKiGf7mSmz2r8n8mSR1bn/mStfeb/pLXv/cMkDCnTsz
         p4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGSinIMPHtkgb+JLGcyC1z7aP3djjeSB6QlsuOKIbMqJD5m7xUJg/Q7RsZ53fn4thcXdfCnUo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40S+j1S3XGBdw+rTm6XM4NFpv3gkjgCOgszCKv8EsDhDKslny
	hr01Gf5g3gau/2Q/5wQNwLT9qvUQ6KFgqdZdQ75UEdO8XkJ3fC7i0nmTKSXt+xWMf+C+BJCHpYf
	B80wsw/IZUm2XWJEcoLvBVF/p5p5MhSOcsZHv5Du1PmRy7D5Qn/40EHeElBzjYobX
X-Gm-Gg: ATEYQzzNK+jWqcTRL+nOa6Xy8HWVfLwm+cxWY82w3tl1ExvwZt63NUh1wxzSrRFfmHC
	5QYVcl1WBm2cNvSsPElAIy67WqkAWiAd+yOIM8JXzLmWs6bNMw0RROECHb5yV3a6ugzZ5ZzGeiZ
	9zOkOYdyzaSBQ655YKybEb8TjGOf4W8hK2KsjgfuWB+0coMK/CWZIQuCWEs/ISjR1+JGheHwT42
	YZVzeUqOxwdQZZK2aHyWfVcicmRh5FXijUVIPLCnNmaqXLBb9Nap9t/1irqOiOHrGfH0aWsDZh7
	TRMYzWYt567ieM2te2TkMnIAIUkQqDwh1Q3EpXOYx/GUnyDNLQM+wOkvRDs4Px7pAEqGSvpoHNI
	uA6+9Z7tuwzkpqzbIC3WAZ7L4Y3YsFbZAwdtaid9j8CxSUeSNVY/SJeUlu+j34mGnU979goyAaR
	pSUNE=
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82170146d6.6.1773136633819;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82169946d6.6.1773136633432;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm447860466b.9.2026.03.10.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:57:11 -0700 (PDT)
Message-ID: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afeafa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Lti85_ANQs6YWTYAGLkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: cL-ldTK_Rw9mCHARj7G4R4QkqrDwbmbY
X-Proofpoint-GUID: cL-ldTK_Rw9mCHARj7G4R4QkqrDwbmbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NSBTYWx0ZWRfX5QKlGlxUmVRM
 7MDa5PbwhHfYFOrAyRAKi9lJIW5u0Xy6P37XibhaOLFlUBd7JtvjBJ/jgeVcqGHT2QIelWUdDJ1
 iepk+vh72pJfuCzv/K3g2dbVxAUxmoIsn7WBQfl3z1QIZw4ym+Bh+b7W10evOboDwmiDKRhzbf1
 XxEw92x5/tzLk7EtwpLfkwtqBE7+mAt5OpnsJXlyVimI/oN3ja077MwVS88rSstXtUHksdoUdEa
 6+T+KnA5ijRCWWv9DBVaxuT+zeylRSiUqYV/NzChcYIHozbonBL1AfTVkoqO/NjL5O65BJCbGQj
 85AUlm7TsfbbcOB4kX7t9yOY+QC02/dy/Vpw3NjvuwemgT5gryWAGhSUOmz03qMJ/eBAYzse/+o
 vERZFws8rHXkMFBRW8sHZq9ZnoN+pGEhhnZAlE7fJpUne2zWkT63/pCh2cWCoK8tr3TMy7Uf8iM
 PFls+1GDQaWlRLnShhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_095723_664893_811F09A7 
X-CRM114-Status: GOOD (  21.82  )
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

On 3/10/26 12:03 AM, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the
> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index 291cdc7ef49c..b8d07f2c07e7 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>  #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>  #define QMI_ERR_NOT_SUPPORTED_V01		94
>  
> +/*
> + * Enumerate the IDs of the QMI services

In case that's useful:

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Konrad

