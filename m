Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E76AFCC9A2
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=; b=0q4kuKwR91ec1h9mk+NkV0c8I3
	mx8qGA+qrOXdj91aTaq7W4VgIf9OiY8LgRillWMzVNb2Unw4kao/P4B+BqcTb9u4RE1CO8KlR6o/u
	BZ1MahvPIA579eNbbrUNwGzybBBdA0usmq5gLTHISQH4GrzGJSbZk93fDkVAeBLj3TL5IV89aEhp4
	G/+CaBuAa2KDSDi4tmZBEi3Vk/V3Ewt91YkB9eCXyAQsMsAv4co9NjAob75XrE4FJbxhvSLIf9vH+
	niNnneKeq1Aq3/rR6Ugph8tsMspZC7beEDWmUoTx0zQI9SaYN4p7kvXH91l+MgLAc8hZ4d4SOmmSc
	cKWwQV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkab-00000008MjB-1a32;
	Tue, 10 Mar 2026 00:04:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkaZ-00000008Mil-3zub
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=; b=gOk2bOQ2X+bSinhpeB8yWgn0fY
	PhwpGL2mClh6/fooHSfuGWdaNtwUCTc+0RKGRsBE2o9b2D4zyExI59N0nZ0GGWeUW7K8yfiTROhqK
	08lszR7gzHtDO87xReRZsOus1vsDLUDTWUqdRqL3EEh9Lo0bH8YZ8eY7y49Lr7dlVONaqvWs+b229
	1EHGSMBMMRyzsn4xUvSM9PFTzq0fUJCJD2VfO9zje8eYX3Zp0grWSZdourdiJeshygu9R+OByrbN2
	pK/lm8KfwqMxporYZj3ycrvQNjX0mxP2S15+c4n65OESAAGmhb6IFZlhhhn/+QzQ0nrNhPh0g8NAj
	3divHUCw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkaW-00000006nnm-32Pb
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCEZ91212190
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FiLdFIOl9PlXIMdxcVYmcXmw
	vstc2sRWR+kyhh3rVZM=; b=QfWNIKkC9L6ATOW8Ig/yhvIj62nRnrFOVe6u0i4i
	4SZ32G4q13/XjC6wjoBiX8F1pTq3XNepVaYX0T+oyA2Q9Vm3uK67nIaUFji9Pyf+
	ipBJ4RGGeoO5nDlAEtl1fSE8dMVjD79050LVrVqXE/Wa2IY3y6Bh1B+ZCb33sO3Y
	8XKi0FbmrtdoLFWScHZ6pvb0EVSLgjVdOh2eWTsoDOnWCS26vX8XHk0bTQGDg4l1
	Jjxjac5njC0WUG+OdkzWWBJZN/M7cvotNl1JQ1hBhVteDkljpcTmOXMzFSmrOMNJ
	KZhxmLXuEJU3I/67AV33kt7aK5/Xuy3rGFoZvqswBhG4NQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso1767375785a.2
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101078; x=1773705878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=;
        b=UMmNZlkSNY2u7vL6F4UHFQ5B/m27CzY6T8+TPLy6BW48q+SYLOyuX4ceaPfp7wUP8i
         90l6JpkvMuwdsG5YiLEdRIfIJZ39kuEpMqHPvewYBgCorHB8pe24csTnZjIw6JQxXKgG
         ExuavGvJ0fG9vMSkN/6alAEBmAP9TBiM93/RQPm6Ld0EdbLXzyx1H14sVY7DmlByV4kI
         WL66p4XT1cTD11GElsdS80g4pZ0Wa12AP3K2DEg4pM7c0LY7dQEGxyjt8/4b1aOwe5xN
         hwn19Xv9UJA2DMJnYZJOUWBpALS9y++WlE3ss5pfEYZTNMkAE6LJDKRUd+XxWXgIDOGO
         GZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101078; x=1773705878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiLdFIOl9PlXIMdxcVYmcXmwvstc2sRWR+kyhh3rVZM=;
        b=rYXVURV4B/iw4SXMlsdX1b7GaYKdrhVZds3tuBhoZiN3iFATIM6PhZtSJZdNIHN33K
         vFo2DFzBOKniQSUKst277SMI1TSzfQVTzvjcjxni2KEw7DWv1YUbYiQBwKkoT5JZXX7/
         4LkzQuTSDMsGMJLeknSksrllO1ow1ZZmHaHU738AIxiKxEmOOEIV+FTLAbJyZhp9nyoY
         6NJTHlyJ5+msb005aX+cWjzwv/A/e4a/uGhtyohM4CNGOK57Gq91L1e8p3ZB6qDollge
         vEPXTaUB6kXcQ4IGf6vLZYpssPnnt0OjinIwekmVLiKaKdG/UTQJpJthm3iFKxIyxKQX
         W6oA==
X-Forwarded-Encrypted: i=1; AJvYcCXaCqIFGj9ithZqvzivNc5uGJCYjLe7XrprAq+i3FnAKcRrS/mcUh0fgNBld1qWfp0ApnI97rI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrjmCUxCYYta0c5BhC4A3MPhH67YwUji7ryIZRS1RLJlssdRLN
	zcnZacBxrGeiYFZRu84CX03Gvy559K9S3Ctn/MLSAE+78b+CqdHNbHZrWNpTaPNcA3OmWEW+9H0
	ywym74XfIoBGBStSYxC+wC6geVW1qB4BR85asmfPn0aRQLn69KCveNk1zA/VG94yV
X-Gm-Gg: ATEYQzzoCPsjnwrMedlc1Y/IJmDa79TDpJPy3V+RtPD6XbkgfEXks17MU7+ULm4V+kv
	TgJLabCo9W6HgyW4C5WbY3jBSBiQdq66M6zVH18OnnKopykJeJroU8M69JHBwfdiGa3vj+gQne8
	6XH76vGRGP1N2rCmMwItqOSfaIUd0bUqaBikZl1jt75c8JQcCquam9kyD3ix1XOwCOMq4dtust6
	GaQjtgXcNg78m/zIhrDaNK9DNFO/8Lhm7Hwz/MlCe8o9h94TU2QuSateVtULHdBrWZKRJ+ehdYf
	M01WTYSE1DHIFgHR4hpufPGFPkHuwh75WjuHQOb1I61UUhX6v693FfKHP3WpbzUbNDZXXr84bxo
	X6XXlsIto0rg6OXVNghlebz8fW7RrpDLn3/C55Xlf51Qkk/3pUm7pFcBBLaZqlm+aVqHLYO1ee0
	OqgsaEYE+hPt2QpFLv0KfNYjBl2uZz+BYy4gc=
X-Received: by 2002:a05:620a:4055:b0:8cd:8938:eff4 with SMTP id af79cd13be357-8cd8938f34amr639761485a.16.1773101077969;
        Mon, 09 Mar 2026 17:04:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:8cd:8938:eff4 with SMTP id af79cd13be357-8cd8938f34amr639757885a.16.1773101077459;
        Mon, 09 Mar 2026 17:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1139sm2074911fa.5.2026.03.09.17.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:36 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:33 +0200
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
Subject: Re: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead
 of defining it locally
Message-ID: <4py26yy2xkroj26amwxu6q3ynlvla5fmoyju7xu57ncgo7zswb@dvujowt2rxmm>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af6016 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=R5u7ATk22_IFkQxjSk0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dDG5qcHztEnUMMtefFFsntwgI33tZ3Xu
X-Proofpoint-GUID: dDG5qcHztEnUMMtefFFsntwgI33tZ3Xu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX0SbGBG3fLzed
 QbWa/3Z3NQ6/QGfHrhx0LwURyuQTSm1hypSvS8H6Kk57vN00lTPJ77mo8puCfD/KZQ5JthXIwGv
 +NG841q1LI14dBfugJ5tfKCY6433t+jiIG/DogQqZIsrnnl7lCjGuC7EiPuUKPTDTWV83TGApmt
 4ZtC2bnhOutfIs0pzZaWMJs+nva3ONffMs4KH6POG9K5tqDpZQIqpe53qKM/M9op9XPnU2/t44B
 zHPrAiDmQZUG76vVfAIxjOV95fOOyivaFUYGvFDpe5fUDg5Ds0V0ImKPCaQcmNrm8AlD8wULXSz
 ngTYQxKMEpVyVrNAehKkaDUYc0Ab2VE35vk66pCC2+ZHmsMPsn8yU9F0yUkOba8MsZUCE3i3hXm
 uvflr1NoZFQ82Df/rS/w9h0k4+7XXsoD/o7fQStwPz4D3EZcfPHCApU1EW7vF7FScEfxGG7ihE3
 EEh5edUpR9lMRQYh3IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000441_126792_71333CA1 
X-CRM114-Status: GOOD (  13.45  )
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

On Tue, Mar 10, 2026 at 12:03:31AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/ipa/ipa_qmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

