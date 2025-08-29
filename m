Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44167CA0FF9
	for <ath10k@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZxtw3z/9CaxWzHuOMx6eYG39iga0noJxPVFtMhYG7k=; b=ekfUw2iiXvHlqG
	75vJ6SI6VwKKdjwAygDbPesAkt75IYVRyq93XBTjuR9IKkLtsFINNULM5+8Och1P0PsSQiI8CtS7S
	jSn5xaRi/kgc6HXbvmKUBjjJryxD9I/5G10TICAA2gLkrpS6lRIWh8MTuDYqwowtUOPUb1CLydb9F
	IwgUW5c8niFxeIfrPnubeSENWmtcYcsQbyqLUacSy61HJsFxyaOxpWn5uJjhp/cPVvZBLBRpky0J+
	zxMP7hvhvwOMiFnCVvgNcmr4fH75Y4XF4y8sUIXm83is2zqWPTayW8spfQZc6S4jftA3lhw3avq9Y
	U+QqZTFasQIHTRBzRlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lj-00000007AfK-3sgj;
	Sat, 30 Aug 2025 00:48:35 +0000
Received: from mail.notificacionesdecoperu.com ([190.116.59.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us317-00000006YAe-3zKO
	for ath10k@lists.infradead.org;
	Fri, 29 Aug 2025 17:36:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.notificacionesdecoperu.com (Postfix) with ESMTP id 78D0F1CD67AC
	for <ath10k@lists.infradead.org>; Fri, 29 Aug 2025 12:24:32 -0500 (-05)
Received: from mail.notificacionesdecoperu.com ([127.0.0.1])
 by localhost (mail.notificacionesdecoperu.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id VjYR8N2Kpioe for <ath10k@lists.infradead.org>;
 Fri, 29 Aug 2025 12:24:32 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
	by mail.notificacionesdecoperu.com (Postfix) with ESMTP id 437D51CD67AB
	for <ath10k@lists.infradead.org>; Fri, 29 Aug 2025 12:24:32 -0500 (-05)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.notificacionesdecoperu.com 437D51CD67AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=notificacionesbys.com; s=804FB474-00E8-11EF-9D29-D8BF0EF47FA2;
	t=1756488272; bh=IZxtw3z/9CaxWzHuOMx6eYG39iga0noJxPVFtMhYG7k=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=QF3drcweF5H32Lpm8XCd9RsrnK4sVsva9tngMZjosedVTho8OlCFDI3ND4nPu9nYd
	 hxkoy36mmqqfPyG9rHKYZRsOrhk40tYNLrsQVpjRKlDC6aoWqwezj7tknnbl1hkGCo
	 MlQSfaeus2xdWgwJ24NPJH9KVZRL2hzpuOVhcJzjF3r0ldXcLieEUzUzH3drQQNlph
	 O85JqSHukf3gDcjz/qtNb93gPVFndXcV0Hk6YNezmOuVmASPT2uu44GbfjIeadeA1g
	 ysuWZDl+N3Mv3R6BYZLNuh77zZlkdvJH06w0a+bluCOFHU5+Xj1/oDREObW+bzqTCK
	 UpdIhFL+6wNEg==
X-Virus-Scanned: amavis at notificacionesdecoperu.com
Received: from mail.notificacionesdecoperu.com ([127.0.0.1])
 by localhost (mail.notificacionesdecoperu.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id FEQh2m3F4xBt for <ath10k@lists.infradead.org>;
 Fri, 29 Aug 2025 12:24:32 -0500 (-05)
Received: from [45.250.255.20] (unknown [45.250.255.30])
	by mail.notificacionesdecoperu.com (Postfix) with ESMTPSA id AE0E41CD67A6
	for <ath10k@lists.infradead.org>; Fri, 29 Aug 2025 12:24:30 -0500 (-05)
From: Luis Fernandez Consultant <test@notificacionesbys.com>
To: ath10k@lists.infradead.org
Subject: Re:Good Investment Proposal
Date: 29 Aug 2025 19:25:19 +0200
Message-ID: <20250829192519.8C509FB182E5C4A7@notificacionesbys.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_103602_126313_812B45EC 
X-CRM114-Status: UNSURE (  -3.47  )
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
Reply-To: luisfernandezconsultant@gmail.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Good Day, 


My name is Luis Fernandez, I am contacting you because we have investors th=
at have the capacity to invest in any massive project in your country or in=
vest in your existing project that requires funding. Kindly get back to me =
for more details. 


Best Regards,=20

Luis Fernandez

