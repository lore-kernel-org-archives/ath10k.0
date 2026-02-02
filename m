Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F6DE7316F
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtGzPl0jzOWy9rnzYYhU/c70ut/cXgP9d1srwuO4V+s=; b=kyzkZtI+UqjsLU6VBhpSinb1Yx
	FQEkQCRxS4kuMEJ87ALm7EcGyh13l96mjKH2DK+0vlZ47f0P1CbSIv6+ihwX6LOkFF+DAi3+Ygysb
	WLgSFtUQKS6I2JcQBsieInrTCHTdyuj9uyKR0SfvH7GLIZzck+plVktR2+QyK0n6EghlBbSPQeNdv
	Q5Ap7eBLJfGJuY1cgGAbD43QMg0wsIgdOGgNxtAbiFGWTtrZzce0QTs2PK31L1qHl5xQZ4XKwjj8n
	WZueRheeqgMV/5XwQBuXnRBxooW2hdJKVai3XQaNrtEJLWc+wRqgqBQGq8zMfT3ze47XVQUeSgfYx
	gi7ozbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzRx-00000005VAF-1Kem;
	Mon, 02 Feb 2026 19:19:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzRu-00000005V9q-1vTr
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 19:19:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JD75X2261991
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 19:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DtGzPl0jzOWy9rnzYYhU/c70ut/cXgP9d1srwuO4V+s=; b=goVmiMqzpAEzuRku
	nEO8teT3uK8zPIX6ofrR31Ysx1v5FlVHbUh9N/6JILbByAtmbmr6YnICw+yk2k+n
	XqTyEATn0cttbUxqGFFECGhtiTJOkY9Rm+Zi7xWgIxhmNlJhz3Y+5SESncPKHBk9
	XgR3rIuq49bhfI9bRdUtuiuCGM2iQjRIjkfZbamGqEpWh9Sz55prUIAmKkmn6itA
	p/S4BlMthwPh/QA1Pd4/Va54rPDfMXFNBr4Ye05+qXNNeBlUQqJj/n4d/sQA5R10
	wlZ/RqUtm58z+qLcH7CPsR1EOdZCcHHzEFCeLL0fuV8VHKj9FZMO5ulPunYXRhhS
	mwfn1w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmthh7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 19:19:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b724ff60e6so5349368eec.0
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 11:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770059940; x=1770664740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DtGzPl0jzOWy9rnzYYhU/c70ut/cXgP9d1srwuO4V+s=;
        b=fz3oOaShujQY+LCrC5GqsOmZwtyS1Eat3arzj6joacnyQ6lqw7+0x8zAAZP5EAykRd
         zmYGX/sRX6dUiu928N0atMQvNwAW4b2NP14sitRmbkUk/EFESmuAlYVQHpcHLHu4OEV7
         nT5wVO5pBc3WnYf1vV5MQuNbKwiEJHjSpH4zd9nJUhuveBhasiUiIXl85ZhpLw9/g5yp
         pzWvoVuhHft0q9V2nMq49p331GoyNHUpV790f/J7+CgLyH55S6pQwp2zoJRekeaL9/Dw
         MBdGVF8eh2M/TT8+TV+R0PJ1LXm4DkgbUET5PWjJ0a2a6t4jyQ83NJQX3iuAS8r8ONY9
         mhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059940; x=1770664740;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtGzPl0jzOWy9rnzYYhU/c70ut/cXgP9d1srwuO4V+s=;
        b=CgRTDAgAG51tne2YDAs7uVcrWOFY6UIrpOL9uj5sOxoKFIWTUSaoh3PgsJsJWPo7aP
         RYtGDNG72e0039Bunw/R15wW965wn1zEn+aOb0cGkGrPXVkevq71Si2U5iaP86EEK6L7
         jPq5UeeXwo8+ztDXtF73Y6bTpMbpk3/nebW8mYOFctpQqknI63emeIBheii4KTsOe/gi
         pGgiqm3JPmsBPMiHWkAYpmHifcARBvP8uSWmM2dvLv5dK8DaH1xJF3kKB5Q0D2g34rar
         RT/EX+AX83X+JGrIpAsG/2tNLK1BC3k+k3h5eYWo6cHtm7fyvljXcPx7+aWvt/C2OUZc
         bl7g==
X-Forwarded-Encrypted: i=1; AJvYcCX8zVhefBA3H9q323b8yAvIzSYSNmEZdxWXbdKaO6ytc1oMgR2yCOmenw7ysVCNr58//EkXo+A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/vC+aq7CosKigwi5Qr9BBxlElj/fjmsYDE5033KP8nltlFFgh
	uIvYN8RTtqoSHgckDXm305pyTx1H2RSztbhYmmPgWpxUKnoAheUrTOox/Su4ODugNFGe2cOA7RG
	8lHvOkmCEebRFJXLNEqU2enbMl9r8FIEmAXK35SES8JkzAsZrXj1Gv6kRDipMooFD0/nSNn6z
X-Gm-Gg: AZuq6aKSEfsBsA5t3VQ8uOBq8eZhGNVG6EVvM/ZTP2Dyuaj6cptVue6bpog7fDtQzPr
	rJoDa8ZyDbv1qw3O2gQGblBF10YnLtXTlxHb2lqQwQIkvOK4CXgBfZJRcEywaxnX5nZShKw/gOn
	90NTBC5NPk7LmqkXchVHlDA0UTl/Tu2c53cB1ZizzRsJyOjxIX4X/ZGvyVhpZfQGsgBePLwtqsI
	3OigjIln0/85Imxz9zGDzXdR/xEYgjy8O6yxv+EfMuhBgQ9a4+pzv5KOnoKRXdxkYwU8uIZlK8l
	SIHe+JNYZAN4X/PMfQBGThcjms92UAfE01fXh5SCpb0CGk4BRkRSDQJbVD6yWquPV6F8uZsAnMj
	lZfef0MXtZzzehNHrbYOBntwg+iKeYOynmc6Gm++kc2fnRDJXeKH366CUd1xRLQuDgBlfSLPJ+K
	PxBg==
X-Received: by 2002:a05:7300:e7ab:b0:2b6:fa0c:6c44 with SMTP id 5a478bee46e88-2b7c86485f8mr5290883eec.12.1770059940120;
        Mon, 02 Feb 2026 11:19:00 -0800 (PST)
X-Received: by 2002:a05:7300:e7ab:b0:2b6:fa0c:6c44 with SMTP id 5a478bee46e88-2b7c86485f8mr5290874eec.12.1770059939547;
        Mon, 02 Feb 2026 11:18:59 -0800 (PST)
Received: from [192.168.1.40] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16d01c4sm20598663eec.2.2026.02.02.11.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:18:59 -0800 (PST)
Message-ID: <e1b969a1-8664-47cf-b73c-eff1c6cd0b9b@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:18:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: WCN3990 hw1.0: Add Google Pixel 3
To: David Heidelberg <david@ixit.cz>, ath10k@lists.infradead.org
References: <e686e1f0-d3de-4fc4-922a-9100f2962b0d@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e686e1f0-d3de-4fc4-922a-9100f2962b0d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=6980f8a5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=kXVcKjEv0dS3lYO96Y8A:9 a=QEXdDO2ut3YA:10 a=dK5gKXOJidcA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: z-PHNtY9ySkdhbBoZcepwHTyYmBTfHCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MSBTYWx0ZWRfX2wTSz+C8SeTp
 ZQEiYJlrED/8SreLkPaBpe0uM4OJQ81COgLPOchf4/pD0qiodwDHnsFqqnhVyehuAW0uPgN9Rau
 YViQw9Xsm+oRqbushHvoVLq25jIlytT3kLd6tFARYV/E1K615TvE5DoJWniH5cbkOaPnCyYfFEQ
 yW1EQH7jG6hGUl4AGWY/lUFoVKfZcNMRfGoojT3FE2xnknTO8miJNbtwMhlvhI35ljcHcNZ4ehz
 SFFF7q22eZ3jT0hFeHA6x6m5M9I6i1jVX9108zQbqy24+OhS2aNtO0lqv3REkCQ9N2+sUwZLl5o
 cB6dwf9tgNVHcLxFgbeV5jAh9YCqnIEIvOnE9eeLnmw25km2X942v48n8lwmQcfjMHDWW1mmaC0
 Hm8PS30KO9Bzh/3lg3qdAVZFOA8ou5y3ZFCfcHh3gG7ZaODjy5pUFIX+uf3nq4hSNxcXwQrz+HC
 SJqJmxmqv7QZXW466gw==
X-Proofpoint-GUID: z-PHNtY9ySkdhbBoZcepwHTyYmBTfHCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_111902_621495_C32104FE 
X-CRM114-Status: GOOD (  17.12  )
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

On 12/10/2025 11:30 AM, David Heidelberg wrote:
> Hi,
> 
> The support for Pixel 3 was added a while ago to sdm845 downstream fork.
> 
> 
> Now to the questions from the wiki page [1]:
> 
> * description for what hardware this is:
> 
>    - it is a SDM845 based phone
>    - one WCN3990 radio is used as 2.4 / 5 GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>    downloaded)
> 
>    - It's taken from stock firmware image, extracted with pil-squasher 
> by Casey.
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>    - WCN3990 hw1.0
> 
>    + bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
>      sha256sum:
>      c21a1fe73e687d3972aca468e7e0037e84369ae1b42522cc96c46d8135aab126
>      md5sum:
>      9ef9a392c488b26b4d3f4d78d193498c
> 
> * attach the actual board file (board.bin)
> 
>    - The name of the files are equal to the id string in the board-2.bin
>      (minus the ".bin")
> 
> Kind regards,
>          David
> 
> [1] 
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html
> 

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline

Changed:

Deleted:

1 board image(s) added, 0 changed, 0 deleted, 31 in total


https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/8462c5ed61bcb79e869db534a92f070be5c46175

