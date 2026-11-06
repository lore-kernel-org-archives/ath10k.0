Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0EE606A32F
	for <ath10k@archiver.kernel.org>; Fri,  6 Nov 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QQJtNmqg;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8d6mgj9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=abexYlKX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=; b=QQJtNmqg63a4GI
	HI3PklhNVTTjKBfNNRU39NPia3YDiM7paKPeaXAmeqn+4S+595JBxdNH4reZ2+8r8FTUKi4EaN2kL
	81w706+hUW/a0h40cT/H4uVXQMR7fFsVjzxjBJ1hmefdURC8sfqDDGL4U5LcLD3DLqMy5/C8F3v+G
	zKf7xAbdj+P180aJUNp3QdazWjT0jxWYcNEEAqZHuu8Z5GC583x0Hch/ll3BzRgyZqXIV0myiuLx4
	h4T/Utsm/0y/QdpomVdXARt0yw6UThYYGy/rCmabvJ513AWqMa9TZ30KnkoYcNo65e0QDhzxtzTDo
	UpCUI0htndZfYxlDJpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM36-0000000Crr5-16Jr;
	Fri, 06 Nov 2026 15:40:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM33-0000000Crq0-0ygs
	for ath10k@lists.infradead.org;
	Fri, 06 Nov 2026 15:40:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0kGC710236
	for <ath10k@lists.infradead.org>; Fri, 6 Nov 2026 15:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=; b=W8d6mgj9Xkbvou5B
	6zbyfM/9FG1ErD3c9jAku8uNrC6wEFv+bHfvgA4d5+9vKUFJIBS96tuHZ+oy+V4o
	f2o4R5MEtmhWyh6FFgOTGBjpLyYjnX4geVw+il2sKKbBqUwxmzsl0zgPFokayAp+
	JS0nUzYOrHdsuGszqCLJ2N7uoCwgBp9X070z7bvn5ZFT4VZCmAYJnICAKrA39mTz
	8rCmqeC8WeDgCPHPN0oPs7omo94oiBMHetrJmAoB0JncSuI4H3txlAtgmH5Or1Bf
	aHWDGjcrvr8IEQ+vyGOMmpRvYOXvnhjojK569ggLkIDwV6kfvMwcBHOwU5/ppKwn
	0pYfOQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paue8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 06 Nov 2026 15:40:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso795461eec.1
        for <ath10k@lists.infradead.org>; Fri, 06 Nov 2026 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979611; x=1794584411; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=;
        b=abexYlKX3jsY0VPCMzZmwR+O5KsZ0yX68fWd0STAMttZpQNnVJU5dU3PkDN3yJ1VVX
         pZPUJ8f36qncYPyeahPTGxI2efRYKYksOTOb3IFjeiQwaucQ6xFULuN5NiMJAjUY7coW
         QNgtUAO+kSnn6z0AhAQSFMMPl7kCx4CrkZqCc8mqyTilfdh5MZDfYXzbi9aPYJSvOnwp
         DDd2uvfMq3K6j6qIIpGN7wh8uFfh7UsrdB4k3KIrVNgqOUeKG60MaYaVQydhVkdBtpw3
         caJefO4eHAujYoTeFrLe7JMpjPr9GdEFCT06ddUgQwEbPSG+GXvhoNSdoeaufSbyg7b/
         1ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979611; x=1794584411;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Atjmq9rxdzHFbWBN1PM5pyNQLuI2w6lEpnu8PnoiDPs=;
        b=Xqo6oalPeAJn3IbL4yoKDPUCPbq9ix6LcmCEXi9zqZbp2ead1kyAx2dRQdE75UTQek
         dR+ou0F1D6t3Ycjum1g2ehvjQMNluQRjU33wD9mXjMKo7xVoe6VdCMp/pTWkpsh3TlVl
         ykqGSdBzfSyjUONlprquWOuUDMVx2xwbzdCh+5lxgEes3qjf66cOCmXfwmUhmA4krHTt
         M1WmWCQhLMEoKX4ov8AZ6Ujg4CU6FLSoxGP6U97zZFO8vwvNDCl/ldcRM6VEF2Rz/KSg
         IWPM2u+PJcNdi8X3YIiQWLcCj/BvQtv43BdS+Y6ui/na+Jnzxsa/qv8Wt9wLnEHNlG7z
         JWXg==
X-Forwarded-Encrypted: i=1; AL+hErGFPN8QO7x6CtT8jxpiiw6C2b9Ql5RAThgbH1dz7/Ngp1rY62QiltVhWlrgrKC10fQ401fXUQE=@lists.infradead.org
X-Gm-Message-State: APuU4Z8xJmIXISHoQynJKR6egonEjcjJmmG49lITbR0qrw6GOEKbkCaa
	4JloFnKsB3IIGH+RBm2GeW0xvQ2aMjg4ZSBCkl9jolvlfxSOwaJ10gnuJ1TJRYBCN7oR0JYAOjL
	5ZJfpcUV8dpABqBnAhgqb2yvGDO+hU3++xdi2lkU3Csy574RVFDcNCTeQMiy9a4kfRXOLLpzv
X-Gm-Gg: AYBFou3GQRMlJILgAXMtT+la1jx1/a5ot50VILEshpplJNv+0pgOmUiajSwDXtM4tte
	v33HpgmsaGd57aW7pZW416ud1qW+5S1oeYR3Di8kyma+P/0hogFgQvcssCDV5iShtfVZY3Jd2Sc
	U7Ew0vNWtr3qfbpPIApvfqjEizcoWs51nNlxT5aRFjOX69g6VsOrVAuHgnPAtB/s9WI5liwBAQe
	qqAP7nbMj3g6cckcGdeGzsCuAT8nHnJ8S5OfPgipHft8rHd72xTcXLY/JL7cPJ5kPZD7q/PivEn
	i4HdVLvbjW4vVgvJWvakbKc4csTCcZ7NzbFOqXX8T/0sWBuoB9Xlj5B/gddHrt2A83sA6wi6uhh
	kqi1kjGuMLc0MikgJR/TZFIwHG0XGJhUMI7p04sBxVC9at32D3KNNkrDLdrNdY/b7XoadX8Cvyj
	jlLipETdc0bB1J835ifP4Suz/Zifc=
X-Received: by 2002:a05:693c:68c3:b0:36e:2626:4ace with SMTP id 5a478bee46e88-36f7398b906mr3825472eec.5.1793979611088;
        Fri, 06 Nov 2026 07:40:11 -0800 (PST)
X-Received: by 2002:a05:693c:68c3:b0:36e:2626:4ace with SMTP id 5a478bee46e88-36f7398b906mr3825418eec.5.1793979610314;
        Fri, 06 Nov 2026 07:40:10 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa97fbb54sm9851246eec.13.2026.11.06.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:40:09 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
Message-Id: <179397960950.1195422.2420449019221399402.b4-ty@b4>
Date: Fri, 06 Nov 2026 07:40:09 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfXw5pEnnyEmQqP
 DpAMiJf5NEGyg7Pabf0JprS2V1B9aTI+TkI7Dk3l8FsyY4Adn5VvEslLMQY0/KCPzW1jwnJqxVm
 gtMJlem/brZULkV5wDHTvYyx53g4PGDxDo3KlCraaSuYi4SpXb0FG40ICUKh7A7/sYznHKcezPO
 QvFsvqODF3oGG6j850Utc2ytZWM1mQ61CQgmr2YlTZHYYPIt0arNQl1810yLmgO7Hm0YSZRJmq2
 btgINIp5rCJ962DoYyRItP7N4yQltnQEyHX7RkM3O78a6HTwJH9JPgQZl4I6ZcoN0/eom690W5i
 +/c5qBtFKHaroGeFdH46RiYxjuGO8LyR51ihCjXjEgS32Ez78jLx8Sezx4NxmAT4Xv3sNOFicr5
 xR9F/+U5PAE7YJQAyvRfloL+fSpWMoESKNG5DcAVowIwfKzh102vz6EljntU0jv3QUi3npfYIrX
 UpAwb3/UFqotbfkTgLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX7hf9VsQ3vA/7
 Kds2f7sqto4uoqA1qvGqNjJ9CFHAJlXM+P/iLrKGIp6h3iyTLzn/nudfJKhKmSY0F/KlxCtHjOO
 dpLFZCNj59gQVFZImTB64X8E2DIcLDY=
X-Proofpoint-GUID: ac4OJcrArt4kJqdxLN9M0NrGXkTfxKxR
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aedf4dc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZoQ-0plOPn13Fw6eG44A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ac4OJcrArt4kJqdxLN9M0NrGXkTfxKxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_074013_414911_1D398B9E 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 30 Oct 2026 08:19:13 +0100, Krzysztof Kozlowski wrote:
> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
> Dropping them allows to remove bunch of other code referenced purely by
> these ararys.

Applied, thanks!

[1/1] wifi: ath10k: Drop unused qmi_elem_info arrays
      commit: d866eeb11be24c7bd6fabfd7da158ca8c16bbbab

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


