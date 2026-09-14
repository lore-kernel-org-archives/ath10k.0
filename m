Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E17C88E6E
	for <ath10k@archiver.kernel.org>; Mon, 14 Sep 2026 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=DfUU5CgtIQ6ZduTfVLi1+iXBlN
	C9nho/wvbJS2rIv7XG5aG0WnhwoqtC88CJ1qrj3x5JhgXYCPO8ZvkYzOQ60jxdiocpt6GzUOOnYcq
	Xyd77iWIOcjW/6BehQ0HveDY2OWLpO+8KMVDycbR0ceobw/Ujv8DXq/6U8qcfrK8mD5dfJQA72I6L
	nSVanj9/BhyBzqbvRQUfVpdTZ4176QB2HrBc0REn96Os4M4AGJvb5XTW22iDRtioovXf7vWjIkF42
	MC/TiYXqWf8UvnQoY0kgJWzRvCs+Btp42yovozLWX/wX8jm+rqCFpPzdW1N8UXc0JUsioqllamDYZ
	z6qk3NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68zF-00000004Dvt-3YOG;
	Mon, 14 Sep 2026 15:52:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68zB-00000004Duz-0A5F
	for ath10k@bombadil.infradead.org;
	Mon, 14 Sep 2026 15:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=AakWMGNlN4j8gSP7bnOTXSvWms
	Fa/JAm/du/GhbDAow/Kh8idYohonWQInzif7QqHfmWTJDJwvIJPKPubW4qcTazq9Y/JSFJ4okBWKw
	MZyii7dwTRZiwVqTwfJQJdvItvL3NaCBKSdt9wbD/S+3d2coJO4S0i/XTxw1jDxWPkgwpivdogB8B
	F2BnkRIs6+uSh1IMvETqdJTxQmppdqdJ/Tedden8AzEydsYOqHO4HKr2f4FpX2XGNkS312Wph2Jtb
	qEydgMkOvP7E41Avru0sJUYqomux9vR+9eBRQ6iLYTWc8Y+0Y8sQgxm9Zs90Ayht9YED0U2KG5Fiv
	TGd+s7XQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x68z7-00000005nuv-1D8v
	for ath10k@lists.infradead.org;
	Mon, 14 Sep 2026 15:52:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Y6q830691
	for <ath10k@lists.infradead.org>; Mon, 14 Sep 2026 15:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=JpKZIH2f9DAXQmXH
	2iSP1VdlpJ0jceUw4F13wvvmhwgtDHYwagzFi0IhLy8fWf1EZBTsFWgxC2NtF+td
	1WB37/06bpqcAzlBAvfooguEFqC49IGSvPVLEjjDniBT5Wk0wufQgO3pvEHhA6DR
	vzmq7nW95tq33wdbJ61049JaWHRe3zZQo9rYHgZSTB3t9nBRWzVB7ZtP/fofSiWi
	e7XA9fOcoKAvtOLodW3OMJ5HOzHr8EhHdSiHkovtecswNEkJ/z+6GaUfDWFH6tn1
	lLDJrJtF4D74EaNcKXw610/z4fDiD6TCkV8IMdJyApCyirO2+QUisvflLq/wqhrD
	t9dkSg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsu8ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 14 Sep 2026 15:52:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso1295030e0c.2
        for <ath10k@lists.infradead.org>; Mon, 14 Sep 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401162; x=1790005962; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=KQbSQS1AH1wq4AE2+ZNmoAAaCeWGjjSUkqkkmg4Mu+7o6r8BghKoDh+r6nCK2s7gkq
         ciE1WhSyp6ZFul9Ugl70uGefVKbelZzRtHgdn6GCsy7qw/FMl507I0x0BmmIHsQPRxqx
         BN2l9e0ZkVkh2gCEJ6nif2uga/owRQVebJOcj9PQjnn5dGDo8eicW7uWh+L8+kBR/bBi
         5x5bPW+XGCln/wNVUTidJAIRJUvlrqzkHC3NIR2ZmnC9ejNhGVi26RhQoJ+6RjY2x12L
         cC0DuA9S9R6t9AzkVycNaIm3JrznNQJ9uHDGyMXYcnhkERYNYdLfia4/NzZBENyFv3Tp
         G6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401162; x=1790005962;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=FHLOlstQZOy+3XMoqBpBQPjchRl27P5upQOkagilEN+myy4OHtByfWepPMPWaBMSEd
         6mmdBavWm2qKC+VgzBeBtETmV//indclH6nAq9THGs/mnl5A6uRpMITkHHWWk7iE/V6R
         ruIhR9l/RscWhvx850jtY0VrgPf8qfZUnpF3jOvm3vFPNKZM7eS00YgOu7hLbdeHxe6J
         ZIQQtyD9XHecv57Lzuw8od0Q4jSRLDu/ZZstvttlu8JGYt9E/ZjyQpu1MMu7NGQVbNRK
         0Ksag/OTcdMdXwU7AM7WXDlU3Qsh3MkvhFSi+R7fTdjrDvVWQRiwxqUFPusl4f1cCC2C
         GRjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRIbBy2Ze7boPMTe47XiVngW9IaCHzL2+Vkf/pIYkigqvqv37E51jxQCYK9RNtxkqeEOSNYtY=@lists.infradead.org
X-Gm-Message-State: AFuF++lH3QDOTDQtasUOydpAIvofqAQvXIcqsG7xf6nfgiQOU1yKnJJq
	4gu/ZkkrrJsbncoOd7/ZtA0nrhLhCObCQZA8dJ525PtpUN7EswfFMe07yEIslkwRkoe16ZylJhe
	3BYvShQIY5mBaOfBxTQCpXqdRDApZG34QASotHQtRDVcqeoCuzpSVeJwyGF7naGMW
X-Gm-Gg: AYBFou1sGN0mSFJq7tVQwSFuaWYuWDk7Q5NNBgiaY6WRiIEPWVkB+okaxvvzDSDmzPK
	jcWA/k2K2gtHNlOIPlK86DzjNBvoOqF2ids9pcaM56l/OyVPYvBkmxm07cOXjf+qaO6IaLYy7Ow
	PbmFLwmmOSgBzrXdLsiC9/AiQ4ekUvnwKfvp7l0i/sdHKTiAO8Ns42NJgi0J2Bow2kWr/CsllKp
	TVPkGEvDJ6gB6zl3jlDaBKUePFTARwiqirX5fVYVFelmSSY1GshEV0xg/T6sz8vkNIvPRK0EDhE
	oNUBnnnG+tsNzds5B2kLcIOG91Sg7K01BWm+xQntnppcfl0bKcJN+RXPZN8rMfpGgrdJLhwTDKF
	mLLOaYDZNbcxjv5CZ91LvDTxv3Trs
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3781396e0c.6.1789401157389;
        Mon, 14 Sep 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3780433e0c.6.1789401153186;
        Mon, 14 Sep 2026 08:52:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm22926613f8f.0.2026.09.14.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:52:31 -0700 (PDT)
Message-ID: <3bda35ea-1f45-4cc1-af1e-7f1513651b60@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: netdev-bot+sashiko@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, ulli.kroll@googlemail.com, linusw@kernel.org,
        clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        sean.wang@mediatek.com, johannes@sipsolutions.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
        magnus.damm@gmail.com, yongxing.mou@oss.qualcomm.com, rfoss@kernel.org,
        abelvesa@kernel.org, vineetha.g.jaya.kumaran@intel.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        elder@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <178939022208.22033.14553895731937911806@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178939022208.22033.14553895731937911806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX8n6/jNTkGk4b
 u+DRfBdw69VEqzp0RCYOKtf/msDqdU+EMUUIzxEBzL8tL4ddCJMkTntvHr76EA9oOazSpYfqBxn
 FF0TVyHK5OEBQRdcPUOzetCbSHDhXSQWxxJSAYe0YBdCc3dqEIuwy4uXe9jfM9F5WaRRn7JLerK
 RBp6VUUswVzZygPsFC3yC7jOyM140XOgvOZfFWAk+0aZKsmQAuA3WiaE3vfK3Rhp8hgxYP6ofUb
 HotvImC7O8TBjDMwAeyFMtJDOM1UE26CsNSNgqPcbVJOc7dsntP4WID8Aip5mHlZBM/olp3wv/s
 jxIJTM9+iaf9msC+k/PTVCkQ0SVL1CY1Vb3/0d7e604HmLQVakXPFdQRrxTRjOs19mrexiyYJ1a
 XsLi/8CTacm+ElwvTaQ2WJ6naLxfMw1ZkUWSUlKA/ZQQ+V4wM0rivdu0DMOGuSSLMYFfa7TXFmu
 8O4bJVAlRLKoQrmyXCA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa8184a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=JYzT5DUXXbXYkYiThRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: xbQeZbfL5Ss3TY8PRfRGUhh51R0aUB7M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX1c/A7ZYPwCg/
 hMGHAbM4U1tOB2wEIDLF8jtDtLtLmvALhVgCNt6Qto26mIfZbGz/CDylgBG1NaBEK/yaLXsG7UW
 hWgAGcmFDq83Crl/17y6bhM3+18dEHg=
X-Proofpoint-ORIG-GUID: xbQeZbfL5Ss3TY8PRfRGUhh51R0aUB7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165245_573951_08389CD6 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On 14/09/2026 14:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In Documentation/devicetree/bindings/net/cortina,gemini-
>   ethernet.yaml the patch does more than re-indent: it deletes the whole…

Overly long, it's like use the most words to explain something to waste
other people time... I really dislike this approach but did complain and
people disagreed.

Best regards,
Krzysztof

