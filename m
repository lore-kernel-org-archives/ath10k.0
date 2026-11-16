Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEA606A333
	for <ath10k@archiver.kernel.org>; Mon, 16 Nov 2026 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0VoszrD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnIvtiDm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2ivsVLM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=; b=G0VoszrDfBwByg
	0PAyc6A4KVQukcmSn9bwze6Sl3YlnbCLu8O9H34pp9pOtxlT9bD3C3uVjrWTB/nAGvXdvTsygcgDN
	vhGGIUjXuvUm/mQ8ZY8jx/11JZRJQC0m5IKl4MRlN+3trOAJ/lyRiu4YzjO22lzOlJaNVCTm6Oswd
	g0l1bc3TQK7Y6UpGkIO4BabKssbHYht3TSyRMrXEm1ocILAKinGmKDoBxsQfurgdSzvZrkKRDfOyZ
	wUU4fpt5jsDWVYsKkCWLpIYBYFxuTJltRSUvRSTUAYzgRfIb4viPpk+l0qFSH8UGtV5gSVEeYcKp+
	sls4yTiaZTnfBAVVcV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L7-000000044AD-2tVx;
	Mon, 16 Nov 2026 22:38:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L5-0000000449L-1RWf
	for ath10k@lists.infradead.org;
	Mon, 16 Nov 2026 22:38:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfauw2590429
	for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=; b=pnIvtiDmuDZCPh0O
	1eGrYAs/v/Rcct1K4q5n49CELKQzEx55Kr4+IlIeqpVaKnpvQgDW92bxi2GOb2l6
	mH8jQNI9isRRjWdPV/zqciZzAbYBbIxnj5Cpyn6JGYOctIc+TTtSWgvGOFDpyUKu
	XFJh+9TOZUzQah7lCzTLvRafP7n1NNcG4z2uZuy/qyZH8UBSlGE881PYeX4uHKqP
	npqQ+gzxZVuFlTiJ5bfCOiFVgbfka0OWstvq6hcGi6k7ziy+ovkFMo9M/oZ0m/bS
	tL4KKzxoGaQtygcEnrWp2zQm5zgG5+YQ5HJUbeBEa+yG8N1zhMEQT7EAgumnBAxD
	2zL35A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2k3pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so2588239c88.1
        for <ath10k@lists.infradead.org>; Mon, 16 Nov 2026 14:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794868693; x=1795473493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=;
        b=V2ivsVLM13O3xXQ9gO9F0WZQ6xjROy+N3hAEIx/luxnYjyB8xtnmgh7W1l3nMJxp+b
         EXAWvTLKn1JPO4Mjh9cdqh8bLFY14OuYDBMjmagKUKDOcLJ6CcldEKgOgWM0JBKl2+nh
         kgQiQw2jpVZfaoJjPrc/dCrwktGVBZ6UkY1sZaYkEr0q0y+UvcR23+KFxxgp0djqTdVU
         Ip7vfyfUUvvTUmbdVYdGSLQQC9v1Bp3KtxjKfUF6uHKekcnfNREW/UIWo0yNSScAJ1Ht
         t+lnvrh/5IGRhP8jD83OUdkQnsCnFhZZsQ2+a02UhYXfb6DqgBUZIWwWzYV6rDrl9V76
         Jt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868693; x=1795473493;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPY4vU5dJKdGnkB7VGFyWlN/MAfzz28LdMtCnO8ElA0=;
        b=MvrmowA+AC5IdrGpUhvAjJhwd4u4K9mUKwUtlDcBhO08db+HtuIGw7fYJkeu59Gv9u
         LV2ZlT5KqSMADf9qQO+tH56bW9V686nkCmVqbUPYDa+2MBP54ry+XFekV5bwDn13WIWq
         0Rba3XpYyc1mFY1gnzKuDZR/M8DlsT6S2tvtYwGaKXmuqNgwZ9AhI1n0PgVIAXdxmwt5
         Cr+8JBNPypb4d+rhV4EhB1uBw787PpWmjUBZoq70eAUQBbkdHtzXCrtF5CBKjmEA5lig
         N/zF6WY6ONwIuDQ6FVi8EA/R9MhWJd/g3CA1vJaGKbjrlu+S9EzTakEya0JpxlN6MAxS
         Y5KQ==
X-Gm-Message-State: APuU4Z99yLY6Fcf6TwjktpSNYHES+wUxloSzuwHbEsULJuqNum9jlX9o
	JFiKS2bRo0WvIIHga1unIGzpqhFUmableUPDV6OCxC5OEWULXh8GB5jqDkgYHAJ+JmN7FgIz30y
	fDDdcGDVAX/RcXJ2Zhkc+K3H07QvitM+kJlcHixw40OL4DMGrQWIDG8tUN/cbq/XmPlwLkA6U
X-Gm-Gg: AYBFou2bgi0P6R0yAdrFIa32lBaRPU0B3teytAy8OB5Hy09+2YbPxuC1+mk7DkPYp4W
	YRq6YEEbbj8wMoHMIv+O3yThvPbWzr95hLT3jYhmm7sdsgBB/m66hJYa2FojnZEeArl/SIiiQyv
	XhWoJCg2l0DbsSc8ZsREsD7ubExxI3zRBrjB9B/K17JC8lpwq62CKDiO272Ek2PpjnuTozMY3z0
	2LTw1osaUxZvYmaffGwaP/JN3b0yC9CU/S+sh+HCyMkQNGmE4oFUEhKJOLChAhgenR0ScfX/WA3
	7Pn0hnXSpMO8q6KGMp9ytjFRQP8P60npPbo6aJFuCKdML4HxBO54BP33f85qtgwULvnjSJlFiG5
	RxW5wRh70p1e1zVtvv5Yhw9CyJRTX7kVgCBVPiBtWciZQp7K1V0KL7Ag/FS9jZ5Y2g32Vf0adGG
	03CNsZi2dV9Ej/f07Xlp8urPB0x1E=
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr13190256c88.32.1794868693169;
        Mon, 16 Nov 2026 14:38:13 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr13190224c88.32.1794868692495;
        Mon, 16 Nov 2026 14:38:12 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56671938eec.8.2026.11.16.14.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:11 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Tomas Paukrt <tomaspaukrt@email.cz>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
References: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Subject: Re: [PATCH] wifi: ath10k: add hw_params for Atheros QCA9377-7
Message-Id: <179486869169.378600.14299564340172430864.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:38:11 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb85d6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hpYYLnOjLEDpqvt4_78A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfXyat3vC17FVbR
 sNrjgR+rH/EmTnp/HE70XK2HuwR0HIz/n7KL7+fX14TRcktyIyuATIrIKvb/EVDHb9ms7yeCbUb
 VFqzDXFa/dP6I438LynTJP+3d+Sx2Iw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfXweBDp60ev60m
 URYyVqk0TPo9tG2Y5j5UPVBOQzAy3I0z195twtCwlhZc93fjeTJEMzWIpqdGurJjRnM1afzdKaA
 izoMDMJFmEnXnQ9BHRMbKu87JR3KaRSHvSFVlK4Q8aeNvMCNDwuNeyvyJf8l6/ljoOCrfycGAwD
 2RHzSt6IcolHbr6v2VJ5WBOzJ7ybGZynmJlkxIjCbe44Z/1x/Wc/K64TBE+JtB5+b2qyGFjOJ1n
 NDo5P0m7rZciNY5I0ndIxuHKgvM1r7IhyBa5SSVJtTHayUjr7EP8RR6l5vHK63GtykGTXsPNUPk
 gE3xng90MH9sd/OMFcxtj4MkUMEIQCaSf/HI/3Cjz4qT0W8JuJNYKvx5/a5KW8QgqMsMoBqbbWw
 6J5TFZ9qYVuZGcU/zNsU8+g1sfT0gI1Mt2ws6SFkKWQrBG/GvB7gAo8o+yqevYBFQAqMCTYjzMc
 dXO8fJMvru+/qvDowPw==
X-Proofpoint-GUID: 6M86izITanyj9_U8gSF5lrzkMkcy2GgC
X-Proofpoint-ORIG-GUID: 6M86izITanyj9_U8gSF5lrzkMkcy2GgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_143815_512987_C18505CA 
X-CRM114-Status: UNSURE (   7.22  )
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


On Thu, 05 Sep 2024 14:03:35 +0200, Tomas Paukrt wrote:
> Add hw_params for modules based on Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111

Applied, thanks!

[1/1] wifi: ath10k: add hw_params for Atheros QCA9377-7
      commit: af6f1a396cfc477924d84815c5896d3638f16fbf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


