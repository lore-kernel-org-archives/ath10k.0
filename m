Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8678EE644C
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCtRj0kGJkzqJqbBi+nzUzz3hAt/gdZ19OL7R78+TBg=; b=UwP/1HrRp1A/h/kScPIMajQeqO
	8u9bosE0OBS3lcez95Z/mQKdJFroeQ5J+ZXmJvpoHjPjhMFycuZFJzSpmh9ztaN85H3cF7D/CLGUf
	fhLfWVbG69saCA/C6aAxgxMF30WpD/mv2O+YIMNjkXbh6ANxln8TaykTi0r3vxBlsrzXxqSX2DOjv
	wSkGX34KWZJmTFjqOt+HCpEGBlBAQ+AkihKeOOz5YBEVkpYEpOa4/hajEYMNyLLETe3OXpf/Lgqm+
	PmvP4jJE0vpAEl4dpKGxMjkKdttjujtRhvSFXXp72PZXhpk2x7DQi7p1T8F0Qrcv/Phli2n1v1TNy
	+HaahnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaywU-0000000689u-2G4u;
	Wed, 31 Dec 2025 16:20:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaywT-0000000689N-0B7C
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 16:20:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVCThtG3216719
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 16:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GCtRj0kGJkzqJqbBi+nzUzz3
	hAt/gdZ19OL7R78+TBg=; b=PKiaatVkwcqrWuY8DFvYqxHgFWBTdDtGeebn3+7m
	dTlCiYdpxYrotSGQN3J3EzH5e4Uqi5vyxAys7qOVn9+vYGNtfeuZWRQNZ15gdRyC
	XTYw5OCExmIoWrDa/699sbcu0o5P0SPvJyCEqg5BbIwNqxv3LlhZRKKIPWd+nR37
	7J4nR3ki4eRZIcJbFk987EGPu0o2/dG4/payno8QEF0lgpMwVdGmKIO2sZEtQrdv
	YEfIoIMWUvGxiRfY85cSRrW7NpwXdctXoeNYplYYNxT08Fn9sJNzsGYJ+pFUfd9n
	kIVFKkeXGsE0T78aGjFK/FvIAeyea8c6iS1YkcUoTMa89Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8rc9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 16:20:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so326487911cf.1
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 08:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767198055; x=1767802855; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCtRj0kGJkzqJqbBi+nzUzz3hAt/gdZ19OL7R78+TBg=;
        b=ghzVUUkKV4QG0WzNNgKGwHp3XNq3euRXAs5ZM6E9+6D8yzN0vk7iMnrdNDuObHLTfu
         CyQDr4MLFOjsTMNdNxQLjb58oG/GmLiLUGb9j3LFebEFkE2/OiPW2VPxDoNjLTVs12qu
         kjsuJSBu1X3Q5FOZiIq6+8G2S/YLqvj+9SfyRPKS+hFAtI1scD9H9vWiz/SRfGKl4jtn
         49+0PDM2MvPstBl6Jh0JjUB+t+ZJ3/AJlyYZmxwNRjQP1KgnE3RIgWFmZoh5LVC6Y3KS
         AxPBYK7LGndUmvQa8Qu1WLUhPdadkRdUtMCcXE9XRE2Hw9lRW0s+v5ze6XAgOUeXcxse
         2Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198055; x=1767802855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCtRj0kGJkzqJqbBi+nzUzz3hAt/gdZ19OL7R78+TBg=;
        b=bhmwjkdre1Ggp9+Bd/YCWr1PNsoAoPAQ7IhxQUqXchJJTBNPjQC74OVgU7jfVT8Mud
         1Fh1M4vTFoGDaEaGavLvDjrqqfr3T5eENYAntiyct65x4E7V0LJ6nZ1to6aBuFEmV8eG
         YBr6I6as34ungwGFPoXI1Q120atu++soOX5vghpmiIzCoEKQQCaui+B5cSnFbIxvo1xW
         uAUlWUnCR6qf9fBqYaTGn07VWH1El6JNPvhRN6IPSvTAE9W+bam8DUWtA5dnNd1hNaT0
         pMUfJBC+LSa/swEKU36/wNg8fug+Y1gLo5Sk39xl0voECt93FJ1Q0sRzCyNdZivm4W5G
         dJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavQOADJSndbHGFkNPZXu457tO0QgL5IAXjjrujBsUHYU5J11dtHm/cT7tUmoumQRGTgoeAIQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZ78GxZJbX38WAdFjyPRSK/9OmrAcd1WizXF5QS7nNP6Bl9ne
	ndQWudWkM943QJ1+5VW3b2rBOOtKEooDaA76z7RO1qO/9D/tFHd/wls392mXrD+n3Rk4ugLSJbf
	0dU7JDotC/1mA2qj9sZ4T+E5fAoHZcGyraGVA5fV2/mlwBCmzn8aVVQaajD0gkrIy
X-Gm-Gg: AY/fxX5C+NK7XXStZiIcwtUWFVVe6i9pkeVGtNPROtsb6Vb4hp7uI0JJXkdnoU5nLJd
	pfsFA1HRWM+C6uwhUy51mOE4CxP3GvprGjftlUV0dVR8yEzHk9DUy6X2GHr+2hoFA17bA2pVEYK
	qhzZgcHeh68poBk/gv65TCEsgtpx8y2u100p72D19ZZAd/tcylni8dVgSw6A7nST3fKu/EBPIQX
	778Qsffbnkfjd2VRIxIuC8vTvlbpXgRPtyP+j8Znj9t6nMRLaS8AJz3I6WfvaMhYKJUA+Jcj56I
	pp7oXSr/RuSgIJiCM8j88ojFOwDB2QncIJ0SJu6AJIKsAHWzixIMMg8yDbvmsxtOE/M6k8iA0wc
	BF4AIhwUU2Kz0Id7hqWlLD3CNbYKYz8tphgceuwxExLDzFmHYVMjEeT09SllVbxXPA8E0hRZrYO
	aXBmv4PKq7GSf+24H0ZNwcPDc=
X-Received: by 2002:a05:622a:4c15:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4f4abcf0be2mr535752971cf.20.1767198055390;
        Wed, 31 Dec 2025 08:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV93a2/ytBr0yG7s3l17noCqyNn3HiIII00axJsk7y5AoZm/pGqNYSP6VR1gOdPsz+SL1V2A==
X-Received: by 2002:a05:622a:4c15:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4f4abcf0be2mr535752671cf.20.1767198054918;
        Wed, 31 Dec 2025 08:20:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282ecsm11179301e87.94.2025.12.31.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 08:20:54 -0800 (PST)
Date: Wed, 31 Dec 2025 18:20:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT
 properly
Message-ID: <fk75wduux3dilfx32mlufx7alz7cbz2xa3s5ubdpyosd2t74yh@7x7q7yhogmne>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
 <ed3e9128-cf11-4ba7-a7f5-cac2c537c2e3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3e9128-cf11-4ba7-a7f5-cac2c537c2e3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE0MyBTYWx0ZWRfX/kAuL/8wDCyp
 sFYSSSwFfmYK20/M8hR6Zf/2rGE0SknpFsTfHuSod1y+asum3hYa2wNIp/lPGltVyNqpacyct3l
 WVvfU8o8Fl+c0tM9aaH37r7Qr6a3hbzosirOlfDZyHHPbWQcwj+VMm375ujHcac+MIhWPQA8eZn
 jXZawDmwptKCI4ZfeO3IjPKkBZD+E3z8WdYokKcI1kmHHH+LrqBe1HDS8xx55OC9LFrEvmBPR2W
 /NLXbiGNvZc0KPe45Wn9uwGCQdtwTzna5KtmY6Y0DyJc9IqO4GZdwAWCOI1e/Xl1vGAhfjhL9BU
 2sATW0HFx+74kf2iUD94mA4dTDtKB34MMLEwtK0UQCdlbTH5RMMd+00YJp85+5/FfxgJNuxXcQu
 hJftSZNy/3EtCKK7dFnci1cMkqufWYePBShBEZHUiDnLetvTVQXNelTu5CzPSoFH1RyOXpovA22
 57pQhe9E6C5iBLsYlZA==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=69554d68 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YM-ir784Kfn1-1I9OqQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: L4rQ1P_HH9ebgA4VRMTdCCIfGfzwrH6g
X-Proofpoint-ORIG-GUID: L4rQ1P_HH9ebgA4VRMTdCCIfGfzwrH6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_082057_204764_07A72C0A 
X-CRM114-Status: GOOD (  15.60  )
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

On Wed, Dec 31, 2025 at 01:19:23PM +0100, Konrad Dybcio wrote:
> On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> > The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> > further spreads generated voltage. Describe the PMU in the device tree.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&pm660_gpios {
> > +	sw_ctrl_default: sw-ctrl-default-state {
> > +		pins = "gpio5";
> > +		function = "normal";
> > +
> > +		input-enable;
> > +		bias-pull-down;
> 
> Ideally
> 
> func
> (no \n)
> bias-pull-down
> input-enable

I'll try remembering this for the next iteration.

> 
> anyway:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

