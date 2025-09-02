Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE9CA0FFE
	for <ath10k@archiver.kernel.org>; Tue,  2 Sep 2025 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9fvQ31pKfzwJRRXfDXSZPHMBWz1+izeV6boJUKSY1Q=; b=GW5V5cjUWrWQsiN2+O41pF220n
	G0ljXibXuIp+0uJt5C+MnWHesn5gnyS0UILXdDrYvc2vDMtB+gIRqO8Y3gyDtF5hIlJB3uZlB3O6Z
	2OwsLeOA4c0rIsE3FkfWsD8QccavT8moDFUWg9nNApKyKBmaor7wpzEvPI0cAlxQCwO8+bfGc+IDo
	3HkzhgkhHZxIG5FfZTJSWNrnD89ef2yD0KUiomWcj8QHZK8Vv6r8fdJ1KGx4Tgcy3JDqk8/qAPIYU
	aNb5N6U15qkWi0vbdGDzsLCP3y8R21TtiL0XZiAeYdvmS8DNENcaR88+z6M7+nIBuOMv985hFdyfE
	0uvmTkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMZR-0000000G7Kb-14Qe;
	Tue, 02 Sep 2025 08:40:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM5S-0000000Fwio-2uLG
	for ath10k@lists.infradead.org;
	Tue, 02 Sep 2025 08:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=S9fvQ31pKfzwJRRXfDXSZPHMBWz1+izeV6boJUKSY1Q=;
	t=1756800592; x=1758010192; b=VdyqHfRHKJ03cJwthjNqc32MhOFc1LFZd9jAiDMJqHfnym2
	ndznoK7bsMUso+JlO7n2XsWMajNVT4SOIzEa9KIWkeQMnaJZrYSqevU86vkctmqvE8d2KTzpG3FvB
	/Z8URldxx6Dav328IH9L8skIszGWUynidK2SKftcciibAlA427KHYAgQ2xmzTiMoVcgUALZtNkSbv
	YPsprnBo/IpKjltMW+NhzdaP8kOl7VVNhkVIMxhhOkKZKJMP1m0plTiTF/xJSbXZ6Ptb6cgSCiFOB
	LRzf+iVujFHs4qKDZQc6RzyujUi3bOF8awKPG0/tGx6yhodY2c7VmUjTYMUk3iuA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1utM5M-00000008Anl-2o8h;
	Tue, 02 Sep 2025 10:09:48 +0200
Message-ID: <87b92cbeb6c672600ab3530513d8aba5f4b0eb63.camel@sipsolutions.net>
Subject: Re: [PATCH ath-current] wifi: ath10k: Fix connection after GTK
 rekeying
From: Johannes Berg <johannes@sipsolutions.net>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	alexey.klimov@linaro.org
Date: Tue, 02 Sep 2025 10:09:47 +0200
In-Reply-To: <20250902080400.635818-1-loic.poulain@oss.qualcomm.com>
References: <20250902080400.635818-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_010954_750962_867E9886 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, 2025-09-02 at 10:04 +0200, Loic Poulain wrote:
> It appears that not all hardware/firmware implementations support
> group key deletion correctly, which can lead to connection hangs
> and deauthentication following GTK rekeying (delete and install).
>=20
> To avoid this issue, instead of attempting to delete the key using
> the special WMI_CIPHER_NONE value, we now replace the key with an
> invalid (zeroed) value.

Maybe better use a random value, and even try to delete it anyway
afterwards? If it's all zeroes then an attacker can predict it and might
be able to inject frames into the system that way?

johannes

