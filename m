Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA40E77188
	for <ath10k@archiver.kernel.org>; Fri,  3 Jan 2025 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Message-Id:Subject:Date:
	Mime-Version:From:Content-Transfer-Encoding:Content-Type:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7LGgsLaEn4E4MwNzNTYwP7H/zKUs7pN3bTk8HyJL/s=; b=OHUfMWQsRwxRk3amTQ5GwqdxMu
	QrxUlinSpmJow/1gFagKhLWSeHpnLa7uJHr+TCD8g5TOSMYQUx1FDycryX5gtdaEY9xFIw9B1ZUTQ
	utRP9lK3QzWMCyiYNBRUAGAH0c02sd27nXaYsgLjXMSdP/Y3j3kaXlCRpRz9ndmQvp0mgaTR5aEdu
	pC9OdP5YyiF/gLgCn8u8ux9NV34rk/GhwZiIp7ICUbL5GEojiBsrrJouUHGlYa3iV8WH01suFeVNo
	Tv+7IFrnp2eqij/WDbxuYQ9V6qcRUWkn43opRZooL1aIAStiRtDMghNc1/n7dwQOK+lT6T7Z721/u
	YQwfOzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiXK-0000000D5oj-3aVZ;
	Fri, 03 Jan 2025 14:20:26 +0000
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiXJ-0000000D5oJ-1ytj
	for ath10k@lists.infradead.org;
	Fri, 03 Jan 2025 14:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735914011;
	bh=E7LGgsLaEn4E4MwNzNTYwP7H/zKUs7pN3bTk8HyJL/s=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:
	 x-icloud-hme;
	b=M+BL9Qgld1vDN/ukKkRPhaokNP7fJ8rjYwYamkyGJEgYxhFdsmBd0uJxckRmaBIHP
	 3g9UztkW/BJbNA4HaX2Ckh0Rc9RbE/GYsbt0AqbCzYCoCPfzClfXTmYpN8eIauptq4
	 0PNc27j58kgdpFWzJkqUdBhdz6bxTZjRXn084qhOe4CTcmtjvJj+n/E6FV4Bgtc0Ga
	 BKyT2Kaw6YXGe3Jpoe6kvlaDI9zGoLBHEjPwB+VHm4jJXDo3WnUEOjoNF8z0W85p1i
	 f5M5UIjMjYB963SzNJNtmDf9LAxd6fxOGK8s1cZN5iUbcc8gNqEsS7mLPzy7iZj5t3
	 zaSuTvoN628jQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 42B14DA0490
	for <ath10k@lists.infradead.org>; Fri,  3 Jan 2025 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: soyblanco701@icloud.com
Mime-Version: 1.0 (1.0)
Date: Fri, 3 Jan 2025 06:19:47 -0800
Subject: Re: Re: linux-stable-4.9.y: please apply serious ath10k security
Message-Id: <30E7A8F1-5110-4B4F-AA4C-9287EA6E842C@icloud.com>
To: ath10k@lists.infradead.org
X-Mailer: iPhone Mail (22C152)
X-Proofpoint-GUID: nhb84SznXCDjYT_TJ9EfdCklf1equ41O
X-Proofpoint-ORIG-GUID: nhb84SznXCDjYT_TJ9EfdCklf1equ41O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=541
 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2501030127
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_062025_522066_3F3ADF71 
X-CRM114-Status: UNSURE (   3.04  )
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

Hello
Sent from my iPhone

